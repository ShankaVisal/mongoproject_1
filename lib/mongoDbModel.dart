import 'package:mongo_dart/mongo_dart.dart';

class User {
  ObjectId? id;
  late String username;
  late String email;
  late String address;

  User(this.username, this.email, this.address);

  User.fromJson(Map<String, dynamic> json)
      : id = json['_id'] != null ? ObjectId.parse(json['_id']) : null,
        username = json['username'],
        email = json['email'],
        address = json['address'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'username': username,
      'email': email,
      'address': address,
    };
    if (id != null) {
      data['_id'] = id!.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'User{id: $id, username: $username, email: $email, address: $address}';
  }
}
