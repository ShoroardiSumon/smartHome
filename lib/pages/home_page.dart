import 'package:flutter/material.dart';
import 'package:smartHome/cards/room_card.dart';
import 'package:smartHome/model/roomModel.dart';
import 'package:smartHome/utility/constant.dart';
import 'package:smartHome/utility/get_screen_size.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  GlobalKey homeglobalKey = new GlobalKey();

  List<RoomModel> roomModelList = new  List<RoomModel>();

  Future<bool> _oneWillPop() async{
    return false;
  }

  @override
  void initState() {
    super.initState();
    roomModelList.add(RoomModel('Living Room', ImageStore.livingRoom));
    roomModelList.add(RoomModel('Bed Room', ImageStore.bedRoom));
    roomModelList.add(RoomModel('Kitchen', ImageStore.kitchenRoom));
    roomModelList.add(RoomModel('Bath Room', ImageStore.bathRoom));
  }

  @override
  Widget build(BuildContext context) {
    getScreenSize(context);

    return WillPopScope(
      onWillPop: _oneWillPop,
      child: Scaffold(
        key: homeglobalKey,
        body: Stack(
          children: <Widget>[
            buildImageBackGround(),
            buildPage(),
          ],
        ),
      ), 
    );
  }

  Widget buildImageBackGround(){
    return Positioned.fill(
      child: Image.asset(
        (dateTimeNow.hour > 21 || dateTimeNow.hour <=5)
        ? ImageStore.goodNight
        : (dateTimeNow.hour > 5 && dateTimeNow.hour <=12)
            ? ImageStore.goodMorning
            : (dateTimeNow.hour > 12 && dateTimeNow.hour <=17)
                ? ImageStore.goodAfternoon
                : (dateTimeNow.hour > 17 && dateTimeNow.hour <=21)
                    ? ImageStore.goodEvening
                    : "",
        
        fit: BoxFit.cover,
      )
    );
  }

  Widget buildPage(){
    return Positioned.fill(
      child: Padding(
        padding: EdgeInsets.only(left: marginHorizontal,),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            
            buildNameTime(),
            const SizedBox(height: 200,),

            Text('Favourite Devices', style: TextStyle(color: Colors.white, fontSize: 20),),
            const SizedBox(height: 40,),

            Text('Rooms', style: TextStyle(color: Colors.white, fontSize: 20), ),
            const SizedBox(height: 2,),

            //create horizontal list of room
            Container(
              height: screenHeight/4,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: roomModelList.length,
                itemBuilder: (BuildContext context, int index) {
                return HorizontalRoomList(roomModelList[index].roomName, roomModelList[index].roomPhoto);
               },
              ),
            ),

            const SizedBox(height: 20,),

          ],
        ),
      ),
    );
  }

  Widget buildNameTime(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[

        //get moment of the day
        (dateTimeNow.hour > 21 || dateTimeNow.hour <=5)
        ? Text('Good Night',style: TextStyle(color: Colors.white, fontSize: 18,), )
        : (dateTimeNow.hour > 5 && dateTimeNow.hour <=12)
          ? Text('Good Morning',style: TextStyle(color: Colors.white, fontSize: 18),)
          : (dateTimeNow.hour > 12 && dateTimeNow.hour <=17)
            ? Text('Good Afternoon',style: TextStyle(color: Colors.white, fontSize: 18),)
            : (dateTimeNow.hour > 17 && dateTimeNow.hour <=21)
              ? Text('Good Evening',style: TextStyle(color: Colors.white, fontSize: 18),)
              : '',
        
        const SizedBox(height: 5,),

        Text('Shoroardi Sumon',style: TextStyle(color: Colors.white, fontSize: 25),),

      ],
    );
  }

}


