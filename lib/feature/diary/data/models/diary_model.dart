import 'package:equatable/equatable.dart';

/// {@template diary_model}
/// DiaryModel description
/// {@endtemplate}
class DiaryModel extends Equatable {
  /// {@macro diary_model}
  const DiaryModel({
    required this.comments,
    required this.diaryDate,
    required this.areaId,
    required this.taskCategoryId,
    required this.images,
    required this.isIncludeInPhotoGallery,
    required this.tags,
    this.eventId,
  });

  /// Creates a DiaryModel from Json map
  factory DiaryModel.fromJson(Map<String, dynamic> json) => DiaryModel(
        comments: json['comments'] as String,
        diaryDate: json['diaryDate'] as String,
        areaId: json['areaId'] as int,
        taskCategoryId: json['taskCategoryId'] as int,
        images: json['images'] as List<String>,
        isIncludeInPhotoGallery: json['isIncludeInPhotoGallery'] as bool,
        tags: json['tags'] as List<String?>,
        eventId: json['eventId'] as int?,
      );

  /// The comments on the diary entry
  final String comments;

  /// The diary entry date
  final String diaryDate;

  /// The area Id of the diary entry
  final int areaId;

  /// The task category Id of the diary entry
  final int taskCategoryId;

  /// The list of image in base64 format to be uploaded with the
  /// diary entry
  final List<String> images;

  /// Returns `true` if the [images] are going to be included
  /// on the photo gallery
  final bool isIncludeInPhotoGallery;

  /// The list of tags for the diary entry
  final List<String?> tags;

  /// The event id of the diary entry
  final int? eventId;

  /// Creates a copy of the current DiaryModel with property changes
  DiaryModel copyWith({
    String? comments,
    String? diaryDate,
    int? areaId,
    int? taskCategoryId,
    List<String>? images,
    bool? isIncludeInPhotoGallery,
    List<String?>? tags,
    int? Function()? eventId,
  }) {
    return DiaryModel(
      comments: comments ?? this.comments,
      diaryDate: diaryDate ?? this.diaryDate,
      areaId: areaId ?? this.areaId,
      taskCategoryId: taskCategoryId ?? this.taskCategoryId,
      images: images ?? this.images,
      isIncludeInPhotoGallery:
          isIncludeInPhotoGallery ?? this.isIncludeInPhotoGallery,
      tags: tags ?? this.tags,
      eventId: eventId != null ? eventId() : this.eventId,
    );
  }

  @override
  List<Object?> get props => [
        comments,
        diaryDate,
        areaId,
        taskCategoryId,
        images,
        isIncludeInPhotoGallery,
        tags,
        eventId,
      ];

  /// Creates a Json map from a DiaryModel
  Map<String, dynamic> toJson() => <String, dynamic>{
        'comments': comments,
        'diaryDate': diaryDate,
        'areaId': areaId,
        'taskCategoryId': taskCategoryId,
        'images': images,
        'isIncludeInPhotoGallery': isIncludeInPhotoGallery,
        'tags': tags,
        'eventId': eventId,
      };

  /// Creates a toString() override for DiaryModel
  @override
  String toString() => 'DiaryModel(comments: $comments, '
      'diaryDate: $diaryDate, '
      'areaId: $areaId, '
      'taskCategoryId: $taskCategoryId, '
      'images: $images, '
      'isIncludeInPhotoGallery: $isIncludeInPhotoGallery, '
      'tags: $tags, '
      'eventId: $eventId)';
}
