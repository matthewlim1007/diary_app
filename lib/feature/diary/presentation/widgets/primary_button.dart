import 'package:flutter/material.dart';

/// {@template PrimaryButton}
/// A button widget that is primarily used for the
/// Diary app
/// {@endTemplate PrimaryButton}
class PrimaryButton extends StatelessWidget {
  /// {@macro PrimaryButton}
  const PrimaryButton({
    required this.onPressed,
    required this.buttonText,
    super.key,
  });

  /// The callback function when the button is pressed
  final VoidCallback onPressed;

  /// The text to be displayed on the button
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Colors.transparent,
      elevation: 5,
      child: SizedBox(
        width: double.infinity,
        height: 55,
        child: TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              Theme.of(context).colorScheme.secondary,
            ),
          ),
          onPressed: () => onPressed,
          child: Text(
            buttonText,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ),
    );
  }
}
