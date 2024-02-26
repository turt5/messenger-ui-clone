import 'package:flutter/material.dart';

import '../../constants/_colors.dart';
import '../../constants/_spacer.dart';
import '../../dummy/_datas.dart';

class NotesMiddleWidget extends StatefulWidget {
  const NotesMiddleWidget({super.key, required this.index});
  final int index;
  @override
  State<NotesMiddleWidget> createState() => _NotesMiddleWidgetState();
}

class _NotesMiddleWidgetState extends State<NotesMiddleWidget> {
  bool isChanged = false;

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(0, 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment:
        //     CrossAxisAlignment.center,
        children: [
          Transform.translate(
            offset: Offset(0, -10),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: MyColors.white,
                  boxShadow: [
                    BoxShadow(
                      color: MyColors.grey_500,
                      spreadRadius: -2,
                      blurRadius: 10,
                      offset: const Offset(5, 4),
                    ),
                    const BoxShadow(
                      color: MyColors.white,
                      spreadRadius: -2,
                      blurRadius: 10,
                      offset: Offset(0, -4),
                    ),
                  ]),
              width: 250,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Text(
                dummyData[widget.index]['note'],
                // "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 15),
              ),
            ),
          ),
          Stack(
            children: [
              Container(
                alignment: Alignment.center,
                width: 250,
                child: Container(
                  height: 70,
                  width: 70,
                  child: CircleAvatar(
                    backgroundImage:
                        AssetImage(dummyData[widget.index]['profile_pic']),
                  ),
                ),
              ),
              Transform.translate(
                offset: Offset(85, 0),
                child: Container(
                  height: 10,
                  width: 10,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          spacerV10(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                dummyData[widget.index]['name'] == 'Me'
                    ? 'Shared with friends'
                    : 'Shared 2h ago',
                style: TextStyle(color: MyColors.grey_800),
              ),
            ],
          )
        ],
      ),
    );
  }
}
