class UserAccount {
  final int id;
  final int accountTypeId;
  final String username;
  final String email;
  final String password;

  UserAccount({
    required this.id,
    required this.accountTypeId,
    required this.username,
    required this.email,
    required this.password,
  });

  factory UserAccount.fromJson(Map<String, dynamic> json) {
    return UserAccount(
      id: json['id'],
      accountTypeId: json['account_type_id'],
      username: json['username'],
      email: json['email'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'account_type_id': accountTypeId,
      'username': username,
      'email': email,
      'password': password,
    };
  }
}
