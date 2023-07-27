import 'package:flutter/material.dart';

/// {@template diary_card}
/// A card widget that is used mostly for form sections
/// on the diary app
class DiaryCard extends StatelessWidget {
  /// {@macro diary_card}
  const DiaryCard({required this.child, super.key});

  /// The child widget to be displayed inside the card
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      elevation: 7,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: child,
      ),
    );
  }
}
