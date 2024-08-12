import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.text, this.onTap, this.enabled});

  final String? text;
  final void Function()? onTap;
  final bool? enabled;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: enabled!
            ? () {
                onTap!.call();
              }
            : () {},
        child: Container(
          height: 55,
          width: double.infinity,
          decoration: BoxDecoration(
            color: enabled!
                ? Colors.blue.shade400
                : Colors.blue.shade400.withOpacity(.5),
            border: Border.all(
                color: enabled!
                    ? Colors.blue.shade400
                    : Colors.blue.shade400.withOpacity(.5)),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              text ?? "Continue",
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
          ),
        ));
  }
}
