import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../common/commons.dart' show UserId;

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserInfoModel with _$UserInfoModel {
  const UserInfoModel._();
  const factory UserInfoModel({
    required UserId userId,
    String? displayName,
    String? email,
    String? displayImage,
    @TimestampConverter() DateTime? createdAt,
    @TimestampConverter() DateTime? updatedAt,
  }) = _UserInfoModel;

  const factory UserInfoModel.unknown({
    @Default('') UserId userId,
    @Default('') String? displayName,
    @Default('') String? email,
    @Default('') String? displayImage,
    @TimestampConverter() DateTime? createdAt,
    @TimestampConverter() DateTime? updatedAt,
  }) = _UserInfoModelUnknown;

  factory UserInfoModel.fromJson(Map<String, Object?> json) =>
      _$UserInfoModelFromJson(json);

  factory UserInfoModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return UserInfoModel.fromJson({
      'userId': doc.id,
      ...data,
    });
  }

  /// For writing to Firestore (exclude createdAt if it's an update)
  Map<String, dynamic> toFirestore({bool forUpdate = false}) {
    final map = toJson();
    if (!forUpdate) map['createdAt'] = FieldValue.serverTimestamp();
    map['updatedAt'] = FieldValue.serverTimestamp();
    map.remove('userId'); // Firestore uses doc ID as the identifier
    return map;
  }
}

class TimestampConverter implements JsonConverter<DateTime?, Object?> {
  const TimestampConverter();

  @override
  DateTime? fromJson(Object? json) {
    if (json == null) return null;
    if (json is Timestamp) return json.toDate();
    if (json is String) return DateTime.parse(json);
    return null;
  }

  @override
  Object? toJson(DateTime? object) {
    if (object == null) return null;
    return Timestamp.fromDate(object);
  }
}
