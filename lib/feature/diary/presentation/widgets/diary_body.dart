import 'dart:async';
import 'dart:io';

import 'package:diary_app/core/global_widgets/loading_dialog.dart';
import 'package:diary_app/core/utils/image_converter.dart';
import 'package:diary_app/feature/diary/domain/entities/entities.dart';
import 'package:diary_app/feature/diary/presentation/diary.dart';
import 'package:diary_app/l10n/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

/// {@template diary_body}
/// Body of the DiaryPage.
///
/// Add what it does
/// {@endtemplate}
class DiaryBody extends StatefulWidget {
  /// {@macro diary_body}
  const DiaryBody({super.key});

  @override
  State<DiaryBody> createState() => _DiaryBodyState();
}

class _DiaryBodyState extends State<DiaryBody> {
  final _formKey = GlobalKey<FormState>();

  bool _isIncludeToGallery = false;
  bool _isLinkToExistingEvent = false;
  DateTime selectedDate = DateTime.now();

  late final TextEditingController _commentTextEditingController;
  late final TextEditingController _diaryDateTextEditingController;
  late final TextEditingController _tagsTextEditingController;

  final _picker = ImagePicker();
  final _pickedFileList = <XFile>[];

  AreaEntity? _selectedArea;
  TaskCategoryEntity? _selectedTaskCategory;
  EventEntity? _selectedEvent;

  // Defined values for dropdowns
  final List<AreaEntity> _areas = const [
    AreaEntity(id: 1, name: 'Area 1'),
    AreaEntity(id: 2, name: 'Area 2'),
    AreaEntity(id: 3, name: 'Area 3'),
  ];

  final List<TaskCategoryEntity> _taskCategories = const [
    TaskCategoryEntity(id: 1, name: 'Task Category 1'),
    TaskCategoryEntity(id: 2, name: 'Task Category 2'),
    TaskCategoryEntity(id: 3, name: 'Task Category 3'),
  ];

  final List<EventEntity> _events = const [
    EventEntity(id: 1, name: 'Event 1'),
    EventEntity(id: 2, name: 'Event 2'),
    EventEntity(id: 3, name: 'Event 3'),
  ];

  @override
  void initState() {
    super.initState();

    _commentTextEditingController = TextEditingController();
    _diaryDateTextEditingController = TextEditingController(
      text: DateFormat('yyyy-MM-d').format(selectedDate),
    );
    _tagsTextEditingController = TextEditingController();
  }

  @override
  void dispose() {
    _commentTextEditingController.dispose();
    _diaryDateTextEditingController.dispose();
    _tagsTextEditingController.dispose();
    super.dispose();
  }

