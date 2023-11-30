import 'package:mongo_dart/mongo_dart.dart';
import 'dart:convert';

MongoDbModel mongoDbModelFromJson(String str) =>
    MongoDbModel.fromJson(json.decode(str));

class MongoDbModel {
  MongoDbModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.address,
});
  ObjectId id;
  String firstName;
  String lastName;
  String address;

  factory MongoDbModel.fromJson(Map<String, dynamic> json) => MongoDbModel(
      id: json['_id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      address: json['address'],
  );

  Map<String, dynamic> toJson() => {
    '_id': id,
    'firstName': firstName,
    'lastName': lastName,
    'address': address,
  };
}

