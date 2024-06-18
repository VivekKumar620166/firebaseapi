import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EmptyStatefulWidget extends StatefulWidget {
  @override
  _EmptyStatefulWidgetState createState() => _EmptyStatefulWidgetState();
}

class _EmptyStatefulWidgetState extends State<EmptyStatefulWidget> {
  dynamic getData() async {
    print("Fetching data");
    DocumentSnapshot doc = await FirebaseFirestore.instance.collection("Users").doc("Myuser").get();
    print("Data type: ${doc.runtimeType}");
    return doc;
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Empty Stateful Widget Example'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("Users").doc("vivek880@gmail.com").snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }
          if (!snapshot.hasData) {
            return Center(child: Text("No data found"));
          }
          var doc = snapshot.data!;

          var title =  doc['Email'];
          // var description = doc.data()?.containsKey('description') ?? false ? doc['description'] : '';

          return ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              debugPrint("+++++++++++++"+doc.toString());
              return ListTile(
                leading: CircleAvatar(child: Text("${index + 1}")),
                title: Text(title),
                subtitle: Text('description'),
              );
            },
          );
        },
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: EmptyStatefulWidget(),
  ));
}
