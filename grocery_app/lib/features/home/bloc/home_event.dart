import 'package:flutter/material.dart';
import 'package:grocery_app/features/home/models/product_model.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeProductWishlistButtonClickedEvent extends HomeEvent {
  final ProductsDataModel clickedProduct;

  HomeProductWishlistButtonClickedEvent({required this.clickedProduct});
}

class HomeProductCartButtonClickedEvent extends HomeEvent {
    final ProductsDataModel clickedProduct;

  HomeProductCartButtonClickedEvent({required this.clickedProduct});
}

class HomeWishlistButtonNavigateEvent extends HomeEvent {}

class HomeCartButtonNavigateEvent extends HomeEvent {}
