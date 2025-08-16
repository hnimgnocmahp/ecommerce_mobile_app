class CheckEmailRequest {
  final String email;

  CheckEmailRequest({required this.email});

  Map<String, dynamic> toJson() => {'email': email};
}

