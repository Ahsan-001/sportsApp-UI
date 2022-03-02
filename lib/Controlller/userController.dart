import 'package:football_app/Controlller/authcontroller.dart';
import 'package:football_app/Model/user.dart';
import 'package:football_app/Services/database.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  final Rx<UserModel> _userModel = UserModel().obs;

  UserModel get userGetter => _userModel.value;
  set userGetter(UserModel value) => _userModel.value = value;

  @override
  void onInit() {
    super.onInit();

    String? uid = Get.find<AuthController>().currentUser!.uid;
    _userModel.bindStream(Stream.fromFuture(Database().getUser(uid)));
  }

  void clear() {
    _userModel.value = UserModel();
  }
}
