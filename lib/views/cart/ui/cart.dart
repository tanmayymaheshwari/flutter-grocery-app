// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_bloc/views/cart/bloc/cart_bloc.dart';
import 'package:grocery_bloc/views/cart/ui/cart_tile.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final CartBloc cartBloc = CartBloc();

  @override
  void initState() {
    cartBloc.add(CartInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer(
        bloc: cartBloc,
        listenWhen: (previous, current) => current is CartActionState,
        buildWhen: (previous, current) => current is! CartActionState,
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.runtimeType) {

            case CartSuccessState: 
              final successState = state as CartSuccessState;
              return Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBar(
                  title: Text("Cart Items"),
                  backgroundColor: Theme.of(context).primaryColor,
                  foregroundColor: Colors.white,
                  // actions: [
                  //   IconButton(
                  //       onPressed: () {
                  //         cartBloc.add(HomeWishlistButtonNavigateEvent());
                  //       },
                  //       icon: Icon(Icons.favorite_border_outlined)),
                  //   IconButton(
                  //       onPressed: () {
                  //         cartBloc.add(HomeCartButtonNavigateEvent());
                  //       },
                  //       icon: Icon(Icons.shopping_bag_outlined)),
                  // ],
                ),
                body: ListView.builder(
                    itemCount: successState.cartItems.length,
                    itemBuilder: (context, index) {
                      return CartTile(
                        productModel: successState.cartItems[index],
                        cartBloc: cartBloc,
                      );
                    }),
              );
            default:
          }
          return Scaffold();
        }
      )
    );
  }
}
