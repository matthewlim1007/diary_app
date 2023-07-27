import 'package:diary_app/feature/diary/presentation/diary.dart';
import 'package:diary_app/feature/diary/presentation/widgets/diary_card.dart';
import 'package:diary_app/l10n/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  bool? isIncludeToGallery = false;
  DateTime selectedDate = DateTime.now();

  late final TextEditingController _commentTextEditingController;
  late final TextEditingController _diaryDateTextEditingController;
  late final TextEditingController _tagsTextEditingController;

  @override
  void initState() {
    super.initState();

    _commentTextEditingController = TextEditingController();
    _diaryDateTextEditingController =
        TextEditingController(text: DateFormat.yMd().format(selectedDate));
    _tagsTextEditingController = TextEditingController();
  }

  Future<void> _selectDate(BuildContext context) async {
    final today = DateTime.now();

    final minDate = DateTime(
      today.year,
      today.month,
      today.day,
    );

    await showCupertinoModalPopup<void>(
      context: context,
      builder: (ctx) => Container(
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
                  final dateFormat = DateFormat('d MMM yyyy');
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
              child: const Text('OK'),
              onPressed: () => Navigator.of(ctx).pop(),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
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
                        '20041075 | Tap-NS-TAP-North Stratfield',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                Container(
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
                              'Add to site diary',
                              style: Theme.of(context).textTheme.headlineSmall,
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
                              'Add Photos to site diary',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                            const Divider(),
                            const Wrap(
                              children: [],
                            ),
                            PrimaryButton(
                              onPressed: () {},
                              buttonText: 'Add a photo',
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Include in photo gallery'),
                                Checkbox(
                                  value: isIncludeToGallery,
                                  onChanged: (value) {
                                    setState(() {
                                      isIncludeToGallery = value;
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
                              'Comments',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                            const Divider(),
                            TextFormField(),
                          ],
                        ),
                      ),
                      DiaryCard(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Details',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                            TextFormField(),
                            DropdownButtonFormField(
                              items: <DropdownMenuItem>[],
                              onChanged: (item) {},
                            ),
                            DropdownButtonFormField(
                              items: <DropdownMenuItem>[],
                              onChanged: (item) {},
                            ),
                            TextFormField(),
                          ],
                        ),
                      ),
                      DiaryCard(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Link to existing event?',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(fontWeight: FontWeight.bold),
                                ),
                                Checkbox(
                                  value: isIncludeToGallery,
                                  onChanged: (value) {
                                    setState(() {
                                      isIncludeToGallery = value;
                                    });
                                  },
                                ),
                              ],
                            ),
                            TextFormField()
                          ],
                        ),
                      ),
                      PrimaryButton(
                        onPressed: () {},
                        buttonText: 'Next',
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
