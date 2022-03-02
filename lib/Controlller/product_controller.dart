import 'package:football_app/Model/profile.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final List<ProfileDetailData> _items = ProfileDetailData.Details;

  List<ProfileDetailData> get items {
    return [..._items];
  }

  ProfileDetailData findProductById(int id) {
    return _items.firstWhere((element) => element.id == id);
  }

  void addProduct() {
    update();
  }

  // void toggleFavouriteStatus(int id) {
  //   items[id].isFavourite = !items[id].isFavourite;
  //   update();
  // }
}
