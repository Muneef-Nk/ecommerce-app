class LoginModel {
  final bool status;
  final String? messages;

  LoginModel({required this.status, this.messages});

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      status: json['status'] ?? false,
      messages: json['messages'] as String?,
    );
  }
}
