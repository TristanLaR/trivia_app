import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:trivia_app/Helpers/helpers.dart';
import 'package:trivia_app/Views/quiz_screen.dart';
import 'package:trivia_app/controllers/quiz/quiz_controller.dart';
import 'package:trivia_app/data/category.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trivia_app/repositories/quiz_repository.dart';

final categoryProvider = StateProvider<Category>((ref) => Category());

class HomeScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFD4418E), Color(0xFF0652C5)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            SizedBox(height: 48.0),
            Text(
              'Trivia App',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 30.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            Divider(
              color: Colors.grey[200],
              height: 32.0,
              thickness: 2.0,
              indent: 20.0,
              endIndent: 20.0,
            ),
            const SizedBox(height: 30.0),
            CategoryDropdown(),
          ],
        ),
        bottomSheet: CustomButton(
          title: 'Start Quiz',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ScreenController(),
              ),
            );
          },
        ),
      ),
    );
  }
}

class CategoryDropdown extends StatefulWidget {
  @override
  _CategoryDropdownState createState() => _CategoryDropdownState();
}

class _CategoryDropdownState extends State<CategoryDropdown> {
  Category _chosenValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30, 10, 30, 5),
        child: DropdownButton<Category>(
          value: _chosenValue,
          style: TextStyle(
            color: Colors.black,
            fontSize: 15,
          ),
          items: categories.map((item) {
            return new DropdownMenuItem<Category>(
              child: new Text(item.categoryName),
              value: item,
            );
          }).toList(),
          hint: Text(
            "Category",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          underline: Container(),
          onChanged: (Category category) {
            setState(() {
              _chosenValue = category;
              context.read(categoryProvider).state = _chosenValue;
            });
          },
        ),
      ),
    );
  }
}
