// To parse this JSON data, do
//
//     final ticketsModel = ticketsModelFromJson(jsonString);

import 'dart:convert';

TicketsModel ticketsModelFromJson(String str) => TicketsModel.fromJson(json.decode(str));

String ticketsModelToJson(TicketsModel data) => json.encode(data.toJson());

class TicketsModel {
    TicketsModel({
        this.message,
        this.codenum,
        this.status,
        this.total,
        this.result,
    });

    String message;
    int codenum;
    bool status;
    int total;
    Result result;

    factory TicketsModel.fromJson(Map<String, dynamic> json) => TicketsModel(
        message: json["message"],
        codenum: json["codenum"],
        status: json["status"],
        total: json["total"],
        result: Result.fromJson(json["result"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "codenum": codenum,
        "status": status,
        "total": total,
        "result": result.toJson(),
    };
}

class Result {
    Result({
        this.myTickets,
    });

    List<MyTicket> myTickets;

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        myTickets: List<MyTicket>.from(json["my_tickets"].map((x) => MyTicket.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "my_tickets": List<dynamic>.from(myTickets.map((x) => x.toJson())),
    };
}

class MyTicket {
    MyTicket({
        this.id,
        this.title,
        this.type,
        this.senderType,
        this.color,
        this.content,
        this.createdAt,
    });

    int id;
    String title;
    String type;
    String senderType;
    String color;
    String content;
    DateTime createdAt;

    factory MyTicket.fromJson(Map<String, dynamic> json) => MyTicket(
        id: json["id"],
        title: json["title"],
        type: json["type"],
        senderType: json["sender_type"],
        color: json["color"],
        content: json["content"],
        createdAt: DateTime.parse(json["created_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "type": type,
        "sender_type": senderType,
        "color": color,
        "content": content,
        "created_at": "${createdAt.year.toString().padLeft(4, '0')}-${createdAt.month.toString().padLeft(2, '0')}-${createdAt.day.toString().padLeft(2, '0')}",
    };
}
