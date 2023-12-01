import 'dart:developer';

import 'package:mongo_dart/mongo_dart.dart';
import 'package:mongoproject_1/mongoDbModel.dart';
import 'constant.dart';

class MongoDatabase{
  static var db , userCollection;
  static connect() async{
    db = await Db.create(MONGO_CONN_URL);
    await db.open();
    inspect(db);
    userCollection = db.collection(USER_COLLECTION);
  }

  static Future<List<Map<String,dynamic>>> getData() async{
    final arrData = await userCollection.find().toList();
    return arrData;
  }

  static Future<String> insert(MongoDbModel data) async{
    try{
      var result = await userCollection.insertOne(data.toJson());
      if(result.isSucess){
        return 'Data Inserted';
      }else{
        return'Something Wrong while inserting data';
      }
    } catch(e){
      print(e.toString());
      return e.toString();
    }
  }
}