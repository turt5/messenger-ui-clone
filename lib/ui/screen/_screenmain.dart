import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:messenger_clone/constants/_colors.dart';
import 'package:messenger_clone/constants/_spacer.dart';
import 'package:messenger_clone/dummy/_datas.dart';

import '../widgets/_chats_first_row.dart';
import '../widgets/_notes.dart';
import '_searchpage.dart';

class ScreenMain extends StatefulWidget {
  const ScreenMain({super.key});

  @override
  State<ScreenMain> createState() => _ScreenMainState();
}

class _ScreenMainState extends State<ScreenMain> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _currentIndex = 0;
  String selected = 'Home';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    dummyData.sort((a, b) {
      // Check if the name is "Me"
      if (a['name'] == 'Me') return -1; // Keep "Me" at index 0
      if (b['name'] == 'Me') return 1; // Keep "Me" at index 0

      // Convert time strings to DateTime objects for comparison
      DateTime dateTimeA = DateFormat('h:mm a').parse(a['time']);
      DateTime dateTimeB = DateFormat('h:mm a').parse(b['time']);

      // Compare DateTime objects in descending order
      return dateTimeB.compareTo(dateTimeA);
    });
  }

  String? profilePic = findMe()?['profile_pic'];
  String? name = findMe()?['name'];


  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarBrightness: Brightness.dark,
          systemNavigationBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: Colors.white),
    );
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      // resizeToAvoidBottomInset: true,
      key: _scaffoldKey,
      backgroundColor: MyColors.white,
      drawer: Drawer(
        child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(backgroundImage: AssetImage(profilePic!)),
                      spacerH10(),
                      const Text('Unknown person',style: TextStyle(fontSize: 18),),
                      spacerH5(),
                      IconButton(onPressed: (){}, icon: Icon(Icons.arrow_drop_down_sharp,size:30))
                    ],
                  ),

                  IconButton(onPressed: (){}, icon: Icon(Icons.settings,size:30))
                ],
              ),
            ),

            ListTile(
              leading: Container(
                width: 35,height: 35,
                decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Image.asset('assets/images/icons/icons8-chat-50.png',scale: 2,),
              ),
              horizontalTitleGap: 20,
              title: Text('Chats'),
            ),

            // spacerV5(),

            ListTile(
              leading: Container(
                width: 35,height: 35,
                decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Image.asset('assets/images/icons/icons8-shop-50.png',scale: 2,),
              ),
              horizontalTitleGap: 20,
              title: Text('MarketPlace'),
            ),

            ListTile(
              leading: Container(
                width: 35,height: 35,
                decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Image.asset('assets/images/icons/icons8-chat-50.png',scale: 2,),
              ),
              horizontalTitleGap: 20,
              title: Text('Message requests'),
            ),

            ListTile(
              leading: Container(
                width: 35,height: 35,
                decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Image.asset('assets/images/icons/icons8-box-50.png',scale: 2,),
              ),
              horizontalTitleGap: 20,
              title: Text('Archive'),
            ),

            spacerV10(),
            spacerV10(),

            Expanded(child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
              Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Communities',style: TextStyle(
                    fontSize: 16,
                    color: MyColors.grey_600
                  ),),

                  Text('Edit',style: TextStyle(
                    fontSize: 16,
                    color: MyColors.blue
                  ),),
                ],
              ),
            ),

            spacerV5(),

            ListTile(
              leading: Container(
                width: 35,height: 35,
                decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.circular(10)
                ),
              ),
              horizontalTitleGap: 20,
              title: Text('Programming Bangladesh'),
            ),


            ListTile(
              leading: Container(
                width: 35,height: 35,
                decoration: BoxDecoration(
                  color: Colors.deepOrange,
                  borderRadius: BorderRadius.circular(10)
                ),
              ),
              horizontalTitleGap: 20,
              title: Text('Flutter Community'),
            ),
            ],)),




            Expanded(child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
              Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Suggested chats for communities',style: TextStyle(
                    fontSize: 16,
                    color: MyColors.grey_600
                  ),),
                ],
              ),
            ),

            spacerV5(),

            ListTile(
              leading: Container(
                width: 35,height: 35,
                decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.circular(10)
                ),
              ),
              horizontalTitleGap: 20,
              title: Text('Job News'),
            ),
            ],))
          ],
        )),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedIconTheme: const IconThemeData(grade: 2),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.blue,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Image.asset(
              'assets/images/icons/icons8-chat-50.png',
              scale: 2.4,
              color: _currentIndex == 0 ? MyColors.blue : Colors.grey[500],
            ),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/icons/icons8-video-call-50.png',
              scale: 2.4,
              color: _currentIndex == 1 ? MyColors.blue : Colors.grey[500],
            ),
            label: 'Calls',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/icons/icons8-user-account-50.png',
              scale: 2.4,
              color: _currentIndex == 2 ? MyColors.blue : Colors.grey[500],
            ),
            label: 'People',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/icons/icons8-red-card-50.png',
              scale: 2.4,
              color: _currentIndex == 3 ? MyColors.blue : Colors.grey[500],
            ),
            label: 'Stories',
          ),
        ],
      ),
      body: SafeArea(
          child: Column(
        children: [
          ChatSPageFirstRow(scaffoldKey: _scaffoldKey),
          spacerV10(),
          //search
          Expanded(
            child: ListView(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SearchPage()));
                  },
                  child: Container(
                    height: 50,
                    margin: const EdgeInsets.symmetric(horizontal: 12),
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: MyColors.grey_200),
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 12),
                          child: Image.asset(
                            'assets/images/icons/icons8-search-50.png',
                            color: MyColors.grey_600,
                            scale: 2,
                          ),
                        ),
                        spacerH10(),
                        Text('Search',
                            style: TextStyle(
                                fontSize: 17, color: MyColors.grey_600))
                      ],
                    ),
                  ),
                ),

                spacerV10(),
                spacerV10(),
                // spacerV10(),

                Notes(height: height),

                spacerV5(),

                Container(
                  height: 30,
                  // color: Colors.red,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selected = 'Home';
                          });
                        },
                        child: AnimatedContainer(
                            duration: const Duration(milliseconds: 350),
                            curve: Curves.linearToEaseOut,
                            decoration: BoxDecoration(
                              color: selected == "Home"
                                  ? MyColors.grey_300
                                  : MyColors.white,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            width: width / 2 - 15,
                            child: Text(
                              'Home',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: selected == "Home"
                                      ? MyColors.black
                                      : MyColors.grey_600),
                            )),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selected = 'Channels';
                          });
                        },
                        child: AnimatedContainer(
                            duration: const Duration(milliseconds: 350),
                            curve: Curves.linearToEaseOut,
                            decoration: BoxDecoration(
                              color: selected == "Channels"
                                  ? MyColors.grey_300
                                  : MyColors.white,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            width: width / 2 - 15,
                            child: Text(
                              'Channels',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: selected == "Channels"
                                      ? MyColors.black
                                      : MyColors.grey_600),
                            )),
                      ),
                    ],
                  ),
                ),
                spacerV10(),

                Container(
                  color: Colors.red,
                ),

                selected == "Home"
                    ? Column(
                        children: List.generate(dummyData.length, (index) {
                          return dummyData[index]['id'] != 0
                              ? Container(
                                  padding: EdgeInsets.symmetric(vertical: 5),
                                  // color: Colors.red,
                                  margin: EdgeInsets.only(
                                      bottom: 5, left: 10, right: 10),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 55,
                                        height: 55,
                                        padding: const EdgeInsets.only(left: 5),
                                        child: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              dummyData[index]['profile_pic']),
                                        ),
                                      ),
                                      spacerH10(),
                                      spacerH5(),
                                      Column(
                                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            dummyData[index]['name'],
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                  // width: 100,

                                                  child: Text(dummyData[index]
                                                              ['message'] ==
                                                          'me'
                                                      ? "You: ${dummyData[index]['message_body']}"
                                                      : dummyData[index]
                                                          ['message_body'])),
                                              spacerH10(),
                                              Container(
                                                width: 3,
                                                height: 3,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              spacerH10(),
                                              Text(dummyData[index]['time'])
                                            ],
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              : const SizedBox(
                                  width: 0,
                                  height: 0,
                                );
                        }),
                      )
                    : Column(
                        children: [
                          Container(
                            height: 400,
                            child: Center(
                              child: Text('No channels available'),
                            ),
                          )
                        ],
                      )
              ],
            ),
          )
        ],
      )),
    );
  }
}

Map<String, dynamic>? findMe() {
  for (var map in dummyData) {
    if (map["name"] == "Me") {
      return map;
    }
  }
  return null; // Return null if not found
}
