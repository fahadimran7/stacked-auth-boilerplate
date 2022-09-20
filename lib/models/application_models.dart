import 'package:freezed_annotation/freezed_annotation.dart';
part 'application_models.freezed.dart';
part 'application_models.g.dart';

@freezed
abstract class User with _$User {
  User._();

  factory User({
    required String id,
    String? email,
    String? fullName,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
