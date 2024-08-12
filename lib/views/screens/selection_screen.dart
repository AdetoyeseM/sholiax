import 'package:flutter/material.dart';
import 'package:shopliax/views/components/navigation.dart';
import 'package:shopliax/views/components/widgets/custom_button.dart';
import 'package:shopliax/views/screens/place_holder_screen.dart';
import 'package:shopliax/views/screens/todo_screen.dart';

class SelectionScreen extends StatelessWidget {
  SelectionScreen({super.key});

  final ValueNotifier<int> page = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 17, vertical: kBottomNavigationBarHeight * 3),
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: ListView(
                children: [
                  Center(
                    child: Image.asset(
                      "assets/images/pngs/logo.png",
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            CustomButton(
              enabled: true,
              onTap: () {
                navigateToPage(TodoListScreen());
              },
              text: "View TODO List",
            ),
            const SizedBox(
              height: 10,
            ),
            CustomButton(
              enabled: true,
              onTap: () {
                navigateToPage(PlaceHolderScreen());
              },
              text: "View APIs",
            ),
          ],
        ),
      ),
    );
  }
}
