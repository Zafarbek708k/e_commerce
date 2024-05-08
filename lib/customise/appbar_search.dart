import 'package:flutter/material.dart';

Widget customSearch({required TextEditingController textEditingController}){
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20.0),
    child: TextField(
      controller: textEditingController,
      decoration: const InputDecoration(
          hintText: "Search...",
      ),
    ),
  );
}

Widget customAppBar({required bool isSearch, required TextEditingController searchController}){
  return isSearch ? customSearch(textEditingController: searchController) : const Text("E-Commerce", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold));
}