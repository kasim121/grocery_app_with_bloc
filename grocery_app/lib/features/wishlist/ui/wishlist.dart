import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:grocery_app/features/wishlist/bloc/wishlist_bloc.dart';
import 'package:grocery_app/features/wishlist/ui/wishlist_tile_widget.dart';

import '../bloc/wishlist_event.dart';
import '../bloc/wishlist_state.dart';


class WishList extends StatefulWidget {
  const WishList({super.key});

  @override
  State<WishList> createState() => _WishListState();
}

class _WishListState extends State<WishList> {

  final WishlistBloc wishlistBloc = WishlistBloc();
  @override
  void initState() {
    wishlistBloc.add(WishlistInitialEvent());
 
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text("Cart Items"),),
    body: BlocConsumer<WishlistBloc,WishListState>(
      bloc: wishlistBloc,
      listener: (context,state){
    if (state is WishListProductWishListedItemRemovedActionState) {
    
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text("Wishlisted Item Removed")));
    } 
      },
      listenWhen: (previous,current)=> current is WishListActinState,
      buildWhen: (previous,current)=>current is !WishListActinState,
      builder: (context,state) {
         switch(state.runtimeType){
case WishListSuccesState:

final successState = state as WishListSuccesState;
return   ListView.builder(
                  itemCount: successState.wishListItems.length,
                  itemBuilder: (context,index) {
                    return WishlistTileWidget(productsDataModel: successState.wishListItems[index], wishlistBloc: wishlistBloc,);  
                  }
                );
         }
        
        
      
      return  Container();
  }),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';

// import '../../cart/bloc/cart_bloc.dart';
// import '../bloc/wishlist_bloc.dart';

// class WishList extends StatefulWidget {
//   const WishList({super.key});

//   @override
//   State<WishList> createState() => _WishListState();
// }

// class _WishListState extends State<WishList> {
//     final WishlistBloc homeBloc = WishlistBloc();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(appBar: AppBar(title: Text("WishList"),),
//     body: Center(child: Text("data")),
//     );
//   }
// }