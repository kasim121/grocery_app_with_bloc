import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:grocery_app/features/wishlist/bloc/wishlist_event.dart';
import 'package:grocery_app/features/wishlist/bloc/wishlist_state.dart';

import '../../../data/wishlist.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishListState> {
  WishlistBloc() : super(WishListInitial()) {
    on<WishlistInitialEvent> (wishlistInitialEvent) ;
    on<WishlistRemoveFromWishlistEvent>(wishlistRemoveFromWishlistEvent);
  }
 

  FutureOr<void> wishlistInitialEvent(WishlistInitialEvent event, Emitter<WishListState> emit) {
     emit(WishListSuccesState(wishListItems: wishListItems));
  }

  FutureOr<void> wishlistRemoveFromWishlistEvent(WishlistRemoveFromWishlistEvent event, Emitter<WishListState> emit) {
    wishListItems.remove(event.productsDataModel);  
        emit(WishListSuccesState(wishListItems: wishListItems));
      
    emit(WishListProductWishListedItemRemovedActionState());
  }
}
