import 'package:flutter/material.dart';
import '../../constants/_colors.dart';
import '../../constants/_spacer.dart';
import '../../dummy/_datas.dart';
import '_notes_middlepart.dart';
import '_own_note.dart';

PersistentBottomSheetController showNotes(BuildContext context, int index) {
  var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;

  TextEditingController _controller = TextEditingController();
  String getCurrentTime() {
    DateTime now = DateTime.now();
    String hours = (now.hour % 12).toString().padLeft(2, '0');
    String minutes = now.minute.toString().padLeft(2, '0');
    String amPm = now.hour < 12 ? 'AM' : 'PM';
    return '$hours:$minutes $amPm';
  }

  return showBottomSheet(
    backgroundColor: MyColors.white,
    context: context,
    builder: (context) {
      return AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.bounceInOut,
        height: height / 2,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: 10),
                color: MyColors.grey_500,
                width: 40,
                height: 3,
              )
            ],
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.cancel, color: Colors.black),
              ),
            ],
          ),
          Expanded(child: NotesMiddleWidget(index: index)),
          dummyData[index]['name'] == 'Me'
              ? OwnNote(
                  index: index,
                )
              : Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Container(
                    width: width,
                    height: 60, // Specify a fixed height for the Container
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Container(
                          height: 40,
                          width: 300,
                          child: TextField(
                            controller: _controller,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(left: 20),
                              filled: true,
                              fillColor: MyColors.grey_300,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                  color: MyColors.grey_300,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                  color: MyColors.grey_300,
                                ),
                              ),
                              hintText: 'Send message',
                              suffix: Container(
                                margin: EdgeInsets.only(right: 15, left: 10),
                                height: 20,
                                width: 20,
                                alignment: Alignment.center,
                                child: GestureDetector(
                                  onTap: () {
                                    String text =
                                        _controller.text.toString().trim();
                                    String time=getCurrentTime();
                                    time = time.replaceAll(
                                        RegExp(r'[^\s\w:]'), '');

                                    if (text.isNotEmpty) {
                                      dummyData[index]['message_body'] = text;
                                      dummyData[index]['message'] = "me";
                                      dummyData[index]['time'] = time;

                                      Navigator.of(context).pop();
                                    }
                                    print('Clicked');
                                  },
                                  child: const Icon(Icons.send, size: 18),
                                ),
                              ),
                            ),
                          ),
                        ),
                        spacerH10(),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Row(
                            children: [
                              Container(
                                child: Image.asset(
                                  'assets/images/icons/icons8-love-50.png',
                                  width: 45,
                                  height: 45,
                                ),
                              ),
                              spacerH5(),
                              Container(
                                child: Image.asset(
                                  'assets/images/icons/facebook1.png',
                                  width: 45,
                                  height: 45,
                                ),
                              ),
                              spacerH5(),
                              Container(
                                child: Image.asset(
                                  'assets/images/icons/icons8-grinning-squinting-face-50.png',
                                  width: 45,
                                  height: 45,
                                ),
                              ),
                              spacerH5(),
                              Container(
                                child: Image.asset(
                                  'assets/images/icons/facebook2.png',
                                  width: 45,
                                  height: 45,
                                ),
                              ),
                              spacerH5(),
                              Container(
                                child: Image.asset(
                                  'assets/images/icons/icons8-loudly-crying-face-50.png',
                                  width: 42,
                                  height: 42,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
        ]),
      );
    },
  );
}
