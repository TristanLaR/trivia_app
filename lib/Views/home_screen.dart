import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:trivia_app/Helpers/helpers.dart';
import 'package:trivia_app/Views/quiz_screen.dart';
import 'package:trivia_app/data/category.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trivia_app/data/difficulty.dart';

final categoryProvider = StateProvider<Category>((ref) => Category());
final difficultyProvider = StateProvider<Difficulty>((ref) => Difficulty.any);

class HomeScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final category = useProvider(categoryProvider);
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [category.state.gradient.first, category.state.gradient.last],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 48.0),
            Column(
              children: [
                Text(
                  '10 Questions',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 50.0,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Lobster',
                  ),
                ),
              ],
            ),
            Divider(
              color: Colors.grey[200],
              height: 32.0,
              thickness: 2.0,
              indent: 20.0,
              endIndent: 20.0,
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CategoryDropdown(),
                    SizedBox(height: 32.0),
                    DifficultyDropdown(),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 300.0),
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
          isExpanded: true,
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
              color: Colors.grey,
              fontSize: 18,
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

class DifficultyDropdown extends StatefulWidget {
  @override
  _DifficultyDropdownState createState() => _DifficultyDropdownState();
}

class _DifficultyDropdownState extends State<DifficultyDropdown> {
  Difficulty _difficulty;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30, 10, 30, 5),
        child: DropdownButton<Difficulty>(
          value: _difficulty,
          isExpanded: true,
          style: TextStyle(
            color: Colors.black,
            fontSize: 15,
          ),
          items: Difficulty.values.map((Difficulty _difficulty) {
            return new DropdownMenuItem<Difficulty>(
              child: new Text(
                  EnumToString.convertToString(_difficulty).capitalize()),
              value: _difficulty,
            );
          }).toList(),
          hint: Text(
            "Difficulty",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 18,
            ),
          ),
          underline: Container(),
          onChanged: (Difficulty difficulty) {
            setState(() {
              _difficulty = difficulty;
              context.read(difficultyProvider).state = _difficulty;
            });
          },
        ),
      ),
    );
  }
}
