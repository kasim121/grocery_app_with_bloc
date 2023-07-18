import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/data/cart.dart';
import 'package:grocery_app/data/grocery.dart';
import 'package:grocery_app/features/home/bloc/home_event.dart';
import 'package:grocery_app/features/home/bloc/home_state.dart';
import 'package:grocery_app/features/home/models/product_model.dart';

import '../../../data/wishlist.dart';
import 'cart_event.dart';
import 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent> (cartInitialEvent) ;
    on<CartRemoveFromCartEvent>(cartRemoveFromCartEvent);
  }
 

  FutureOr<void> cartInitialEvent(CartInitialEvent event, Emitter<CartState> emit) {
    emit(CartSuccesState(cartItems: cartItems));
  }

  FutureOr<void> cartRemoveFromCartEvent(CartRemoveFromCartEvent event, Emitter<CartState> emit) {
    cartItems.remove(event.productsDataModel);  
        emit(CartSuccesState(cartItems: cartItems));
      
    emit(CartProductCartedItemRemovedActionState());
     
  }

}

