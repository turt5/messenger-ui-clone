import 'package:flutter/material.dart';
import 'package:messenger_clone/constants/_colors.dart';
import 'package:messenger_clone/constants/_spacer.dart';
import '../widgets/_suggested_contacts.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      body: SafeArea(
          child: Column(children: [
        Container(
          // height: 100,
          margin: const EdgeInsets.symmetric(horizontal: 10),
          padding: const EdgeInsets.only(bottom: 10),
          // color: Colors.red,
          child: Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: MyColors.black,
                  )),
              SizedBox(
                width: MediaQuery.of(context).size.width - 100,
                child: TextField(
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: MyColors.white,
                      hintText: 'Search',
                      hintStyle: TextStyle(color: MyColors.grey_500),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none),
                ),
              )
            ],
          ),
        ),
        Container(
          height: 2,
          color: MyColors.grey_100,
        ),
        Expanded(
            child: Container(
          // color: Colors.red,
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: ListView(
            children: [
              spacerV10(),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Text(
                  'Suggested',
                  style: TextStyle(
                      color: MyColors.grey_700,
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                ),
              ),
              spacerV10(),
              spacerV5(),

              const SuggestedContactList()
            ],
          ),
        ))
      ])),
    );
  }
}


