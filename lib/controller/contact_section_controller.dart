import 'package:flutter/material.dart';
import 'package:get/get.dart';
 import 'package:http/http.dart' as http;

class ContactSectionController extends GetxController {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final messageController = TextEditingController();

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    messageController.dispose();
    super.onClose();
  }



Future<void> submitForm() async {
  try {
    await http.post(
      Uri.parse(
        "https://docs.google.com/forms/d/e/1FAIpQLSfIjMdSR0d5ytXKhM0Jj8HvkvoNnM7sJafidGZo6kfwT-90yw/formResponse",
      ),
      body: {
        "entry.2041429798": nameController.text,
        "entry.1394264619": emailController.text,
        "entry.271037853": messageController.text,
      },
    );
  } catch (e) {
    print("Database Error: $e");
  }

  // Since the sheet receives data, do UI updates anyway
  nameController.clear();
  emailController.clear();
  messageController.clear();

  Get.snackbar(
    "Success 🎉",
    "Message sent successfully!",
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: Colors.green,
    colorText: Colors.white,
  );
}
}
