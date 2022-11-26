import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_app_getx/data/models/base_model.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class User with _$User implements BaseModel {
  const factory User({
    String? uid,
    String? username,
    String? password,
    String? email,
    String? photoAvatarUrl,
    DateTime? userCreatedDate,
    List<Map<String, dynamic>>? taskLists,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
