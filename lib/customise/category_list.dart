import 'package:flutter/material.dart';
import '../model/category_model.dart';

ListView categoryList({required List<CategoryModel> category}) {
  return ListView.separated(
    scrollDirection: Axis.horizontal,
    itemBuilder: (context, index) {
      // You need to return the widget representing each category
      return const Text("category[index].toString()");
    },
    separatorBuilder: (context, index) {
      return Card(
        child: ListTile(
          title: Container(),
        ),
      );
    },
    itemCount: category.length,
  );
}

