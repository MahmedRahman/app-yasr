// To parse this JSON data, do
//
//     final requestedDetailesModel = requestedDetailesModelFromJson(jsonString);

import 'dart:convert';

RequestedDetailesModel requestedDetailesModelFromJson(String str) => RequestedDetailesModel.fromJson(json.decode(str));

String requestedDetailesModelToJson(RequestedDetailesModel data) => json.encode(data.toJson());

class RequestedDetailesModel {
    RequestedDetailesModel({
        this.message,
        this.codenum,
        this.status,
        this.result,
    });

    String message;
    int codenum;
    bool status;
    Result result;

    factory RequestedDetailesModel.fromJson(Map<String, dynamic> json) => RequestedDetailesModel(
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
        this.requesteDetails,
        this.lawyersList,
    });

    List<RequesteDetail> requesteDetails;
    List<dynamic> lawyersList;

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        requesteDetails: List<RequesteDetail>.from(json["requeste_details"].map((x) => RequesteDetail.fromJson(x))),
        lawyersList: List<dynamic>.from(json["lawyers_list"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "requeste_details": List<dynamic>.from(requesteDetails.map((x) => x.toJson())),
        "lawyers_list": List<dynamic>.from(lawyersList.map((x) => x)),
    };
}

class RequesteDetail {
    RequesteDetail({
        this.requestedTitle,
        this.requestedDescription,
        this.requestedDate,
        this.requestedId,
    });

    String requestedTitle;
    String requestedDescription;
    DateTime requestedDate;
    String requestedId;

    factory RequesteDetail.fromJson(Map<String, dynamic> json) => RequesteDetail(
        requestedTitle: json["requested_title"],
        requestedDescription: json["requested_description"],
        requestedDate: DateTime.parse(json["requested_date"]),
        requestedId: json["requested_id"],
    );

    Map<String, dynamic> toJson() => {
        "requested_title": requestedTitle,
        "requested_description": requestedDescription,
        "requested_date": "${requestedDate.year.toString().padLeft(4, '0')}-${requestedDate.month.toString().padLeft(2, '0')}-${requestedDate.day.toString().padLeft(2, '0')}",
        "requested_id": requestedId,
    };
}
