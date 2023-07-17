import 'package:flutter/material.dart';
import 'package:grocery_app/features/home/models/product_model.dart';

@immutable
abstract class CartEvent {}

class CartInitialEvent extends CartEvent {}

class CartRemoveFromCartEvent extends CartEvent {
  final ProductsDataModel productsDataModel;

  CartRemoveFromCartEvent({required this.productsDataModel});
}

// class HomeCartButtonClickedEvent extends CartEvent {
//     final HomeProductsDataModel clickedProduct;

//   HomeCartButtonClickedEvent({required this.clickedProduct});
// }

// class HomeWishlistButtonNavigateEvent extends CartEvent {}

// class HomeCartButtonNavigateEvent extends CartEvent {}
