import 'package:firebase_auth/firebase_auth.dart';
import 'package:football_app/Bindings/authBinding.dart';
import 'package:football_app/Controlller/userController.dart';
import 'package:football_app/Model/user.dart';
import 'package:football_app/Services/database.dart';
import 'package:football_app/Utils/constants.dart';
import 'package:football_app/screens/Authentication/signin.dart';
import 'package:football_app/widgets/navbar.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Rxn<User> _firebaseUser = Rxn<User>();

  User? get currentUser => _firebaseUser.value;

  @override
  void onInit() {
    super.onInit();
    _firebaseUser.bindStream(_auth.authStateChanges());
  }

  void createUser(String name, String email, String password) async {
    try {
      UserCredential _authResult = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      UserModel _user = UserModel(
        id: _authResult.user!.uid,
        name: name,
        email: _authResult.user!.email,
      );
      await Database().createNewUser(_user);

      Get.offAll(() => SignIn());
    } catch (e) {
      Get.snackbar(
        "error creating acount",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void login(
    String email,
    String password,
  ) async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: email.trim(), password: password);
      Get.put(UserController());
      Get.snackbar(
        'Successfly Signed in',
        'Welcome to Home',
      );
      Get.offAll(() => NavBar(), binding: AuthBinding());

      Get.snackbar(
        'Signed in',
        'SignedIn Successfully',
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      Get.snackbar("Error in Signing In", e.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<void> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      Get.snackbar(
        'Password Reset',
        'Recovery email has been sent!',
        backgroundColor: kDarkColor,
        colorText: kLightColor,
      );
    } catch (e) {
      Get.snackbar(
        'Resetting failed',
        e.toString(),
        backgroundColor: kDarkColor,
        colorText: kLightColor,
      );
    }
  }

  void signOut() async {
    try {
      await _auth.signOut();
      Get.find<UserController>().clear();
      Get.to(SignIn());
      Get.snackbar('Signed out', 'Your are SignedOut');
    } catch (e) {
      Get.snackbar("error signing out", e.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
