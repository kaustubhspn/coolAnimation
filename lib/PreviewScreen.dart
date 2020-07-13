import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';
import 'package:stonks_fintech_demo/AnimatedButton.dart';
import 'main.dart';


class PreviewScreen extends StatefulWidget {
  @override
  _PreviewScreenState createState() => _PreviewScreenState();
}

class _PreviewScreenState extends State<PreviewScreen> {

  final backgroundColor = Color.fromRGBO(23, 36, 45, 1);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: backgroundColor,

        items: [

          BottomNavigationBarItem(
            icon: Icon(Icons.ondemand_video,color: Colors.white.withOpacity(0.7),),
            title: Text(''),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search,color: Colors.white.withOpacity(0.7),),
            title: Text(''),
          ),
          BottomNavigationBarItem(
            icon: Badge(badgeContent: Text('',style: TextStyle(fontSize: 7,
                color: Colors.red,),),child: Icon(Icons.notifications,color: Colors.white.withOpacity(0.7),),position: BadgePosition.topRight(right: -5),),
            title: Text(''),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle,color: Colors.white.withOpacity(0.7),),
            title: Text(''),
          ),

        ],

      ),
      body: Container(
        color: backgroundColor,
        child: Stack(fit: StackFit.loose,overflow: Overflow.visible,
          children: <Widget>[
            MainScreen(),
            Positioned(bottom: 10,right: 10,child: AnimatedButton()),
          ],
        ),

      ),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final blockSize = MediaQuery.of(context).size.height/10;
    return SafeArea(top: true,
      child: SizedBox.expand(
        child: Column(mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            getStatusesRow(blockSize),
            getTitleWidget(height: blockSize),
            getImage(blockSize*2.5),
            getBottomCaptionBar(),
            getCommentsWindow(blockSize*0.8),
            getbottomProfileBar(),
          ],
        ),
      ),
    );
  }


  Widget getStatusesRow(double height) {

    return SizedBox(
      height: height+40,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            createStatusButton(side: height-10,imageName: 'status1', title: 'Feed'),
            createStatusButton(side: height-10,imageName: 'status2', title: 'Ninja'),
            createStatusButton(side: height-10,imageName: 'status3', title: '\$1k Contest'),
            createStatusButton(side: height-10,imageName: 'status4', title: 'Pokimane'),
            createStatusButton(side: height-10,imageName: 'status5', title: 'DrLupo'),
            createStatusButton(side: height-10,imageName: 'status6', title: 'Kingrace'),

          ],
        ),
      ),
    );

  }

  Widget createStatusButton({double side, String imageName, String title}) {

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: <Widget>[
          Badge(
            badgeContent: [Text('7'), Icon(Icons.star,size: 10,), Text('1'), Text('')][random.nextInt(4)],
            position: BadgePosition.topRight(right: 0,top: 1),
            badgeColor: [Colors.red, Colors.yellow, Colors.teal, Colors.white, Colors.orange][random.nextInt(5)],
            child: OutlineGradientButton(
              strokeWidth: 2,
              radius: Radius.circular(side),
              gradient: LinearGradient(colors: [Colors.yellow,Colors.pink, Colors.purple]),
              child: SizedBox(
                height: side-15 ,
                child: ClipRRect(borderRadius: BorderRadius.circular(side),
                    child: Image.asset('assets/$imageName.png',fit: BoxFit.cover,)),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 3),
              child: Text(title,style: TextStyle(color: Colors.white.withOpacity(0.7),),)),
        ],
      ),
    );

  }

  Widget getImage(double height) {

    return SizedBox(
      height: height,width: double.maxFinite,
      child: Image.asset('assets/video.png',fit: BoxFit.fill,),
    );

  }

  Widget getBottomCaptionBar() {

    return Container(
      color: Colors.grey.withOpacity(0.5),
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
             Text('#12 in Today\'s Top Clip Contest',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 17),),

            Padding(padding: EdgeInsets.only(top: 10),child: Row(mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('\$1k Prize Pool ',style: TextStyle(color: Colors.orange,fontSize: 15,fontWeight: FontWeight.bold),),
                Text(' 3h 45m 32s ',style: TextStyle(color: Colors.white.withOpacity(0.5),fontSize: 15),),
                Text('1,029 entries',style: TextStyle(color: Colors.white.withOpacity(0.5),fontSize: 15),),
              ],
            )),
         ],),
          Icon(Icons.arrow_forward_ios,color: Colors.white.withOpacity(0.7),),
        ],
      ),
    );

  }


  Widget getTitleWidget({double height}) {

    return SizedBox(
      height: height-5,
      child: Padding(padding: EdgeInsets.symmetric(horizontal: 15),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[
              Text('NYC was fun but I\'m back!',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
              Padding(padding: EdgeInsets.only(top: 5),child: Text('32.1k views  Jinjuh clipped 5h ago',style: TextStyle(color: Colors.white),)),
            ],),
            Row(children: <Widget>[
              Padding(padding: EdgeInsets.only(right: 5),child: Icon(Icons.more_horiz,color: Colors.white,)),
              Container(
                height: height/2, width: height,
                decoration: BoxDecoration(color: Color.fromRGBO(51, 53, 50, 1),borderRadius: BorderRadius.circular(5)),
                child: Center(
                  child: Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.stars,color: Colors.orange,),
                      Padding(padding: EdgeInsets.only(left: 5),child: Text('1.3k',style: TextStyle(color: Colors.orange),)),
                    ],
                  ),
                ),
              ),
            ],)
          ],
        ),
      ),
    );

  }

  Widget getInfoButton(IconData iconData, String text) {

    return Column(
      children: <Widget>[
        Icon(iconData,color: Colors.grey,),
        Padding(padding: EdgeInsets.only(top: 10),child: Text(
          text, style: TextStyle(color: Colors.grey),
        ),)
      ],
    );

  }

  Widget getbottomProfileBar() {

    return Padding(padding: EdgeInsets.only(top: 10,
      left: 0,right: 55), child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Badge(child: SizedBox(
          height: 60,width: 60,child: Container(
          child: Image.asset('assets/status4.png',fit: BoxFit.cover,),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
        ),
        ),badgeContent: Icon(Icons.add_circle,color: Colors.blueAccent,size: 30,),
          badgeColor: Colors.transparent,
          position: BadgePosition.bottomRight(right: -5),
        ),
        Column(children: <Widget>[
          Row(children: <Widget>[
            Text("Ninja",style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.bold),),
            Padding(padding: EdgeInsets.only(left: 5),child: Icon(Icons.verified_user,color: Colors.white,)),
          ],),
          Padding(padding: EdgeInsets.only(top: 7),child: Text('8.9k Followers',style: TextStyle(
            color: Colors.white.withOpacity(0.5)
          ),)),
        ],),

        Row(children: <Widget>[
          Padding(padding: EdgeInsets.only(left: 0,),child: getInfoButton(Icons.share, 'Share'),),
          Padding(padding: EdgeInsets.only(left: 20,),child: getInfoButton(Icons.comment, '102'),),
        ],)

      ],
    ),
    );

  }


  Widget getCommentsWindow(double height) {

    List<String> names = [
      'drg5',
      'ninja',
      'yuierooo',
      'picachU',
      'pokemon',
      'titans',
      'royal32',
    ];

    List<String> comments = [
      'just liked this 100 times 🐙 🐙',
      '🦄 🦄 🦄 🦄 ',
      'how will you do that 🐹 🐹',
      'i\'ll try that',
      'this is really cool',
      'that last mission was just awesome',
      'mission is really difficult'
    ];

    return SizedBox(
      height: height*2,
      child: Padding(padding: EdgeInsets.symmetric(vertical: 3,horizontal: 10),
        child: ListView.separated(
            itemBuilder: (context, index) {
              return Row(
                children: <Widget>[
                  Text(names[index],style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15
                  ),),
                  Padding(padding: EdgeInsets.only(left: 20),child: Text(
                      comments[index],style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),),),
                ],
              );
            },
            separatorBuilder: (context, _) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 7,horizontal: 20),
              );
            },
            itemCount: 7),
      ),
    );

  }

}

