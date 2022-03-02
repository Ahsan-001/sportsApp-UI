import 'package:football_app/Model/fav_item.dart';
import 'package:football_app/Model/profile.dart';
import 'package:get/get.dart';

// class Profiles extends GetxController {
//   final List<ProfileDetailData> _items = <ProfileDetailData>[];
//   // All products
//   // In production, these things usually be loaded them from API or database or something like that

//   //     100,
//   //     (index) => ProfileDetailData(
//   //         id: index,
//   //         name: 'Product $index',
//   //         price: Random().nextDouble() * 100,
//   //         inWishList: false.obs)).obs;

//   // Use this to retrieve all products
//   List<ProfileDetailData> get items {
//     return [..._items];
//   }

//   // This will return the products that were added to wish list
//   List<ProfileDetailData> get wishListItems {
//     return _items.where((item) => item.inWishList!.value == true).toList();
//   }

//   // Add an item to the wish list
//   void addItem(int id) {
//     final int index = _items.indexWhere((item) => item.id == id);
//     _items[index].inWishList!.value = true;
//   }

//   // Remove an item from the wish list
//   void removeItem(int id) {
//     final int index = _items.indexWhere((item) => item.id == id);
//     _items[index].inWishList!.value = false;
//   }
// }

class FavController extends GetxController {
  List<ProfileDetailData> profileDetailData = ProfileDetailData.Details;
  Map<int, FavItem> _items = {};

  Map<int, FavItem> get items {
    return {..._items};
  }

  int get itemCount {
    // return  _items?.length?? 0;
    return _items.length;
  }
  // double get totalAmount{
  //   var total = 0.0;
  //   _items.forEach((key, cartItem) {
  //     total += cartItem.price * cartItem.quantity;
  //   });
  //   return total;
  // }

  void addItem(
    int productId,
    String name,
    String image,
    String age,
    String flag,
    String pos,
    String country,
    String sportname,
  ) {
    if (_items.containsKey(productId)) {
      _items.update(
          productId,
          (existingCartItem) => FavItem(
                id: existingCartItem.id,
                image: existingCartItem.image,
                name: existingCartItem.name,
                age: existingCartItem.age,
                flag: existingCartItem.flag,
                pos: existingCartItem.pos,
                country: existingCartItem.country,
                sportname: existingCartItem.sportname,
              ));
      update();
    } else {
      _items.putIfAbsent(
        productId,
        () => FavItem(
          id: DateTime.now().toString(),
          image: image,
          name: name,
          age: age,
          flag: flag,
          pos: pos,
          country: country,
          sportname: sportname,
        ),
      );
    }
    update();
  }

  void removeitem(int productId) {
    _items.remove(productId);
    update();
  }

  void clear() {
    _items = {};
    update();
  }
}
