import 'package:flutter/material.dart';
import 'package:grocery_app/features/home/models/product_model.dart';

@immutable
abstract class WishlistEvent {}

class WishlistInitialEvent extends WishlistEvent {}

class WishlistRemoveFromWishlistEvent extends WishlistEvent {
  final ProductsDataModel productsDataModel;

  WishlistRemoveFromWishlistEvent({required this.productsDataModel});
}


