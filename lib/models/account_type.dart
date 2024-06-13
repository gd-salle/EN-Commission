// lib/model/account_type.dart
class AccountType {
  final int id;
  final String name;

  AccountType({required this.id, required this.name});

  factory AccountType.fromJson(Map<String, dynamic> json) {
    return AccountType(
      id: json['id'],
      name: json['name'],
    );
  }
}
