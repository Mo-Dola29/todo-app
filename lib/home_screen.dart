import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/bottom_sheet.dart';
 import 'package:todo/settings_tab.dart';
import 'package:todo/todos_tab.dart';

class HomeScreen extends StatefulWidget {
  static String route_name = 'HomeScreen';


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 int  current_index=0;

 List<Widget> tabs=[
     TodsT(),
     SettingsTab()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * .15,
        title: const Text('To Do List'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ShowBottomSheet(context);
        },

        child: const Icon(Icons.add),
        shape: const StadiumBorder(
          side: BorderSide(color: Colors.white,width: 2)
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(

        clipBehavior: Clip.antiAlias,
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        elevation: 0,
        child: BottomNavigationBar(
          onTap: (index){
            current_index=index;
            setState(() {

            });
          },
          currentIndex:current_index ,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(label: 'todos', icon: Icon(Icons.list)),
            BottomNavigationBarItem(label: 'todos', icon: Icon(Icons.settings))
          ],
        ),
      ),
    body: tabs[current_index],
    );

  }
}

void ShowBottomSheet(context) {

  showModalBottomSheet(
       context: context,

      builder:(context){

    return AddBottomSheet();

  } );
}
