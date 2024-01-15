// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

@freezed
class UserModel with _$UserModel {
    const factory UserModel({
        int? page,
        int? perPage,
        int? total,
        int? totalPages,
        List<Datum>? data,
        Support? support,
    }) = _UserModel;

    factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}

@freezed
class Datum with _$Datum {
    const factory Datum({
        int? id,
        String? email,
        String? firstName,
        String? lastName,
        String? avatar,
    }) = _Datum;

    factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);
}

@freezed
class Support with _$Support {
    const factory Support({
        String? url,
        String? text,
    }) = _Support;

    factory Support.fromJson(Map<String, dynamic> json) => _$SupportFromJson(json);
}
