import 'package:flutter/material.dart';
import 'package:smartHome/utility/get_screen_size.dart';

class RoomPage extends StatefulWidget {

  final String roomName;
  final String roomPhoto;

  RoomPage(
    this.roomName,
    this.roomPhoto,
  );

  @override
  _RoomPageState createState() => _RoomPageState();
}

class _RoomPageState extends State<RoomPage> {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight/1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              height: screenHeight*0.4,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(widget.roomPhoto),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            Container(
              height: screenHeight*0.6,
              color: Colors.green,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text('Next Task',style: TextStyle(color: Colors.white, fontSize: 30),),
                )
              ),
            )
          ],
        ),
    );
  }
}