import 'package:flutter/material.dart';
import 'package:practice/notepad/style/app_style.dart';

class MainDrawer extends StatefulWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor:AppStyle.mainColor,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            color: Colors.blue,
            child: Column(
              children: [
                SizedBox(height: 50,),
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(image: NetworkImage("http://images5.fanpop.com/image/photos/28000000/Zoro-D-roronoa-zoro-28002003-2560-1848.jpg"),
                    fit: BoxFit.cover)
                  ),
                ),
                SizedBox(height: 10,),
                Text("Name", style: AppStyle.mainContent.copyWith(
                  color: Colors.white,
                ),),
                SizedBox(height: 10,),


              ],
            ),
          ),
          ListTile(
            leading:Icon(Icons.note) ,
            title :Text("All Notes"),
          ),
          ListTile(
            leading:Icon(Icons.settings) ,
            title :Text("Setting"),
          ),
          ListTile(
            leading:Icon(Icons.logout) ,
            title :Text("Logout"),
          ),

        ],
      ),
    );
  }
}
