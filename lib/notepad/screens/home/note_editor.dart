import 'dart:math';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../style/app_style.dart';

class NoteEditor extends StatefulWidget {
  const NoteEditor({Key? key}) : super(key: key);

  @override
  State<NoteEditor> createState() => _NoteEditorState();
}

class _NoteEditorState extends State<NoteEditor> {
  int color_id =  Random().nextInt(AppStyle.cardsColor.length);
  final String date = DateFormat('yyyy/MM/dd :: kk:mm').format(DateTime.now());
  var _titleController = TextEditingController();
  var _mainContentController = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        resizeToAvoidBottomInset : false,
        backgroundColor: AppStyle.cardsColor[color_id],
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black87),
        title: Text("Add Notes", style: GoogleFonts.roboto(
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),),
        backgroundColor:AppStyle.cardsColor[color_id],
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 25, top: 16,right: 16, bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(date, style: AppStyle.dateTime.copyWith(color: Colors.black54),),
              ],
            ),
            SizedBox(height: 10,),
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                border:InputBorder.none,
                hintText: "Title",
                  hintStyle: TextStyle(color: Colors.grey[200])
              ),
              style: AppStyle.mainTitle,

            ),


            SizedBox(height: 28,),
            TextField(
              controller: _mainContentController,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Type to add Notes",
                hintStyle: TextStyle(color: Colors.grey[200]),
              ),
              style: AppStyle.mainContent,
            ),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green[300],
        onPressed: () async{
          FirebaseFirestore.instance.collection("Notes").add({
            "color_id":color_id,
            "content" :_mainContentController.text,
            "creation_date": date,
            "notes_title": _titleController.text,
          }).then((value ){
            print(value.id );
            Navigator.pop(context);
          }).catchError(
                  (error) => print("failed to add notes $error"));
        },
        child:Icon(Icons.save, color: AppStyle.cardsColor[color_id],),)
    );
  }
}
