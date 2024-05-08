import 'package:e_commerce/model/basket_model.dart';
import 'package:flutter/material.dart';
import '../all_pages/detail_product.dart';
import '../model/product_model.dart';

Card oneProductCardInBasket({
  required List<BasketProductModel> products,
  required int index,
  required BuildContext context,
  required Function (String) deleteProduct,
}) {
  return Card(
    child: ListTile(
      onTap: () {
        BasketProductModel basketProductModel = BasketProductModel(
            id: products[index].id,
            title: products[index].title,
            description: products[index].description,
            price: products[index].price,
            discountPercentage: products[index].discountPercentage,
            rating: products[index].rating,
            stock: products[index].stock,
            brand: products[index].brand,
            category: products[index].category,
            thumbnail: products[index].thumbnail,
            images: products[index].images);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    DetailProduct(productModel: basketProductModel)));
      },
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
        side: BorderSide(color: Colors.grey.withOpacity(0.5)),
      ),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.network(
          products[index].images[0],
          fit: BoxFit.contain,
        ),
      ),
      title: Text(
        products[index].title,
        style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${products[index].brand} - ${products[index].category}",
            style: const TextStyle(fontSize: 14.0, color: Colors.grey),
          ),
          const SizedBox(height: 5.0),
          Row(
            children: [
              Text(
                "Price: \$${products[index].price}",
                style: const TextStyle(
                    fontSize: 12.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 5.0),
              if (products[index].discountPercentage > 0)
                Expanded(
                  child: Text(
                    "Discount: ${products[index].discountPercentage}% Off",
                    style: const TextStyle(
                      fontSize: 10.0,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
      trailing: Column(
        children: [
          Expanded(
            child: IconButton(
              icon: const Icon(Icons.delete_outlined),
              onPressed: () async {
                await deleteProduct;
              },
            ),
          ),
          const Spacer(),
        ],
      ),
    ),
  );
}
