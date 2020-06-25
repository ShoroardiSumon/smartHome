import 'package:flutter/material.dart';
import 'package:smartHome/pages/room_page.dart';
import 'package:smartHome/utility/get_screen_size.dart';

class HorizontalRoomList extends StatelessWidget {
  final String roomName;
  final String roomPhoto;

  HorizontalRoomList(
    this.roomName,
    this.roomPhoto,
  );

  @override
  Widget build(BuildContext context) {
        return Container(
          width: screenWidth/2.5,
          child: InkWell(
            child: Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15)
              ),

              child: Column(
                children: <Widget>[
                  Container(
                    height: screenHeight/8,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage(roomPhoto),
                        fit: BoxFit.fill,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(roomName, style: TextStyle(fontSize: 20),),
                  ),
                ],
              ),
            ),

            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> RoomPage(roomName, roomPhoto)));
            },
          ),
        );
  }
}
