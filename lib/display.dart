import 'package:flutter/material.dart';

class MongoDbDisplay extends StatefulWidget {
  const MongoDbDisplay({super.key});

  @override
  State<MongoDbDisplay> createState() => _MongoDbDisplayState();
}

class _MongoDbDisplayState extends State<MongoDbDisplay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: FutureBuilder(builder: (context,AsyncSnapshot snapshot){
                if(snapshot.connectionState == ConnectionState.waiting){
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  if(snapshot.hasData){
                    var totalData = snapshot.data.length;
                    print('Total Data');
                    return Text('Data found');
                  } else {
                    return Center(
                      child: Text("No Data Available"),
                    );
                  }
                }
          })
      ),
    );
  }
}
