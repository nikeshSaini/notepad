import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../style/app_style.dart';

class NoteReader extends StatefulWidget {
  NoteReader(this.doc,{Key? key}) : super(key: key);
  QueryDocumentSnapshot doc;

  @override
  State<NoteReader> createState() => _NoteReaderState();
}

class _NoteReaderState extends State<NoteReader> {
  late TextEditingController _mainContentController;
  late TextEditingController _titleController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _mainContentController =
        TextEditingController(text: widget.doc["content"]);
    _titleController =
        TextEditingController(text: widget.doc["notes_title"]);

  }




  @override
  Widget build(BuildContext context) {
    final docId = widget.doc.id;

    int color_id = widget.doc['color_id'];
    // print(widget.doc['content']);
    return  Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppStyle.cardsColor[color_id],
      appBar: AppBar(
        title: Text("Edit Notes", style: GoogleFonts.roboto(
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),),
        iconTheme: IconThemeData(color:Colors.black54),
        backgroundColor: AppStyle.cardsColor[color_id],
        elevation: 0,
        actions: [
          IconButton(onPressed: (){
            FirebaseFirestore.instance.collection("Notes").doc(docId).delete().whenComplete(() => Navigator.pop(context));
          }, icon:Icon(Icons.delete_forever,size: 30,), color: Colors.red,),

        ],
      ),
        body: Padding(
          padding: const EdgeInsets.only(left: 25, top: 16,right: 16, bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(widget.doc["creation_date"], style: AppStyle.dateTime.copyWith(color: Colors.black54),),
                ],
              ),
              SizedBox(height: 10,),
              TextField(
                controller: _titleController,
                decoration: InputDecoration(
                    border:InputBorder.none,
                    hintText:'Title',

                  hintStyle: TextStyle(color: Colors.black26),
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
                  hintText: 'Type to add Description',
                  hintStyle: TextStyle(color: Colors.black26),
                ),
                style: AppStyle.mainContent,
              ),

            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green[300],
          onPressed: () async{
            // print(widget.doc.id);
           FirebaseFirestore.instance.collection("Notes").doc(docId).update({
             "content" :_mainContentController.text ,
             "notes_title": _titleController.text,
           }).whenComplete(() => Navigator.pop(context));
          },
          child:Icon(Icons.update, color: AppStyle.cardsColor[color_id],),)
    );


  }
}
