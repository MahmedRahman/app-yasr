// To parse this JSON data, do
//
//     final homeLawerRequestModel = homeLawerRequestModelFromJson(jsonString);

import 'dart:convert';

HomeLawerRequestModel homeLawerRequestModelFromJson(String str) => HomeLawerRequestModel.fromJson(json.decode(str));

String homeLawerRequestModelToJson(HomeLawerRequestModel data) => json.encode(data.toJson());

class HomeLawerRequestModel {
    HomeLawerRequestModel({
        this.message,
        this.codenum,
        this.status,
        this.result,
    });

    String message;
    int codenum;
    bool status;
    Result result;

    factory HomeLawerRequestModel.fromJson(Map<String, dynamic> json) => HomeLawerRequestModel(
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
        this.allRequests,
    });

    List<AllRequest> allRequests;

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        allRequests: List<AllRequest>.from(json["all_requests"].map((x) => AllRequest.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "all_requests": List<dynamic>.from(allRequests.map((x) => x.toJson())),
    };
}

class AllRequest {
    AllRequest({
        this.requestedTitle,
        this.requestedState,
        this.requestedDate,
        this.requestedId,
    });

    String requestedTitle;
    String requestedState;
    DateTime requestedDate;
    String requestedId;

    factory AllRequest.fromJson(Map<String, dynamic> json) => AllRequest(
        requestedTitle: json["requested_title"],
        requestedState: json["requested_state"],
        requestedDate: DateTime.parse(json["requested_date"]),
        requestedId: json["requested_id"],
    );

    Map<String, dynamic> toJson() => {
        "requested_title": requestedTitle,
        "requested_state": requestedState,
        "requested_date": "${requestedDate.year.toString().padLeft(4, '0')}-${requestedDate.month.toString().padLeft(2, '0')}-${requestedDate.day.toString().padLeft(2, '0')}",
        "requested_id": requestedId,
    };
}
