import 'package:flutter/material.dart';

import '../../constants/_spacer.dart';
import '../../dummy/_datas.dart';

class SuggestedContactList extends StatelessWidget {
  const SuggestedContactList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: List.generate(dummyData.length, (index) {
        return Container(
          // color: Colors.red,
          margin: const EdgeInsets.only(bottom: 5,left: 10,right: 10),
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(dummyData[index]['profile_pic'],),
              ),
    
              spacerH10(),
              spacerH5(),
    
    
               Text(dummyData[index]['name'],style: TextStyle(fontSize: 17),)
            ],
    
           
          ),
        );
      }),
    ));
  }
}