  /// Opens a dialog where you can select a date
  Future<void> _selectDate(BuildContext context) async {
    final today = DateTime.now();

    final minDate = DateTime(
      today.year,
      today.month,
      today.day,
    );

    await showCupertinoModalPopup<void>(
      context: context,
      builder: (ctx) {
        final l10n = context.l10n;
        return Container(
          height: 500,
          color: const Color.fromARGB(255, 255, 255, 255),
          child: Column(
            children: [
              SizedBox(
                height: 400,
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.date,
                  initialDateTime: selectedDate,
                  minimumDate: minDate,
                  onDateTimeChanged: (val) {
                    final dateFormat = DateFormat('yyyy-MM-d');
                    setState(() {
                      selectedDate = val;
                      _diaryDateTextEditingController.value = TextEditingValue(
                        text: dateFormat.format(val),
                      );
                    });
                  },
                ),
              ),

              // Close the modal
              CupertinoButton(
                child: Text(l10n.okTitle),
                onPressed: () => Navigator.of(ctx).pop(),
              )
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return BlocListener<DiaryBloc, DiaryState>(
      listener: (context, state) async {
        if (state is DiaryLoading) {
          unawaited(const LoadingDialog().show(context));
        } else {
          Navigator.of(context).pop();
        }

        if (state is DiaryCreationFailed) {
          await showDialog<void>(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                titlePadding: const EdgeInsets.only(
                  top: 24,
                  right: 24,
                  left: 24,
                ),
                title: Text(
                  l10n.errorTitle,
                  textAlign: TextAlign.center,
                ),
                content: Text(
                  l10n.errorMessage,
                  textAlign: TextAlign.center,
                ),
                actions: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 24,
                      right: 24,
                      left: 24,
                    ),
                    child: PrimaryButton(
                      buttonText: l10n.okTitle,
                      onPressed: () async {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ],
              );
            },
          );
        } else if (state is DiaryEntryCreated) {
          await showDialog<void>(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                titlePadding: const EdgeInsets.only(
                  top: 24,
                  right: 24,
                  left: 24,
                ),
                title: Text(
                  l10n.successTitle,
                  textAlign: TextAlign.center,
                ),
                content: Text(
                  l10n.sucessMessage,
                  textAlign: TextAlign.center,
                ),
                actions: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 24,
                      right: 24,
                      left: 24,
                    ),
                    child: PrimaryButton(
                      buttonText: l10n.okTitle,
                      onPressed: () async {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ],
              );
            },
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          leading: const Icon(Icons.close),
          title: Text(
            l10n.newDiaryTitle,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: Colors.white,
                ),
          ),
        ),
        body: CustomScrollView(
          slivers: <Widget>[
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: Colors.grey,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          l10n.address,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  Form(
                    key: _formKey,
                    child: Container(
                      color: const Color(0xffadadad).withOpacity(0.15),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  l10n.addDiaryTitle,
                                  style:
                                      Theme.of(context).textTheme.headlineSmall,
                                ),
                                const Icon(
                                  Icons.help,
                                  color: Colors.grey,
                                )
                              ],
                            ),
                          ),
                          DiaryCard(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  l10n.addPhotosTitle,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(fontWeight: FontWeight.bold),
                                ),
                                const Divider(
                                  height: 25,
                                ),
                                Wrap(
                                  spacing: 12,
                                  runSpacing: 12,
                                  children: _pickedFileList
                                      .map(
                                        (e) => Stack(
                                          children: [
                                            Container(
                                              width: 70,
                                              height: 70,
                                              padding: const EdgeInsets.only(
                                                top: 10,
                                                right: 10,
                                              ),
                                              child: SizedBox(
                                                width: 60,
                                                height: 60,
                                                child: OverflowBox(
                                                  child: Image.file(
                                                    File(e.path),
                                                    fit: BoxFit.fitWidth,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              top: -10,
                                              right: -10,
                                              child: IconButton(
                                                onPressed: () {
                                                  setState(() {
                                                    _pickedFileList.remove(e);
                                                  });
                                                },
                                                icon: CircleAvatar(
                                                  radius: 12,
                                                  backgroundColor:
                                                      Theme.of(context)
                                                          .primaryColor,
                                                  child: const Icon(
                                                    Icons.close,
                                                    color: Colors.white,
                                                    size: 16,
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                      .toList(),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                PrimaryButton(
                                  onPressed: () async {
                                    final pickedFileList =
                                        await _picker.pickMultiImage(
                                      imageQuality: 100,
                                    );

                                    setState(() {
                                      _pickedFileList.addAll(pickedFileList);
                                    });
                                  },
                                  buttonText: l10n.addPhotosTitle,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(l10n.includeInPhotoGalleryText),
                                    Checkbox(
                                      value: _isIncludeToGallery,
                                      onChanged: (value) {
                                        setState(() {
                                          _isIncludeToGallery = value ?? false;
                                        });
                                      },
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          DiaryCard(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  l10n.commentTitle,
                                  maxLines: 4,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(fontWeight: FontWeight.bold),
                                ),
                                const Divider(
                                  height: 25,
                                ),
                                TextFormField(
                                  controller: _commentTextEditingController,
                                  decoration: InputDecoration(
                                    hintText: l10n.commentTitle,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          ),
                          DiaryCard(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  l10n.detailsTitle,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(fontWeight: FontWeight.bold),
                                ),
                                const Divider(
                                  height: 25,
                                ),
                                TextFormField(
                                  controller: _diaryDateTextEditingController,
                                  readOnly: true,
                                  onTap: () => _selectDate(context),
                                  decoration: InputDecoration(
                                    suffixIconConstraints: BoxConstraints.tight(
                                      const Size(25, 25),
                                    ),
                                    suffixIcon: const Icon(
                                      Icons.keyboard_arrow_down_outlined,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                DropdownButtonFormField<AreaEntity>(
                                  value: _selectedArea,
                                  icon: const Icon(
                                    Icons.keyboard_arrow_down_outlined,
                                  ),
                                  hint: Text(l10n.selectAreaHint),
                                  items: _areas
                                      .map(
                                        (e) => DropdownMenuItem<AreaEntity>(
                                          value: e,
                                          child: Text(e.name),
                                        ),
                                      )
                                      .toList(),
                                  onChanged: (item) {
                                    setState(() {
                                      _selectedArea = item;
                                    });
                                  },
                                  validator: (value) {
                                    if (_selectedTaskCategory == null) {
                                      return l10n.areaRequiredText;
                                    }

                                    return null;
                                  },
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                DropdownButtonFormField<TaskCategoryEntity>(
                                  value: _selectedTaskCategory,
                                  icon: const Icon(
                                    Icons.keyboard_arrow_down_outlined,
                                  ),
                                  hint: Text(l10n.taskCategoryTitle),
                                  items: _taskCategories
                                      .map(
                                        (e) => DropdownMenuItem<
                                            TaskCategoryEntity>(
                                          value: e,
                                          child: Text(e.name),
                                        ),
                                      )
                                      .toList(),
                                  onChanged: (item) {
                                    setState(() {
                                      _selectedTaskCategory = item;
                                    });
                                  },
                                  validator: (value) {
                                    if (_selectedTaskCategory == null) {
                                      return l10n.taskCategoryRequiredText;
                                    }

                                    return null;
                                  },
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  controller: _tagsTextEditingController,
                                  decoration:
                                      InputDecoration(hintText: l10n.tagHint),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return l10n.tagRequireText;
                                    }

                                    return null;
                                  },
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          ),
                          DiaryCard(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      l10n.linkToEventTitle,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium
                                          ?.copyWith(
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    Checkbox(
                                      value: _isLinkToExistingEvent,
                                      onChanged: (value) {
                                        setState(() {
                                          _isLinkToExistingEvent =
                                              value ?? false;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                                DropdownButtonFormField<EventEntity>(
                                  value: _selectedEvent,
                                  hint: Text(l10n.selectEventHint),
                                  items: _events
                                      .map(
                                        (e) => DropdownMenuItem<EventEntity>(
                                          value: e,
                                          child: Text(e.name),
                                        ),
                                      )
                                      .toList(),
                                  onChanged: _isLinkToExistingEvent
                                      ? (item) {
                                          setState(() {
                                            _selectedEvent = item;
                                          });
                                        }
                                      : null,
                                  validator: (value) {
                                    if (_isLinkToExistingEvent &&
                                        _selectedEvent == null) {
                                      return l10n.eventRequiredText;
                                    }

                                    return null;
                                  },
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          ),
                          PrimaryButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                // Converts the XFile images to base64 strings
                                final images =
                                    xFilesToBase64List(_pickedFileList);

                                final diaryEntity = DiaryEntity(
                                  comments:
                                      _commentTextEditingController.text.trim(),
                                  diaryDate: _diaryDateTextEditingController
                                      .text
                                      .trim(),
                                  areaId: _selectedArea!.id,
                                  taskCategoryId: _selectedTaskCategory!.id,
                                  images: images,
                                  isIncludeInPhotoGallery: _isIncludeToGallery,
                                  tags: _tagsTextEditingController.text
                                      .trim()
                                      .split(','),
                                  eventId: _isLinkToExistingEvent
                                      ? _selectedEvent!.id
                                      : null,
                                );

                                context.read<DiaryBloc>().add(
                                      CreateDiaryEntryEvent(
                                        diaryEntity: diaryEntity,
                                      ),
                                    );
                              }
                            },
                            buttonText: l10n.nextButtonTitle,
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
