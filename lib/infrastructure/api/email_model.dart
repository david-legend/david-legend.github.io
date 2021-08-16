import 'dart:convert';

Email emailModelFromJson(String str) => Email.fromJson(json.decode(str));

String emailModelToJson(Email data) => json.encode(data.toJson());

class Email {
  Email({
   required this.status,
  });

  String status;

  factory Email.fromJson(Map<String, dynamic> json) => Email(
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
      };
}