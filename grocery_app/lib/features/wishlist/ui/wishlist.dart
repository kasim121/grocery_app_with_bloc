import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../cart/bloc/cart_bloc.dart';
import '../bloc/wishlist_bloc.dart';

class WishList extends StatefulWidget {
  const WishList({super.key});

  @override
  State<WishList> createState() => _WishListState();
}

class _WishListState extends State<WishList> {
    final WishlistBloc homeBloc = WishlistBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("WishList"),),
    body: Center(child: Text("data")),
    );
  }
}