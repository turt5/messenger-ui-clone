import 'package:flutter/material.dart';

import '../../constants/_colors.dart';

class ChatSPageFirstRow extends StatelessWidget {
  const ChatSPageFirstRow({
    super.key,
    required GlobalKey<ScaffoldState> scaffoldKey,
  }) : _scaffoldKey = scaffoldKey;

  final GlobalKey<ScaffoldState> _scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    // open drawer
                    _scaffoldKey.currentState?.openDrawer();
                  },
                  icon: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: MyColors.grey_300),
                      child: const Icon(Icons.menu))),
              const SizedBox(
                width: 10,
              ),
              const Text(
                'Chats',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          IconButton(
              onPressed: () {},
              icon: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: MyColors.grey_300),
                  child: Image.asset(
                    'assets/images/icons/icons8-pencil-50.png',
                    width: 20,
                  ))),
        ],
      ),
    );
  }
}
