import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class select_contact extends StatefulWidget {
  @override
  _select_contactState createState() => _select_contactState();
}

class _select_contactState extends State<select_contact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar

        (
          title: Text('New group,'),
        backgroundColor: Colors.pinkAccent),

      body :
      Column(children: <Widget>[
        SizedBox(
          height: 6,
        ),
        TextField(

//            decoration: const InputDecoration(
//              contentPadding: const EdgeInsets.symmetric(vertical: 40.0),
//            ),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(top: 10,right: 45),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.purple, width: 2.0),
            ),
            hintText: 'type group subject here',

            prefixIcon: Icon(Icons.camera_alt),


          ),
        ),

        Text(
          'provide a group subject and optional gropup icon',
          textAlign: TextAlign.center,

          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),
        ),
        SizedBox(
          width: 30,
        ),

        FlatButton(
          color: Colors.pink,
          textColor: Colors.white,
          disabledColor: Colors.grey,
          //shape: BorderRadius.circular,
          disabledTextColor: Colors.black,
          padding: EdgeInsets.all(8.0),
          splashColor: Colors.blueAccent,
          onPressed: () {
            /*...*/
          },
          child: Text(
            "save",
            style: TextStyle(fontSize: 20.0),
          ),
        )
//        IconButton(
//        icon: Icon(Icons.save),
//    padding: EdgeInsets.only(left: 250),
//    tooltip: 'Increase volume by 10',
//    onPressed: () {
//      setState(() {
//        // _volume += 10;
//      });
//    }),

      ]));
  }
}
