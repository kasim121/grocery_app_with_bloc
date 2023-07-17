import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/features/home/bloc/home_event.dart';
import 'package:grocery_app/features/home/bloc/home_state.dart';
import 'package:grocery_app/features/home/ui/project_tile_widget.dart';

import '../../cart/ui/cart.dart';
import '../../wishlist/ui/wishlist.dart';
import '../bloc/home_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  final HomeBloc homeBloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<HomeBloc, HomeState>(
        bloc: homeBloc,
        listenWhen: (previous, current) => current
            is HomeActinState, //listen and take some navigation action when HomeAcionState is true
        buildWhen: (previous, current) => current
            is! HomeActinState, // build the ui when HomeAcionState is false
        listener: (BuildContext context, Object? state) {
          if (state is HomeNavigateToCartPageActionState) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Cart()));
          } else if (state is HomeNavigateToWishlistPageActionState) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => WishList()));
          } else if (state is HomeProductItemCartedActionState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("Item Carted")));
          } else if (state is HomeProductItemWishlistedActionState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("Item Wishlisted")));
          }
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case HomeLoadingState:
              return Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            case HomeLoadedSuccessState:
              final successState = state as HomeLoadedSuccessState;
              return Scaffold(
                appBar: AppBar(
                  title: const Text("Bloc Grocery"),
                  actions: [
                    IconButton(
                      onPressed: () {
                        homeBloc.add(HomeWishlistButtonNavigateEvent());
                      },
                      icon: Icon(Icons.favorite_border),
                    ),
                    IconButton(
                      onPressed: () {
                        homeBloc.add(HomeCartButtonNavigateEvent());
                      },
                      icon: Icon(Icons.shopping_cart_outlined),
                    )
                  ],
                ),
                body: ListView.builder(
                    itemCount: successState.products.length,
                    itemBuilder: (context, index) {
                      return ProductsTileWidget(
                        productsDataModel: successState.products[index],
                        homeBloc: homeBloc,
                      );
                    }),
              );

            case HomeActinState:
              return Scaffold(
                body: Center(child: Text("Error")),
              );
            default:
              return SizedBox();
          }
        },
      ),
    );
  }
}
