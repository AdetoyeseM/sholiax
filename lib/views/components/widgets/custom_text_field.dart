import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopliax/main.dart';
import 'package:shopliax/views/components/formatter.dart';
class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.labelText,
    this.isDate = false,
    this.isTime = false,
    this.onTap,
    this.suffixIcon,
    this.maxLines,
  });

  final TextEditingController controller;
  final String? labelText;
  final bool isDate;
  final bool isTime;
  final Widget? suffixIcon;
  final int? maxLines;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 28),
      child: TextFormField(
        controller: controller,
        maxLines: maxLines ?? 1,
        onTap: isDate || isTime
            ? () async {
                if (isDate) {
                  if (Platform.isIOS) {
                    await showModalBottomSheet<void>(
                      context: context,
                      builder: (_) {
                        final size = MediaQuery.of(context).size;
                        return Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                              topRight: Radius.circular(12),
                            ),
                          ),
                          height: size.height / 3,
                          child: CupertinoDatePicker(
                            minimumDate: DateTime.now(),
                            initialDateTime: DateTime.now(),
                            mode: CupertinoDatePickerMode.date,
                            onDateTimeChanged: (value) {
                              controller.text = formatDate(value);
                            },
                          ),
                        );
                      },
                    );
                  } else {
                    final date = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2100), // Future date limit
                    );
                    if (date != null) {
                      controller.text = formatDate(date);
                    } else {
                      // Optionally show an error message to the user here
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Please select a future date.')),
                      );
                    }
                  }
                } else if (isTime) {
                  final time = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );

                  if (time != null) {
                    final now = TimeOfDay.now();
                    if (time.hour > now.hour || (time.hour == now.hour && time.minute >= now.minute)) {
                      controller.text = formatTime(time);
                    } else {
                      ScaffoldMessenger.of(navigatorKey!.currentContext!).showSnackBar(
                        const SnackBar(content: Text('Please select a future time.')),
                      );
                    }
                  }
                }
              }
            : onTap,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          suffixIconColor: Colors.blue.shade400,
          alignLabelWithHint: false,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade500),
            borderRadius: BorderRadius.circular(8),
          ),
          labelText: '$labelText',
        ),
      ),
    );
  }
}



String formatTime(TimeOfDay time) { 
  final hours = time.hour.toString().padLeft(2, '0');
  final minutes = time.minute.toString().padLeft(2, '0');
  return '$hours:$minutes';
}
