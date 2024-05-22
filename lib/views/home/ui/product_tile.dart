import 'package:flutter/material.dart';
// import 'package:grocery_bloc/views/home/bloc/home_bloc.dart';
import 'package:grocery_bloc/views/home/models/product_model.dart';

class ProductTile extends StatelessWidget {
  final ProductModel productModel;
  const ProductTile({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 220,
            width: double.maxFinite,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(productModel.imageUrl))),
          ),
          const SizedBox(height: 20),
          Text(productModel.name,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Text(productModel.desc),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("\$" + productModel.price.toString(),
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        // homeBloc.add(HomeProductWishlistButtonClickedEvent(
                        //     clickedProduct: productModel));
                      },
                      icon: Icon(Icons.favorite_border)),
                  IconButton(
                      onPressed: () {
                        // homeBloc.add(HomeProductCartButtonClickedEvent(
                        //     clickedProduct: productModel));
                      },
                      icon: Icon(Icons.shopping_bag_outlined)),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
