// To parse this JSON data, do
//
//     final requestedLawerDetailesModel = requestedLawerDetailesModelFromJson(jsonString);

import 'dart:convert';

RequestedLawerDetailesModel requestedLawerDetailesModelFromJson(String str) => RequestedLawerDetailesModel.fromJson(json.decode(str));

String requestedLawerDetailesModelToJson(RequestedLawerDetailesModel data) => json.encode(data.toJson());

class RequestedLawerDetailesModel {
    RequestedLawerDetailesModel({
        this.message,
        this.codenum,
        this.status,
        this.result,
    });

    String message;
    int codenum;
    bool status;
    Result result;

    factory RequestedLawerDetailesModel.fromJson(Map<String, dynamic> json) => RequestedLawerDetailesModel(
        message: json["message"],
        codenum: json["codenum"],
        status: json["status"],
        result: Result.fromJson(json["result"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "codenum": codenum,
        "status": status,
        "result": result.toJson(),
    };
}

class Result {
    Result({
        this.requestDetails,
        this.listSound,
        this.listSlider,
    });

    List<RequestDetail> requestDetails;
    List<dynamic> listSound;
    List<ListSlider> listSlider;

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        requestDetails: List<RequestDetail>.from(json["request_details"].map((x) => RequestDetail.fromJson(x))),
        listSound: List<dynamic>.from(json["list_sound"].map((x) => x)),
        listSlider: List<ListSlider>.from(json["list_slider"].map((x) => ListSlider.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "request_details": List<dynamic>.from(requestDetails.map((x) => x.toJson())),
        "list_sound": List<dynamic>.from(listSound.map((x) => x)),
        "list_slider": List<dynamic>.from(listSlider.map((x) => x.toJson())),
    };
}

class ListSlider {
    ListSlider({
        this.imgLink,
        this.soundId,
    });

    String imgLink;
    String soundId;

    factory ListSlider.fromJson(Map<String, dynamic> json) => ListSlider(
        imgLink: json["img_link"],
        soundId: json["sound_id"],
    );

    Map<String, dynamic> toJson() => {
        "img_link": imgLink,
        "sound_id": soundId,
    };
}

class RequestDetail {
    RequestDetail({
        this.requestedTitle,
        this.requestedDescription,
        this.requestedDate,
        this.clientPhone,
        this.requestedId,
    });

    String requestedTitle;
    String requestedDescription;
    DateTime requestedDate;
    String clientPhone;
    String requestedId;

    factory RequestDetail.fromJson(Map<String, dynamic> json) => RequestDetail(
        requestedTitle: json["requested_title"],
        requestedDescription: json["requested_description"],
        requestedDate: DateTime.parse(json["requested_date"]),
        clientPhone: json["client_phone"],
        requestedId: json["requested_id"],
    );

    Map<String, dynamic> toJson() => {
        "requested_title": requestedTitle,
        "requested_description": requestedDescription,
        "requested_date": "${requestedDate.year.toString().padLeft(4, '0')}-${requestedDate.month.toString().padLeft(2, '0')}-${requestedDate.day.toString().padLeft(2, '0')}",
        "client_phone": clientPhone,
        "requested_id": requestedId,
    };
}
