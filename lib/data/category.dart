import 'package:flutter/material.dart';

class Category {
  final String categoryName;
  final int categoryID;
  final List<Color> gradient;

  Category({
    this.categoryName,
    this.categoryID,
    this.gradient = const [Color(0xFFD4418E), Color(0xFF0652C5)],
  });
}

List<Category> categories = [
  Category(
      categoryID: 9,
      categoryName: "General Knowledge",
      gradient: [Color(0xFFf12711), Color(0xFFf5af19)]),
  Category(
      categoryID: 10,
      categoryName: "Books",
      gradient: [Color(0xFF005AA7), Color(0xFFFFFDE4)]),
  Category(
      categoryID: 11,
      categoryName: "Film",
      gradient: [Color(0xFF00F260), Color(0xFF0575E6)]),
  Category(
      categoryID: 12,
      categoryName: "Music",
      gradient: [Color(0xFFfc4a1a), Color(0xFFf7b733)]),
  Category(
      categoryID: 13,
      categoryName: "Musicals & Theatres",
      gradient: [Color(0xFFff9966), Color(0xFFff5e62)]),
  Category(
      categoryID: 14,
      categoryName: "Television",
      gradient: [Color(0xFF22c1c3), Color(0xFFfdbb2d)]),
  Category(
      categoryID: 15,
      categoryName: "Video Games",
      gradient: [Color(0xFF283c86), Color(0xFF45a247)]),
  Category(
      categoryID: 16,
      categoryName: "Board Games",
      gradient: [Color(0xFF000046), Color(0xFF1CB5E0)]),
  Category(
      categoryID: 17,
      categoryName: "Science & Nature",
      gradient: [Color(0xFFee0979), Color(0xFFff6a00)]),
  Category(
      categoryID: 18,
      categoryName: "Computers",
      gradient: [Color(0xFF000000), Color(0xFF0f9b0f)]),
  Category(
      categoryID: 19,
      categoryName: "Mathematics",
      gradient: [Color(0xFFef32d9), Color(0xFFef32d9)]),
  Category(
      categoryID: 20,
      categoryName: "Mythology",
      gradient: [Color(0xFF4ECDC4), Color(0xFF556270)]),
  Category(
      categoryID: 21,
      categoryName: "Sports",
      gradient: [Color(0xFFff4b1f), Color(0xFF1fddff)]),
  Category(
      categoryID: 22,
      categoryName: "Geography",
      gradient: [Color(0xFF4CA1AF), Color(0xFFC4E0E5)]),
  Category(
      categoryID: 23,
      categoryName: "History",
      gradient: [Color(0xFF4DA0B0), Color(0xFFD39D38)]),
  Category(
      categoryID: 24,
      categoryName: "Politics",
      gradient: [Color(0xFF2196f3), Color(0xFFf44336)]),
  Category(
      categoryID: 25,
      categoryName: "Art",
      gradient: [Color(0xFF114357), Color(0xFFF29492)]),
  Category(
      categoryID: 26,
      categoryName: "Celebrities",
      gradient: [Color(0xFFC02425), Color(0xFFF0CB35)]),
  Category(
      categoryID: 27,
      categoryName: "Animals",
      gradient: [Color(0xFF5A3F37), Color(0xFF2C7744)]),
  Category(
      categoryID: 28,
      categoryName: "Vehicles",
      gradient: [Color(0xFF2c3e50), Color(0xFF3498db)]),
  Category(
      categoryID: 29,
      categoryName: "Comics",
      gradient: [Color(0xFFCCCCB2), Color(0xFF757519)]),
  Category(
      categoryID: 30,
      categoryName: "Science: Gadgets",
      gradient: [Color(0xFFBA8B02), Color(0xFF181818)]),
  Category(
      categoryID: 31,
      categoryName: "Japanese Anime & Manga",
      gradient: [Color(0xFFF1F2B5), Color(0xFF135058)]),
  Category(
      categoryID: 32,
      categoryName: "Cartoon & Animations",
      gradient: [Color(0xFF360033), Color(0xFF0b8793)]),
];
