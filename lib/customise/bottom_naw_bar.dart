import 'package:flutter/material.dart';

BottomNavigationBar bottomNavigationBar({required int currentIndex,  required void Function(int value)? onTabTapped}){
  return  BottomNavigationBar(
    currentIndex: currentIndex,
    onTap: onTabTapped,
    selectedItemColor: Colors.black,
    unselectedItemColor: Colors.white,
    type: BottomNavigationBarType.fixed,
    backgroundColor: const Color.fromRGBO(55, 155, 125, 1.0),
    items: const [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
      BottomNavigationBarItem(icon: Icon(Icons.shopping_basket_outlined), label: "Basket"),
      BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_outline), label: "Chat"),
      BottomNavigationBarItem(icon: Icon(Icons.manage_accounts), label: "Account"),
    ],
  );
}

