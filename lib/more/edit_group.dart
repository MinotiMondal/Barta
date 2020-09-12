import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'group_model.dart';

class GroupsView extends StatefulWidget {
  @override
  _GroupsViewState createState() => _GroupsViewState();
}

class _GroupsViewState extends State<GroupsView> {
  final List<GroupModel> groups = [
    GroupModel(
        'Family', 'assets/group1.jpg', 'Mom', 'Great Work!!', 10),
    GroupModel('Flutter Community', 'assets/group2.jpg', 'Me',
        'New Video out on Youtube', 2),
    GroupModel('College ', 'assets/group3.jpg', 'Sara',
        'Looking out for more', 0),
    GroupModel('Avengers', 'assets/group4.jpg', 'Hulk',
        'Change our group pic..', 1),
    GroupModel('F.R.I.E.N.D.S', 'assets/group5.jpg', 'Chandler',
        'Get lost !', 0),
  ];

  @override
  Widget build(BuildContext context) {
return
//  (Column(children: <Widget>[
//   // Align(
//      //alignment: Alignment.bottomRight,
//
//     Padding(
//
//        padding: const EdgeInsets.all(2.0),
//        child: FloatingActionButton(
//            tooltip: 'Edit Status Or Story',
//            backgroundColor: Colors.white,
//            elevation: 8.0,
//            child: Icon(
//              Icons.edit,color: Colors.blueAccent,
//            ),
//            onPressed: () {}),
//      ),
        ListView.builder(

        itemCount: groups.length,
        itemBuilder: (context, index) {
          return GroupBox(
            group: groups[index],
          );
        });

    //alignment: Alignment.bottomRight,

//  ])  );

  }
}

class GroupBox extends StatefulWidget {
  const GroupBox({
    Key key,
    this.group,
  }) : super(key: key);
  final GroupModel group;


  @override
  _GroupBoxState createState() => _GroupBoxState();
}

class _GroupBoxState extends State<GroupBox> {
  @override
  Widget build(BuildContext context) {

    return
    //  (Column(children: <Widget>[
   //Align(
      //alignment: Alignment.bottomRight,

//     Padding(
//
//        padding: const EdgeInsets.all(2.0),
//        child: FloatingActionButton(
//            tooltip: 'Edit Status Or Story',
//            backgroundColor: Colors.white,
//            elevation: 8.0,
//            child: Icon(
//              Icons.edit,color: Colors.blueAccent,
//            ),
//            onPressed: () {}),
//      ),
        FlatButton(

          padding: EdgeInsets.zero,
          onPressed: () {},
          splashColor: Colors.pink,
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 3),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            height: 100,
            width: double.infinity,
            color: widget.group.unreadCount > 0
                ? Colors.deepOrange.withOpacity(0.6)
                : Colors.black87.withOpacity(0.3),
            child: Row(
              children: [
                Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: Colors.green, width: widget.group.unreadCount > 0 ? 3 : 1),
                    image: DecorationImage(
                      image: AssetImage(widget.group.groupImg),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 25),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.group.groupName,
                        style: TextStyle(
                          color: Colors.pink,
                          fontSize: 25,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Spacer(),
                      Text(
                        widget.group.lastUser + ': ' + widget.group.lastMessage,
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 15,
                          fontWeight: widget.group.unreadCount > 0
                              ? FontWeight.bold
                              : FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                //to display if only message have unreadCount>0
                if (widget.group.unreadCount > 0)
                  Container(
                    height: 25,
                    width: 25,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black87,
                    ),
                    child: Text(
                      widget.group.unreadCount.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

              ],
            ),
          )


        );
    //]));


  }
}
