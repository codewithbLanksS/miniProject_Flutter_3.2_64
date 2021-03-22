import 'dart:convert';

class billModel {
  final String email;
  final String accountname;
  final String account;
  final String status;
  billModel({
    this.email,
    this.accountname,
    this.account,
    this.status,
  });

  billModel copyWith({
    String email,
    String accountname,
    String account,
    String status,
  }) {
    return billModel(
      email: email ?? this.email,
      accountname: accountname ?? this.accountname,
      account: account ?? this.account,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'accountname': accountname,
      'account': account,
      'status': status,
    };
  }

  factory billModel.fromMap(Map<String, dynamic> map) {
    return billModel(
      email: map['email'],
      accountname: map['accountname'],
      account: map['account'],
      status: map['status'],
    );
  }

  String toJson() => json.encode(toMap());

  factory billModel.fromJson(String source) =>
      billModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'billModel(email: $email, accountname: $accountname, account: $account, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is billModel &&
        other.email == email &&
        other.accountname == accountname &&
        other.account == account &&
        other.status == status;
  }

  @override
  int get hashCode {
    return email.hashCode ^
        accountname.hashCode ^
        account.hashCode ^
        status.hashCode;
  }
}
