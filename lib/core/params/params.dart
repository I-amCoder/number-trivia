import 'package:flutter/material.dart';

class NoParams {}

class ConcreteNumberParams {
  final int number;

  ConcreteNumberParams({required this.number});
}

class NewsParameters {
  final String country;
  final String category;

  NewsParameters({required this.category, required this.country});
}

enum NewsCategoryType {
  general,
  business,
  entertainment,
  health,
  science,
  sports,
  technology
}

extension NewsCategoryTypeExtension on NewsCategoryType {
  String get name {
    switch (this) {
      case NewsCategoryType.general:
        return 'General';
      case NewsCategoryType.business:
        return 'Business';
      case NewsCategoryType.entertainment:
        return 'Entertainment';
      case NewsCategoryType.health:
        return 'Health';
      case NewsCategoryType.science:
        return 'Science';
      case NewsCategoryType.sports:
        return 'Sports';
      case NewsCategoryType.technology:
        return 'Technology';
    }
  }

  IconData get icon {
    switch (this) {
      case NewsCategoryType.general:
        return Icons.newspaper;
      case NewsCategoryType.business:
        return Icons.business_rounded;
      case NewsCategoryType.entertainment:
        return Icons.tv_rounded;
      case NewsCategoryType.health:
        return Icons.health_and_safety_outlined;
      case NewsCategoryType.science:
        return Icons.science_rounded;
      case NewsCategoryType.sports:
        return Icons.sports_football_rounded;
      case NewsCategoryType.technology:
        return Icons.computer_rounded;
    }
  }
}
