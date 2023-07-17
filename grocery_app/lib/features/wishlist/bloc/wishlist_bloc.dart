import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/data/cart.dart';
import 'package:grocery_app/data/grocery.dart';
import 'package:grocery_app/features/home/bloc/home_event.dart';
import 'package:grocery_app/features/home/bloc/home_state.dart';
import 'package:grocery_app/features/home/models/product_model.dart';

import '../../../data/wishlist.dart';

class WishlistBloc extends Bloc<HomeEvent, HomeState> {
  WishlistBloc() : super(HomeInitial()) {

  }
 
}
