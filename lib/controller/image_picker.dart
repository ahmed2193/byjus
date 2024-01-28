import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileImageController extends GetxController {
  RxString profileImageUrl = ''.obs;

  Future<void> pickImage() async {
    final ImagePicker imagePicker = ImagePicker();
    final XFile? pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
    
    if (pickedFile != null) {
      profileImageUrl.value = pickedFile.path;
    } else {
      // Handle if the user cancels image picking
    }
  }
}
