import 'package:flutter/material.dart';

import 'package:grocery_app/features/home/models/product_model.dart';


import '../bloc/wishlist_bloc.dart';
import '../bloc/wishlist_event.dart';

class WishlistTileWidget extends StatelessWidget {
  final ProductsDataModel productsDataModel;
  final WishlistBloc wishlistBloc;
  const WishlistTileWidget({super.key, required this.productsDataModel, required this.wishlistBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 150,
            width: double.maxFinite,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(productsDataModel.imageUrl),
                    fit: BoxFit.cover)),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            productsDataModel.name,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(
            productsDataModel.description,
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$ ${productsDataModel.price}',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      wishlistBloc.add(WishlistRemoveFromWishlistEvent(productsDataModel: productsDataModel));
                     // ignore: avoid_print
                     print("Wishlisted removed");
                    },
                    icon: const Icon(Icons.favorite_border),
                  ),
                  IconButton(
                    onPressed: () {
                    //  wishlistBloc.add(WishlistRemoveFromWishlistEvent(productsDataModel: productsDataModel));
                    //  print("Wishlisted removed");
                    },
                    icon: const Icon(Icons.shopping_bag),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
