import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ContactDialog extends StatelessWidget {
  final bool isEdit;
  final TextEditingController name;
  final TextEditingController phone;
  final GlobalKey<FormState> formKey;
  final void Function()? onPressed;
  const ContactDialog({
    super.key,
    this.isEdit = false,
    required this.name,
    required this.phone,
    required this.formKey,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("${!isEdit ? "Add" : "Edit"} Contact"),
      content: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Name"),
            const SizedBox(height: 6),
            TextFormField(
              controller: name,
              style: const TextStyle(
                color: Colors.white,
              ),
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(
                    color: Colors.white60,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(
                    color: Colors.white,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(
                    color: Colors.red,
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(
                    color: Colors.red,
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                hintText: "Enter name",
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Name cannot be empty";
                }
                return null;
              },
            ),
            const SizedBox(height: 12),
            const Text("Phone"),
            const SizedBox(height: 6),
            TextFormField(
              controller: phone,
              style: const TextStyle(
                color: Colors.white,
              ),
              keyboardType: TextInputType.phone,
              maxLength: 10,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(
                    color: Colors.white60,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(
                    color: Colors.white,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(
                    color: Colors.red,
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(
                    color: Colors.red,
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                hintText: "Enter name",
                counterText: '',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Phone number cannot be empty";
                } else if (!RegExp(r'^(?:[+0]9)?[0-9]{10}$').hasMatch(value)) {
                  return "Enter a valid phone number";
                }
                return null;
              },
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("Cancel"),
        ),
        ElevatedButton(
          onPressed: onPressed,
          child: Text(!isEdit ? "Add" : "Edit"),
        )
      ],
    );
  }
}