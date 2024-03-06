// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'author_model.freezed.dart';
part 'author_model.g.dart';

@Freezed()
class AuthorModel with _$AuthorModel {
  const AuthorModel._();
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory AuthorModel(
    int id,
    String picture,
    String firstName,
    String lastName,
  ) = _AuthorModel;

  String get name {
    return '$firstName $lastName';
  }

  factory AuthorModel.fromJson(Map<String, dynamic> json) =>
      _$AuthorModelFromJson(json);
}
