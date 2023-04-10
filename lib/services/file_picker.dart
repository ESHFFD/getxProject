import 'package:blog_app/controller/file_picker_controller.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';

FilePickerController filePickerController = Get.put(FilePickerController());
Future pickFile() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.image,
  );

  filePickerController.file.value = result!.files.first;
}
