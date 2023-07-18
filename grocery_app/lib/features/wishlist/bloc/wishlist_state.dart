import '../../home/models/product_model.dart';

abstract class WishListState{}
abstract class WishListActinState extends WishListState{}


class WishListInitial extends WishListState{

}
class WishListSuccesState extends WishListState{
   final List<ProductsDataModel> wishListItems;

  WishListSuccesState({required this.wishListItems});
}
class WishListProductWishListedItemRemovedActionState extends WishListActinState{

}
