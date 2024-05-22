// ignore_for_file: prefer_const_constructors, type_literal_in_constant_pattern

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_bloc/views/cart/ui/cart.dart';
import 'package:grocery_bloc/views/home/bloc/home_bloc.dart';
import 'package:grocery_bloc/views/home/ui/product_tile.dart';
import 'package:grocery_bloc/views/wishlist/ui/wishlist.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeBloc homeBloc = HomeBloc();

  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeNavigatetoCartActionState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Cart()));
        }
        if (state is HomeNavigatetoWishlistActionState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Wishlist()));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return Scaffold(
              backgroundColor: Colors.white,
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );

          case HomeLoadedSuccessState:
            final successState = state as HomeLoadedSuccessState;

            return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                title: Text("Grocery Store"),
                backgroundColor: Theme.of(context).primaryColor,
                foregroundColor: Colors.white,
                actions: [
                  IconButton(
                      onPressed: () {
                        homeBloc.add(HomeWishlistButtonNavigateEvent());
                      },
                      icon: Icon(Icons.favorite_border_outlined)),
                  IconButton(
                      onPressed: () {
                        homeBloc.add(HomeCartButtonNavigateEvent());
                      },
                      icon: Icon(Icons.shopping_bag_outlined)),
                ],
              ),
              body: ListView.builder(
                  itemCount: successState.products.length,
                  itemBuilder: (context, index) {
                    return ProductTile(productModel: successState.products[index]);
                  }),
            );

          case HomeErrorState:
            return Scaffold(
              body: Center(
                child: Text("Error"),
              ),
            );
        }
        return Scaffold();
      },
    );
  }
}
