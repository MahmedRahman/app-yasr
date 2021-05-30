// To parse this JSON data, do
//
//     final customerInfoModel = customerInfoModelFromJson(jsonString);

import 'dart:convert';

CustomerInfoModel customerInfoModelFromJson(String str) => CustomerInfoModel.fromJson(json.decode(str));

String customerInfoModelToJson(CustomerInfoModel data) => json.encode(data.toJson());

class CustomerInfoModel {


    CustomerInfoModel({
        this.message,
        this.codenum,
        this.status,
        this.result,
    });


    String message;
    int codenum;
    bool status;
    Result result;


    factory CustomerInfoModel.fromJson(Map<String, dynamic> json) => CustomerInfoModel(
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
        this.customerInfo,
    });

    CustomerInfo customerInfo;

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        customerInfo: CustomerInfo.fromJson(json["customer_info"]),
    );

    Map<String, dynamic> toJson() => {
        "customer_info": customerInfo.toJson(),
    };
}

class CustomerInfo {
    CustomerInfo({
        this.id,
        this.idNumber,
        this.fullname,
        this.phone,
        this.address,
        this.clientType,
        this.permissionLawyer,
        this.lawyerType,
        this.cityId,
        this.activationCode,
        this.token,
    });

    int id;
    String idNumber;
    String fullname;
    String phone;
    String address;
    String clientType;
    String permissionLawyer;
    String lawyerType;
    String cityId;
    String activationCode;
    String token;

    factory CustomerInfo.fromJson(Map<String, dynamic> json) => CustomerInfo(
        id: json["id"],
        idNumber: json["id_number"],
        fullname: json["fullname"],
        phone: json["phone"],
        address: json["address"],
        clientType: json["client_type"],
        permissionLawyer: json["permission_lawyer"],
        lawyerType: json["lawyer_type"],
        cityId: json["city_id"],
        activationCode: json["activation_code"],
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "id_number": idNumber,
        "fullname": fullname,
        "phone": phone,
        "address": address,
        "client_type": clientType,
        "permission_lawyer": permissionLawyer,
        "lawyer_type": lawyerType,
        "city_id": cityId,
        "activation_code": activationCode,
        "token": token,
    };
}
