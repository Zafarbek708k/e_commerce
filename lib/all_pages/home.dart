import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:e_commerce/constants/api_constants.dart';
import 'package:e_commerce/model/category_model.dart';
import 'package:e_commerce/model/product_model.dart';
import 'package:e_commerce/service/dio_service.dart';
import 'package:flutter/material.dart';
import '../customise/category_list.dart';
import '../customise/error_page.dart';
import '../customise/one_product_card.dart';
import '../customise/utils.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Product allProductModel;
  List oneProductModel = [];
  List<CategoryModel> category = [];
  List<ProductElement> products = [];
  bool isError = false;
  bool isLoading = false;
  TextEditingController searchController = TextEditingController();

  Future<void> getAllData() async {
    isLoading = false;
    var resultData = await DioService.getData(context, Constants.baseApi);
    log(resultData.runtimeType.toString());
    log(resultData.runtimeType.toString());
    log(resultData.runtimeType.toString());

    if (resultData.runtimeType == DioException) {
      log("message bla bla bla bla");
      isError = true;
      setState(() {});
      resultData = resultData as DioException;
      Utils.fireSnackBar(
          "DioException: Error at ${resultData.requestOptions.uri}"
          ". Because of ${resultData.type.name}",
          context);
    } else {
      oneProductModel = productFromJson(resultData as String);
      allProductModel = oneProductModel[0];
      // allProductModel =  allProductModelFromJson(resultData as String);
      products = allProductModel.products;
      isError = false;
      isLoading = true;
      setState(() {});
    }
  }

  @override
  void didChangeDependencies() async {
    await getAllData();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isError
          ? errorWidget(context, () async {
              await getAllData();
              setState(() {

              });
            })
          : isLoading
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Center(
                    child: ListView.builder(
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          return Container(
                            color: Colors.grey,
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height * 0.2,
                            child: categoryList(category: category),
                          );
                        } else {
                          return oneProductCard(
                              products: products,
                              index: index,
                              context: context);
                        }
                      },
                    ),
                  ),
                )
              : const Center(child: CircularProgressIndicator()),
    );
  }
}
