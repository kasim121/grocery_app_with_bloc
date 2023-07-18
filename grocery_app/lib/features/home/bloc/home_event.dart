import 'package:flutter/material.dart';
import 'package:grocery_app/features/home/models/product_model.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}
//For WishList Icon to add whishlisted product list
class HomeProductWishlistButtonClickedEvent extends HomeEvent {
  final ProductsDataModel clickedProduct;

  HomeProductWishlistButtonClickedEvent({required this.clickedProduct});
}
//For Cart Icon to add carted product list
class HomeProductCartButtonClickedEvent extends HomeEvent {
    final ProductsDataModel clickedProduct;

  HomeProductCartButtonClickedEvent({required this.clickedProduct});
}
//navigate to Wishlist screen to see whislisted list products
class HomeWishlistButtonNavigateEvent extends HomeEvent {
  
}
//navigate to cart screen to see carted list products
class HomeCartButtonNavigateEvent extends HomeEvent {}
