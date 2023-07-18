import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/features/cart/bloc/cart_event.dart';

import '../../home/ui/project_tile_widget.dart';
import '../bloc/cart_bloc.dart';
import '../bloc/cart_state.dart';
import 'cart_tile_widget.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {

  final CartBloc cartBloc = CartBloc();
  @override
  void initState() {
    cartBloc.add(CartInitialEvent());
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Cart Items"),),
    body: BlocConsumer<CartBloc,CartState>(
      bloc: cartBloc,
      listener: (context,state){
    if (state is CartProductCartedItemRemovedActionState) {
    
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("Carted Item Removed")));
    } 
      },
      listenWhen: (previous,current)=> current is CartActinState,
      buildWhen: (previous,current)=>current is !CartActinState,
      builder: (context,state) {
         switch(state.runtimeType){
case CartSuccesState:

final successState = state as CartSuccesState;
return   ListView.builder(
                  itemCount: successState.cartItems.length,
                  itemBuilder: (context,index) {
                    return CartTileWidget(productsDataModel: successState.cartItems[index], cartBloc: cartBloc,);  
                  }
                );
         }
        
        
      
      return  Container();
  }),
    );
  }
}