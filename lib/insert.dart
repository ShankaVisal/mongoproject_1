import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart' as M;
import 'package:mongoproject_1/mongoDbModel.dart';

class MongoDbInsert extends StatefulWidget {
  const MongoDbInsert({super.key});

  @override
  State<MongoDbInsert> createState() => _MongoDbInsertState();
}

class _MongoDbInsertState extends State<MongoDbInsert> {

  var fnameController = new TextEditingController();
  var lnameController = new TextEditingController();
  var addressController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text('Insert data', style: TextStyle(fontSize: 22),),
            SizedBox(height: 50,),
            TextField(
              controller: fnameController,
              decoration: InputDecoration(
                  labelText: 'First Name'
              ),
            ),
            TextField(
              controller: lnameController,
              decoration: InputDecoration(
                  labelText: 'Last Name'
              ),
            ),
            TextField(
              controller: addressController,
              minLines: 3,
              maxLines: 5,
              decoration: InputDecoration(
                  labelText: 'Address'
              ),
            ),
            SizedBox(height: 50,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton(
                    onPressed: (){
                      _fakeData();
                    },
                    child: Text('Genaerate Button')),
                ElevatedButton(
                    onPressed: (){
                      _insertData(fnameController.text,lnameController.text,addressController.text);
                    },
                    child: Text('Insert Data')),
              ],
            ),

          ],
        ),
      ),
    );
  }

  Future<void> _insertData(String fName, String lNmae, String address)async {
    var id = M.ObjectId();
    final data = MongoDbModel(username, email, address)
  }

  void _fakeData(){
    setState(() {
      fnameController.text = faker.person.firstName();
      lnameController.text = faker.person.lastName();
      addressController.text =
          faker.address.streetName() + "\n" + faker.address.streetAddress();
    });
  }
}
