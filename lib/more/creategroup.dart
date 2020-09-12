import 'package:bartaaapp/screen/ChatRoomPage.dart';
import 'package:flutter/material.dart';
import '../chat_model.dart';

class creategroup extends StatefulWidget {
  @override
  _creategroupState createState() => _creategroupState();
}

class _creategroupState extends State<creategroup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text('Select Contact'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.search),
              tooltip: 'Show Snackbar',
              onPressed: () {

              },
            ),
            IconButton(
              icon: const Icon(Icons.navigate_next),
              tooltip: 'Next page',
              onPressed: () {

              },
            ),
          ],
      ),
      body:ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: dummyData.length,
        itemBuilder: (context, i) => Column(
          children: <Widget>[
            Divider(
              height: 10.0,
            ),
            ListTile(
              leading: CircleAvatar(
                foregroundColor: Theme.of(context).primaryColor,

                backgroundImage: NetworkImage(dummyData[i].avatarUrl),
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    dummyData[i].name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    dummyData[i].time,

                  ),
                ],
              ),
              subtitle: Container(
                padding: const EdgeInsets.only(top: 5.0),
                child: Text(
                  dummyData[i].message,

                ),
              ),


              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChatRoomPage()),
                );
              },


            )
          ],
        ),
      ),
    );
  }
}
