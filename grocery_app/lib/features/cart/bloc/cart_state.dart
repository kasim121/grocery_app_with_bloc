import 'package:flutter/material.dart';

import '../../home/models/product_model.dart';



@immutable
abstract class CartState{}
abstract class CartActinState extends CartState{}


class CartInitial extends CartState{

}
class CartSuccesState extends CartState{
   final List<ProductsDataModel> cartItems;

  CartSuccesState({required this.cartItems});
}
class CartProductCartedItemRemovedActionState extends CartActinState{

}
