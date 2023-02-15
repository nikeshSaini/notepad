import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../style/app_style.dart';
Widget noteCard(Function()? onTap, QueryDocumentSnapshot doc ){

  return InkWell(
    onTap: onTap,
    child: Container(
       padding: EdgeInsets.all(8),
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
         color: AppStyle.cardsColor[doc['color_id']],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(doc["notes_title"], style: AppStyle.mainTitle,),
          SizedBox(height: 5,),
          // Text(doc["creation_date"], style: AppStyle.dateTime,),
          SizedBox(height: 8,),
          Flexible(
              child: Text(doc["content"], style: AppStyle.mainContent,
                overflow: TextOverflow.clip,
              ),
          ),
        ],
      ),
    ),

  );
}