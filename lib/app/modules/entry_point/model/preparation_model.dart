// To parse this JSON data, do
//
//     final preparationModel = preparationModelFromJson(jsonString);

import 'dart:convert';

PreparationModel preparationModelFromJson(String str) => PreparationModel.fromJson(json.decode(str));

String preparationModelToJson(PreparationModel data) => json.encode(data.toJson());

class PreparationModel {
    PreparationModel({
        this.message,
        this.codenum,
        this.status,
        this.result,
    });

    String message;
    int codenum;
    bool status;
    Result result;

    factory PreparationModel.fromJson(Map<String, dynamic> json) => PreparationModel(
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
        this.allStates,
        this.allRequestedType,
    });

    List<AllState> allStates;
    List<AllRequestedType> allRequestedType;

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        allStates: List<AllState>.from(json["all_states"].map((x) => AllState.fromJson(x))),
        allRequestedType: List<AllRequestedType>.from(json["all_requested_type"].map((x) => AllRequestedType.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "all_states": List<dynamic>.from(allStates.map((x) => x.toJson())),
        "all_requested_type": List<dynamic>.from(allRequestedType.map((x) => x.toJson())),
    };
}

class AllRequestedType {
    AllRequestedType({
        this.requestName,
        this.requestId,
    });

    String requestName;
    int requestId;

    factory AllRequestedType.fromJson(Map<String, dynamic> json) => AllRequestedType(
        requestName: json["request_name"],
        requestId: json["request_id"],
    );

    Map<String, dynamic> toJson() => {
        "request_name": requestName,
        "request_id": requestId,
    };
}

class AllState {
    AllState({
        this.stateName,
        this.stateId,
    });

    String stateName;
    int stateId;

    factory AllState.fromJson(Map<String, dynamic> json) => AllState(
        stateName: json["state_name"],
        stateId: json["state_id"],
    );

    Map<String, dynamic> toJson() => {
        "state_name": stateName,
        "state_id": stateId,
    };
}
