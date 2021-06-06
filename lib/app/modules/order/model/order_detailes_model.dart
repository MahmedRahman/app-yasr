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
        this.requestDetails,
        this.lawyersList,
    });

    List<RequestDetail> requestDetails;
    List<LawyersList> lawyersList;

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        requestDetails: List<RequestDetail>.from(json["request_details"].map((x) => RequestDetail.fromJson(x))),
        lawyersList: List<LawyersList>.from(json["lawyers_list"].map((x) => LawyersList.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "request_details": List<dynamic>.from(requestDetails.map((x) => x.toJson())),
        "lawyers_list": List<dynamic>.from(lawyersList.map((x) => x.toJson())),
    };
}

class LawyersList {
    LawyersList({
        this.idLawyer,
        this.lawyerName,
        this.offerDate,
        this.lawyerOffer,
    });

    String idLawyer;
    String lawyerName;
    String offerDate;
    String lawyerOffer;

    factory LawyersList.fromJson(Map<String, dynamic> json) => LawyersList(
        idLawyer: json["id_lawyer"],
        lawyerName: json["lawyer_name"] == null ? null : json["lawyer_name"],
        offerDate: json["offer_date"],
        lawyerOffer: json["lawyer_offer"],
    );

    Map<String, dynamic> toJson() => {
        "id_lawyer": idLawyer,
        "lawyer_name": lawyerName == null ? null : lawyerName,
        "offer_date": offerDate,
        "lawyer_offer": lawyerOffer,
    };
}

class RequestDetail {
    RequestDetail({
        this.requestedTitle,
        this.clientPhone,
        this.requestedDescription,
        this.requestedDate,
        this.requestedId,
    });

    String requestedTitle;
    String clientPhone;
    String requestedDescription;
    DateTime requestedDate;
    String requestedId;

    factory RequestDetail.fromJson(Map<String, dynamic> json) => RequestDetail(
        requestedTitle: json["requested_title"],
        clientPhone: json["client_phone"],
        requestedDescription: json["requested_description"],
        requestedDate: DateTime.parse(json["requested_date"]),
        requestedId: json["requested_id"],
    );

    Map<String, dynamic> toJson() => {
        "requested_title": requestedTitle,
        "client_phone": clientPhone,
        "requested_description": requestedDescription,
        "requested_date": "${requestedDate.year.toString().padLeft(4, '0')}-${requestedDate.month.toString().padLeft(2, '0')}-${requestedDate.day.toString().padLeft(2, '0')}",
        "requested_id": requestedId,
    };
}
