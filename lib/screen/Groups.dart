import 'package:bartaaapp/more/chat_model_two.dart';
import 'package:bartaaapp/more/creategroup.dart';
import 'package:flutter/material.dart';
import 'ChatRoomPage.dart';
import 'package:contact_picker/contact_picker.dart';
import 'package:contacts_service/contacts_service.dart';



class Groups extends StatefulWidget {

  @override
  _GroupsState createState() => _GroupsState();
}

class _GroupsState extends State<Groups> {
 // Iterable<Contact> _contacts;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   // refreshContacts();
  }
//  refreshContacts() async {
//    var contacts = await ContactsService.getContacts();
//    setState(() {
//      _contacts = contacts;
//    });
//  }

  final ContactPicker _contactPicker = new ContactPicker();
 // Contact _contact;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
   body:
   ListView.builder(
     scrollDirection: Axis.vertical,
     itemCount: dummyDataa.length,
     itemBuilder: (context, i) => Column(
       children: <Widget>[
         Divider(
           height: 5.0,
         ),
         ListTile(
           leading: CircleAvatar(
             foregroundColor: Theme.of(context).primaryColor,

             backgroundImage: NetworkImage(dummyDataa[i].avatarUrl),
           ),
           title: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: <Widget>[
               Text(
                 dummyDataa[i].groupname,
                 style: TextStyle(fontWeight: FontWeight.bold),
               ),
               Text(
                 dummyDataa[i].lastuser,

               ),
             ],
           ),
           subtitle: Container(
             padding: const EdgeInsets.only(top: 10.0),
             child: Text(
               dummyDataa[i].lastmessage,
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
     )),

//

      floatingActionButton: FloatingActionButton(
            tooltip: 'Edit Status Or Story',
            backgroundColor: Colors.white,
            elevation: 8.0,
            child: Icon(
              Icons.edit,color: Colors.blueAccent,
            ),
          onPressed: () async
          {
//    Contact contact = await _contactPicker.selectContact();
//    setState(() {
//    _contact = contact;
//    }
//    );
//    print(_contact.toString().replaceAll("+91 ", "").replaceAll(" ", "").replaceAll("(Work)", ""));
//    print(_contact);
//    Text( contact == null ? 'No contact selected.' : contact.toString(),);

    },
      ),
//            onPressed: () {
//              Navigator.push(
//              context,
//              MaterialPageRoute(builder: (context) => creategroup()),
//            );
//            }
     );
  }
}
