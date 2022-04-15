import 'package:flutter/material.dart';
import 'package:fresh/presentation/utils/custom_app_bar.dart';

class ReferandEarnPage extends StatefulWidget {
  static final route = "referandEarnScreen";
  const ReferandEarnPage({Key? key}) : super(key: key);

  @override
  _ReferandEarnPageState createState() => _ReferandEarnPageState();
}

class _ReferandEarnPageState extends State<ReferandEarnPage> {
  AssetImage img1 = AssetImage("assets/referEarn1.png");
  AssetImage img2 = AssetImage("assets/referEarn2.png");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Refer & Earn"),
      body: Column(
        // clipBehavior: Clip.hardEdge,
        children: [
          Expanded(
            child: Stack(
              fit: StackFit.expand,
              children: [
                Positioned(
                  height: 355,
                  child: Container(
                    height: 80.0,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.indigo[100],
                    ),
                  ),
                ),
                Positioned(
                  top: 25,
                  left: MediaQuery.of(context).size.width / 8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Invite\nFriends", style: TextStyle(fontSize: 20)),
                      Icon(Icons.arrow_forward_ios,
                          color: Colors.red, size: 34),
                      SizedBox(width: 15),
                      Text("Invite\nFriends", style: TextStyle(fontSize: 20)),
                      Icon(Icons.arrow_forward_ios,
                          color: Colors.red, size: 34),
                      SizedBox(width: 15),
                      Text("Invite\nFriends", style: TextStyle(fontSize: 20)),
                      Icon(Icons.arrow_forward_ios,
                          color: Colors.red, size: 34),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Center(
                  child: Image(
                    image: img1,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: MediaQuery.of(context).size.width / 8,
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.75,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Your Code", style: TextStyle(color: Colors.grey)),
                        SizedBox(height: 5),
                        Text("FRSNDJEII2244",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 30),
          Text("Invite Your Friends and",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Text("Earn Money",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(height: 20),
          Image(image: img2),
          SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {},
            child: Text("Invite your Friends"),
            style: ElevatedButton.styleFrom(
              fixedSize: Size(353, 50),
            ),
          ),
        ],
      ),
    );
  }
}
