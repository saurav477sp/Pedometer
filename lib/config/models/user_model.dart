class UserModel {
  final String email;
  final String userName;

  UserModel({
    required this.email,
    required this.userName,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      email: map['email'] ?? '',
      userName: map['userName'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'userName': userName,
    };
  }
}
