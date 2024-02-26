import 'package:flutter/material.dart';
import 'package:messenger_clone/dummy/_datas.dart';
import 'package:messenger_clone/ui/screen/_leave_new_note.dart';

import '../../constants/_colors.dart';
import '../../constants/_spacer.dart';

class OwnNote extends StatefulWidget {
  const OwnNote({super.key, required this.index});
  final int index;
  @override
  State<OwnNote> createState() => _OwnNoteState();
}

class _OwnNoteState extends State<OwnNote> {


  bool changed=false;


  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          SizedBox(
            height: 40,
            width: MediaQuery.of(context).size.width - 20,
            child: ElevatedButton(
                onPressed: () {
                  changed=true;
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>NewNote(index: widget.index,)));
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: MyColors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                child: const Text(
                  'Leave a new note',
                  style:
                      TextStyle(fontSize: 15, color: MyColors.white),
                )),
          ),
          spacerV5(),
          SizedBox(
            height: 40,
            width: MediaQuery.of(context).size.width - 20,
            child: ElevatedButton(
                onPressed: () {
                 setState(() {
                    dummyData[widget.index]['note']="";
                 });
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: MyColors.white, elevation: 0),
                child: const Text(
                  'Delete note',
                  style:
                      TextStyle(fontSize: 15, color: MyColors.black),
                )),
          ),
          spacerV10()
        ],
      );
  }
}