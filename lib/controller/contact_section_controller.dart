import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ContactSectionController extends GetxController {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final messageController = TextEditingController();

  final RxBool isLoading = false.obs;

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    messageController.dispose();
    super.onClose();
  }

  Future<void> submitForm() async {
    final String name = nameController.text.trim();
    final String email = emailController.text.trim();
    final String message = messageController.text.trim();

    if (name.isEmpty || email.isEmpty || message.isEmpty) {
      Get.snackbar(
        "Missing Fields",
        "Please fill in all fields before sending your message.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.amber.shade800,
        colorText: Colors.white,
        margin: const EdgeInsets.all(15),
        borderRadius: 12,
        icon: const Icon(Icons.warning_amber_rounded, color: Colors.white),
      );
      return;
    }

    if (!GetUtils.isEmail(email)) {
      Get.snackbar(
        "Invalid Email",
        "Please enter a valid email address.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
        margin: const EdgeInsets.all(15),
        borderRadius: 12,
        icon: const Icon(Icons.error_outline, color: Colors.white),
      );
      return;
    }

    try {
      isLoading.value = true;
      await http.post(
        Uri.parse(
          "https://docs.google.com/forms/d/e/1FAIpQLSfIjMdSR0d5ytXKhM0Jj8HvkvoNnM7sJafidGZo6kfwT-90yw/formResponse",
        ),
        body: {
          "entry.2041429798": name,
          "entry.1394264619": email,
          "entry.271037853": message,
        },
      );
    } catch (e) {
      debugPrint("Form Submission Exception: $e");
    } finally {
      isLoading.value = false;
      nameController.clear();
      emailController.clear();
      messageController.clear();

      Get.snackbar(
        "Message Sent 🎉",
        "Thank you $name! Your message has been received. I will get back to you soon.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: const Color(0xFF10B981),
        colorText: Colors.white,
        margin: const EdgeInsets.all(15),
        borderRadius: 12,
        duration: const Duration(seconds: 4),
        icon: const Icon(Icons.check_circle_outline_rounded, color: Colors.white),
      );
    }
  }
}
