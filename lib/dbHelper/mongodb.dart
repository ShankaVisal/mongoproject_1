import 'dart:developer';

import 'package:mongo_dart/mongo_dart.dart';
import 'constant.dart';

class mongoDatabase{
  static var db , userCollection;
  static connect() async{
    db = await Db.create(MONGO_CONN_URL);
    await db.open();
    inspect(db);
    userCollection = db.collection(USER_COLLECTION);
  }

  static Future<void> insert() async{
    try{} catch(e){
      print(e.toString());
    }
  }
}