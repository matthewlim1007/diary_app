import 'package:equatable/equatable.dart';

/// {@template DiaryEntity}
/// The entity class for the diary entry
/// {@endTemplate}
class DiaryEntity extends Equatable {
  /// {@macro DiaryEntity}
  const DiaryEntity({
    required this.comments,
    required this.diaryDate,
    required this.areaId,
    required this.taskCategoryId,
    required this.images,
    required this.isIncludeInPhotoGallery,
    required this.tags,
    this.eventId,
  });

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
}
