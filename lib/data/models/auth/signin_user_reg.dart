class SigningUserReg {
  final String email;
  final String password;

  SigningUserReg({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }

  factory SigningUserReg.fromJson(Map<String, dynamic> json) {
    return SigningUserReg(
      email: json['email'],
      password: json['password'],
    );
  }

}