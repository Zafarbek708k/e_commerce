import 'package:flutter/material.dart';

import '../customise/appbar_search.dart';
import '../customise/bottom_naw_bar.dart';
import '../customise/custom_drawer.dart';
import 'account.dart';
import 'basket.dart';
import 'home.dart';
import 'chat_page.dart';

class Ecommerce extends StatefulWidget {
  const Ecommerce({super.key});

  @override
  State<Ecommerce> createState() => _EcommerceState();
}

class _EcommerceState extends State<Ecommerce> {
  List <Widget> pages = [const Home(), const Basket(), const Chat(), const Account()];
  int currentIndex = 0;
  bool isSearch = false, isDarkMode = false;
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(55, 155, 125, 0.8),
        title: customAppBar(isSearch: isSearch, searchController: searchController),
        actions: [
          IconButton(
            onPressed: ()=> setState(() {isSearch  = !isSearch;}),
            icon: const Icon(Icons.search),
          ),
          const SizedBox(width: 10)
        ],
      ),
      drawer: customDrawer(),
      body:  SafeArea(child: pages[currentIndex]),
      bottomNavigationBar: bottomNavigationBar(currentIndex: currentIndex, onTabTapped: (value)=>setState(() {currentIndex = value;})),
    );
  }
}

