// To parse this JSON data, do
//
//     final statusModel = statusModelFromJson(jsonString);

import 'dart:convert';

StatusModel statusModelFromJson(String str) => StatusModel.fromJson(json.decode(str));

String statusModelToJson(StatusModel data) => json.encode(data.toJson());

class StatusModel {
    StatusModel({
        this.message,
        this.codenum,
        this.status,
    });

    String message;
    int codenum;
    bool status;

    factory StatusModel.fromJson(Map<String, dynamic> json) => StatusModel(
        message: json["message"],
        codenum: json["codenum"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "codenum": codenum,
        "status": status,
    };
}
