import 'package:flutter/material.dart';

import '../models/product_model.dart';

@immutable
abstract class HomeState{}
abstract class HomeActinState extends HomeState{}


class HomeInitial extends HomeState{

}
class HomeLoadingState extends HomeState{

}
class HomeLoadedSuccessState extends HomeState{
final List<ProductsDataModel> products;

  HomeLoadedSuccessState({required this.products});

}

class HomeErrorState extends HomeState{

}
class HomeNavigateToWishlistPageActionState extends HomeActinState{}
class HomeNavigateToCartPageActionState extends HomeActinState{}
class HomeProductItemWishlistedActionState extends HomeActinState{}
class HomeProductItemCartedActionState extends HomeActinState{}

