import 'package:flutter/material.dart';

Drawer customDrawer(){
  return Drawer(
    backgroundColor: const Color.fromRGBO(55, 155, 125, 0.9),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          const DrawerHeader(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(radius: 50,backgroundColor: Colors.cyan,),
                  Column(
                    children: [
                      Text("NameName",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
                      Text("NameName",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
                      Text("NameName",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
                      Text("NameName",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
                      Text("NameName",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
                    ],
                  ),
                  SizedBox(width: 0.01)
                ],
              )
          ),
          Card(
            child: ListTile(
              onTap: (){},
              title: const Text("Data 1"),
            ),
          ),
          Card(
            child: ListTile(
              onTap: (){},
              title: const Text("Data 2"),
            ),
          ),
          Card(
            child: ListTile(
              onTap: (){},
              title: const Text("Data 3"),
            ),
          ),
          Card(
            child: ListTile(
              onTap: (){},
              title: const Text("Data 4"),
            ),
          ),
        ],
      ),
    ),
  );
}
