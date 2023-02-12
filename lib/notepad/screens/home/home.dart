import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../drawer/main_drawer.dart';
import 'note_editor.dart';
import 'note_reader.dart';
import '../../style/app_style.dart';
import '../card/note_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      backgroundColor: AppStyle.mainColor,
      drawer: MainDrawer(),

      appBar: AppBar(
        backgroundColor: AppStyle.mainColor,
        elevation: 0,
        leading: Builder(
          builder: (context) {
            return IconButton(onPressed: (){
              Scaffold.of(context).openDrawer();
            }, icon: Icon(Icons.menu,color: Colors.black,));
          }
        ),
        title: Text("Notes Title", style: GoogleFonts.roboto(
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),),

      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text("Recent Notes", style: GoogleFonts.roboto(
            //   color: Colors.black,
            //   fontSize: 22,
            //   fontWeight: FontWeight.bold,
            // ),),
            SizedBox(height: 20,),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance.collection("Notes").snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot){
                    //checking the connection state if it still load the data or note
                  if(snapshot.connectionState == ConnectionState.waiting){
                    return Center(
                      child: CircularProgressIndicator (),
                    );
                  }
                  if(snapshot.hasData){
                    // final services = snapshot.data?.docs;
                    // List<Widget> servicesWidget =[];
                    // for( var st in services!){
                    //   final docid = st.id;
                    // }

                    return GridView(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,),
                    children:
                    snapshot.data!.docs.map((notes) => noteCard((){
                      Navigator.push(context,MaterialPageRoute(builder: (context)=> NoteReader(notes)));
                    }, notes) ).toList(),
                    );

                  }
                  return Text("There's no Notes", style: GoogleFonts.nunito(
                    color: Colors.white,
                    fontSize: 30,
                  ),);
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.green[300],
        onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> NoteEditor()));
      }, label: Text("Add"),
      icon: Icon(Icons.add),),

    );
  }

}
