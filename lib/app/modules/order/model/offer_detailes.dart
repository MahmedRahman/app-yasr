// To parse this JSON data, do
//
//     final requestedOfferModel = requestedOfferModelFromJson(jsonString);

import 'dart:convert';

RequestedOfferModel requestedOfferModelFromJson(String str) => RequestedOfferModel.fromJson(json.decode(str));

String requestedOfferModelToJson(RequestedOfferModel data) => json.encode(data.toJson());

class RequestedOfferModel {
    RequestedOfferModel({
        this.message,
        this.codenum,
        this.status,
        this.result,
    });

    String message;
    int codenum;
    bool status;
    Result result;

    factory RequestedOfferModel.fromJson(Map<String, dynamic> json) => RequestedOfferModel(
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
    LawyersList lawyersList;

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        requestDetails: List<RequestDetail>.from(json["request_details"].map((x) => RequestDetail.fromJson(x))),
        lawyersList: LawyersList.fromJson(json["lawyers_list"]),
    );

    Map<String, dynamic> toJson() => {
        "request_details": List<dynamic>.from(requestDetails.map((x) => x.toJson())),
        "lawyers_list": lawyersList.toJson(),
    };
}

class LawyersList {
    LawyersList({
        this.idLawyer,
        this.lawyerName,
        this.lawyerPhone,
        this.offerDate,
        this.lawyerOffer,
    });

    String idLawyer;
    String lawyerName;
    String lawyerPhone;
    String offerDate;
    String lawyerOffer;

    factory LawyersList.fromJson(Map<String, dynamic> json) => LawyersList(
        idLawyer: json["id_lawyer"],
        lawyerName: json["lawyer_name"],
        lawyerPhone: json["lawyer_phone"],
        offerDate: json["offer_date"],
        lawyerOffer: json["lawyer_offer"],
    );

    Map<String, dynamic> toJson() => {
        "id_lawyer": idLawyer,
        "lawyer_name": lawyerName,
        "lawyer_phone": lawyerPhone,
        "offer_date": offerDate,
        "lawyer_offer": lawyerOffer,
    };
}

class RequestDetail {
    RequestDetail({
        this.requestedTitle,
        this.requestedDescription,
        this.requestedDate,
        this.requestedId,
    });

    String requestedTitle;
    String requestedDescription;
    DateTime requestedDate;
    String requestedId;

    factory RequestDetail.fromJson(Map<String, dynamic> json) => RequestDetail(
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
