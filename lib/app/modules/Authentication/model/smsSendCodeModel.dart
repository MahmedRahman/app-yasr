// To parse this JSON data, do
//
//     final smsSendCodeModel = smsSendCodeModelFromJson(jsonString);

import 'dart:convert';

SmsSendCodeModel smsSendCodeModelFromJson(String str) => SmsSendCodeModel.fromJson(json.decode(str));

String smsSendCodeModelToJson(SmsSendCodeModel data) => json.encode(data.toJson());

class SmsSendCodeModel {
    SmsSendCodeModel({
        this.status,
        this.result,
    });

    bool status;
    Result result;

    factory SmsSendCodeModel.fromJson(Map<String, dynamic> json) => SmsSendCodeModel(
        status: json["status"],
        result: Result.fromJson(json["result"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "result": result.toJson(),
    };
}

class Result {
    Result({
        this.message,
        this.phone,
        this.activationCode,
    });

    String message;
    String phone;
    String activationCode;

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        message: json["message"],
        phone: json["phone"],
        activationCode: json["activation_code"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "phone": phone,
        "activation_code": activationCode,
    };
}
