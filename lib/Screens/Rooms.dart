import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Rooms extends StatelessWidget {
  const Rooms({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.blue,
            )),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 30),
            child: Icon(
              Icons.settings_outlined,
              color: Colors.blue,
            ),
          )
        ],
      ),
      backgroundColor: Color(0xfff5f7fa),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Text(
                "Bedrooms",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 26),
              ),
            ),
            Container(
              height: size.height * .30,
              width: size.width,
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
                  padding: EdgeInsets.only(left: 15, top: size.height * .26),
                  child: const Text(
                    'Camera bedroom',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15,),
            DevicesGridDashboard(size: size)
          ],
        ),
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CardField(
                size,
                Icon(
                  Icons.lightbulb_outline,
                  color: Colors.orange,
                ),
                'Main Light',
                '50%'),
            CardField(size, Icon(Icons.lightbulb_outline, color: Colors.grey),
                'Table Lamp', 'Off'),
            CardField(size, Icon(Icons.lightbulb_outline, color: Colors.grey),
                'Floor Lamp', 'Off'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CardField(
                size,
                Icon(
                  Icons.music_note_outlined,
                  color: Colors.amber,
                ),
                'Speaker',
                '50%'),
            CardField(
                size, Icon(Icons.radio, color: Colors.grey), 'Socket', 'Off'),
            CardField(size, Icon(Icons.wifi_outlined, color: Colors.green),
                'Sensor', 'Off'),
          ],
        ),
        CardField(
            size,
            Icon(
              Icons.air,
              color: Colors.teal,
            ),
            'Air Condition',
            '50%'),
      ],
    );
  }
}

CardField(
  Size size,
  Icon icon,
  String title,
  String subtitle,
) {
  return Card(
      child: SizedBox(
          height: size.width * .23,
          width: size.width * .26,
          child: Center(
            child: Column(children: [
              ListTile(
                leading: icon,
                title: Text(
                  subtitle,
                  style: const TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 13),
                ),
              ),
              Text(
                title,
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
              ),
            ]),
          )));
}
