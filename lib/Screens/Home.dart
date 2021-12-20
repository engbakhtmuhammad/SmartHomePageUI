import 'package:flutter/material.dart';
import 'package:smart_home_page_ui/constant.dart';

import 'Rooms.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Builder(builder: (context) {
      return Scaffold(
          backgroundColor: Color(0xfff5f7fa),
          body: Column(children: [
            Stack(
              children: [
                Container(
                  height: size.height * .4,
                  width: size.width,
                ),
                GradientContainer(size),
                Positioned(
                    top: size.height * .15,
                    left: 30,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "My Home",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 26),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 10, bottom: 5),
                            child: Text(
                              "Rooms",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 17),
                            ),
                          ),
                          Row(children: [
                            CustomCard(size,context),
                            CustomCard(size,context),
                            CustomCard(size,context),
                          ]),
                        ]))
              ],
            ),
            DevicesGridDashboard(size: size),
            ScenesDashboard()
          ]));
    });
  }

  Padding CustomCard(Size size, context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: GestureDetector(
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Rooms(),)),
        child: Container(
          height: size.height * .15,
          width: size.width * .5,
          decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(8),
              image: const DecorationImage(
                image: AssetImage(
                  "assets/bg.jpg",
                ),
                fit: BoxFit.cover,
              )),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.black.withOpacity(0.3),
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 15, top: size.height * .12),
              child: const Text(
                'Room',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container GradientContainer(Size size) {
    return Container(
      height: size.height * .3,
      width: size.width,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30)),
          image: DecorationImage(
              image: AssetImage('assets/bg.jpg'), fit: BoxFit.cover)),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30)),
            gradient: LinearGradient(colors: [
              secondaryColor.withOpacity(0.9),
              primaryColor.withOpacity(0.9)
            ])),
      ),
    );
  }
}

class ScenesDashboard extends StatelessWidget {
  const ScenesDashboard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.symmetric(horizontal: 30),
    child:  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       Padding(
    padding: EdgeInsets.symmetric(vertical: 15),
    child: Text(
      "Scenes",
      style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 17),
    ),
          ),
          SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: [
        CardWidget(icon: Icon(Icons.home_work_rounded,color: secondaryColor,), title: 'Coming Home'),
        CardWidget(icon: Icon(Icons.home,color: secondaryColor,), title: 'At Home')
      ],
    ),
          )
    ],),);
  }
}

class CardWidget extends StatelessWidget {
  Icon icon;
  String title;
   CardWidget({
    Key? key,
    required this.icon,
    required this.title
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: 50,
        width: 200,
        child: Center(child: ListTile(leading: icon,title: Text(
          title,
          style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 14),
        ),),),
      ),
    );
  }
}

class DevicesGridDashboard extends StatelessWidget {
  const DevicesGridDashboard({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 15),
            child: Text(
              "Devices",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 17),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CardField(
                  size,
                  Colors.blue,
                  Icon(
                    Icons.camera_outlined,
                    color: Colors.white,
                  ),
                  'Cameras',
                  '8 Devices'),
              CardField(
                  size,
                  Colors.amber,
                  Icon(Icons.lightbulb_outline, color: Colors.white),
                  'Lights',
                  '8 Devices'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CardField(
                  size,
                  Colors.orange,
                  Icon(Icons.music_note_outlined, color: Colors.white),
                  'Speakers',
                  '2 Devices'),
              CardField(
                  size,
                  Colors.teal,
                  Icon(Icons.sports_cricket_sharp, color: Colors.white),
                  'Cricket bat',
                  '8 Devices'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CardField(
                  size,
                  Colors.purple,
                  Icon(Icons.wifi_outlined, color: Colors.white),
                  'Sensors',
                  '5 Devices'),
              CardField(
                  size,
                  Colors.green,
                  Icon(Icons.air_outlined, color: Colors.white),
                  'Air Condition',
                  '4 Devices'),
            ],
          )
        ],
      ),
    );
  }
}

CardField(
  Size size,
  Color color,
  Icon icon,
  String title,
  String subtitle,
) {
  return Padding(
    padding: const EdgeInsets.all(2),
    child: Card(
        child: SizedBox(
            height: size.height * .1,
            width: size.width * .39,
            child: Center(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: color,
                  child: icon,
                ),
                title: Text(
                  title,
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                ),
                subtitle: Text(
                  subtitle,
                  style: const TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 13),
                ),
              ),
            ))),
  );
}
