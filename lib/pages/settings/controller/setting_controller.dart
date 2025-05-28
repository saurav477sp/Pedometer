import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class SettingController extends GetxController {
  late final XFile? xFile;
  String userName = '';

  @override
  void onInit() {
    super.onInit();
    getProfileDetails();
  }

  pickCameraImage() async {
    ImagePicker picker = ImagePicker();
    XFile? imageFile = await picker.pickImage(source: ImageSource.camera);
    if (imageFile != null) {
      xFile = imageFile;
    }
  }

  pickGalleryImage() async {
    ImagePicker picker = ImagePicker();
    XFile? imageFile = await picker.pickImage(source: ImageSource.gallery);
    if (imageFile != null) {
      xFile = imageFile;
    }
  }

  getProfileDetails() async {
    String profileName = FirebaseAuth.instance.currentUser!.displayName ?? '';
    userName = profileName;
  }
}
