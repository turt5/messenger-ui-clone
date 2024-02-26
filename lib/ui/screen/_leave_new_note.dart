import 'package:flutter/material.dart';
import 'package:messenger_clone/constants/_colors.dart';
import 'package:messenger_clone/constants/_spacer.dart';
import 'package:messenger_clone/dummy/_datas.dart';
import 'package:messenger_clone/ui/screen/_screenmain.dart';

class NewNote extends StatefulWidget {
  const NewNote({super.key, required this.index});

  final int index;

  @override
  State<NewNote> createState() => _NewNoteState();
}

class _NewNoteState extends State<NewNote> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.cancel)),
        title: const Text('New note'),
        actions: [
          GestureDetector(
            onTap: () {
              String text = _controller.text.toString().trim();

              if (text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Center(child: Text('Please enter a note to share!'))));
              } else {
                setState(() {
                  dummyData[widget.index]['note'] = text;
                });

                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ScreenMain()));
              }
            },
            child: Container(
              // color: Colors.white,
              margin: EdgeInsets.only(right: 10),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                'SHARE',
                style: TextStyle(fontSize: 16, color: MyColors.blue),
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Container(
                        height: 120,
                        width: 250,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: MyColors.grey_300,
                              offset: Offset(4, 4),
                              blurRadius: 15,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        padding: EdgeInsets.all(10),
                        child: TextField(
                          controller: _controller,
                          showCursor: true,
                          enabled: true,
                          maxLength: 60,
                          maxLines: 4,
                          decoration: InputDecoration(
                            hintText: 'Enter your note',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                color: MyColors.white,
                                width: 2,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                color: MyColors.white,
                                width: 2,
                              ),
                            ),
                          ),
                        ),
                      ),
                      spacerV10(),
                      spacerV5(),
                      SizedBox(
                        height: 60,
                        width: 60,
                        child: CircleAvatar(
                          backgroundImage: AssetImage(
                              dummyData[widget.index]['profile_pic']),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            height: 50,
            child: const Text(
              "Friends can see your note for 24 hrs. People won't get a notification when you share",
              textAlign: TextAlign.center,
            ),
          )
        ]),
      ),
    );
  }
}
