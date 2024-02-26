import 'package:flutter/material.dart';

import '../../constants/_colors.dart';
import '../../dummy/_datas.dart';
import '_show_notes.dart';

class Notes extends StatelessWidget {
  const Notes({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(dummyData.length, (index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        height: 57,
                        width: 57,
                        margin: const EdgeInsets.only(
                            right: 25, top: 5),
                        child: CircleAvatar(
                          backgroundImage: AssetImage(
                              dummyData[index]['profile_pic']),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 25, top: 5),
                        child: Text(dummyData[index]['name'] == 'Me'
                            ? "Your note"
                            : dummyData[index]['name']),
                      )
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      showNotes(context, index);
                    },
                    child: Transform.translate(
                      offset: const Offset(-5, -10),
                      child: ConstrainedBox(
                        constraints:
                            const BoxConstraints(maxWidth: 95),
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 5),
                          padding: const EdgeInsets.symmetric(
                              vertical: 5),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
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
                            ],
                          ),
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(
                              // maxHeight: 30,
                              minHeight: 20,
                            ),
                            child: Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5),
                              child: Text(
                                dummyData[index]['note'],
                                // "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style:
                                    const TextStyle(fontSize: 12),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }

}