import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:e_commerce/customise/basket_custom_card.dart';
import 'package:e_commerce/customise/one_product_card.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../constants/api_constants.dart';
import '../model/basket_model.dart';
import '../service/dio_service.dart';

class Basket extends StatefulWidget {
  const Basket({super.key});

  @override
  State<Basket> createState() => _BasketState();
}

class _BasketState extends State<Basket> {
  List<BasketProductModel> products = [];
  bool isError = false;
  bool isLoading = false;
  bool isLike = false;

  Future<void> getDataForBasket() async {
    var resultData = await DioService.getData(context, Constants.basketApi);
    if (resultData.runtimeType == DioException) {
      isError = true;
      log("dio exseption");
      setState(() {});
    } else {
      products = productFromJsonToBasket(resultData as String);
      log("ishladiiiiiiii");
      isLoading = true;
      setState(() {});
    }
  }

  Future<void> deleteProduct(String index) async {
    var resultData =
        await DioService.deleteData(context, Constants.basketApi, index);
    log(resultData.toString());
  }

  @override
  void initState() {
    getDataForBasket();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? products.isNotEmpty
              ? ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return oneProductCardInBasket(
                        products: products,
                        index: index,
                        context: context,
                        deleteProduct: (massage) async {
                          log(massage);
                          await deleteProduct(products[index].id);
                          setState(() {});
                        });
                  },
                )
              : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "There are currently no products in your Cart",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Lottie.asset('assets/lotties/empty.json'),
                    ],
                  ),
                )
          : const Center(child: Text("data")),
    );
  }
}
