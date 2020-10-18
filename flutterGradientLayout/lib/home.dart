import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //****************************appBar start
        appBar: AppBar(
          title: Text("Flutter Color Gradient"),
          backgroundColor: Colors.green,
          actions: [
            IconButton(icon: Icon(Icons.add), onPressed: () {}),
            IconButton(icon: Icon(Icons.search), onPressed: () {}),
          ],
        ),

        //****************************appBar end
        body: ListView(
          children: [
            getListViewParticularData(context, "First data",
                "We are planning flutter gradient", "120"),
            getListViewParticularData(context, "Second data",
                "We are planning flutter gradient", "120"),
            getListViewParticularData(context, "Third data",
                "We are planning flutter gradient", "120"),
            getListViewParticularData(context, "Fourth data",
                "We are planning flutter gradient", "120"),
            getListViewParticularData(context, "Fifth data",
                "We are planning flutter gradient", "120"),
            getListViewParticularData(context, "Sixth data",
                "We are planning flutter gradient", "120"),
            getListViewParticularData(context, "Seventh data",
                "We are planning flutter gradient", "120"),
            getListViewParticularData(context, "Eighth data",
                "We are planning flutter gradient", "120"),
            getListViewParticularData(context, "Nineth data",
                "We are planning flutter gradient", "120"),
            getListViewParticularData(context, "Eleventh data",
                "We are planning flutter gradient", "120"),
            getListViewParticularData(context, "Twelveth data",
                "We are planning flutter gradient", "120"),
          ],
        ));
  }
}

Widget getListViewParticularData(
    BuildContext context, String title, String desc, String amount)
// can use amount as double then pass your actual argument as int or double
{
  return Container(
    height: 100.0,
    margin: EdgeInsets.all(10.0),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        gradient: LinearGradient(
          colors: [Colors.deepOrange, Colors.amber, Colors.green],
        )),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          // margin: EdgeInsets.fromLTRB(20, 0, 0,20),
          // this container is inside the row , so if we add crossAxisAlignment start, container adjust top margin 0
          margin: EdgeInsets.only(left: 10.0, top: 10.0),
          child: CircleAvatar(
            child: Text(
              title[0],
              style: TextStyle(fontSize: 25.0),
            ),
            maxRadius: 20.0,
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
          ),
        ),
        Container(
            margin: EdgeInsets.only(left: 10.0, top: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  desc,
                  maxLines: 1,
                  style: TextStyle(fontSize: 16.0, color: Colors.white),
                ),
              ],
            )),
        Container(
          margin: EdgeInsets.only(left: 10.0, top: 10.0),
          child: Text(
            "\$$amount",
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        )
      ],
    ),
  );
}
