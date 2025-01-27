class RegisterModel {
  bool? status;
  String? message;

  RegisterModel({
    this.status,
    this.message,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
      };
}
