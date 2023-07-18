import 'package:flutter/material.dart';
import 'package:grocery_app/features/home/models/product_model.dart';

@immutable
abstract class CartEvent {}

class CartInitialEvent extends CartEvent {}

class CartRemoveFromCartEvent extends CartEvent {
  final ProductsDataModel productsDataModel;

  CartRemoveFromCartEvent({required this.productsDataModel});
}


