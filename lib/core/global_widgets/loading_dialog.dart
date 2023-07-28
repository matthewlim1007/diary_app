import 'package:flutter/material.dart';

/// {@template LoadingDialog}
/// Shows a loading dialog for the app
/// {@endTemplate}
class LoadingDialog extends StatefulWidget {
  /// {@macro LoadingDialog}
  const LoadingDialog({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LoadingDialogState();
  }

  /// Shows the dialog
  Future<void> show(BuildContext context) async {
    await showDialog<dynamic>(
      context: context,
      useRootNavigator: false,
      builder: (_) {
        return const LoadingDialog();
      },
      barrierDismissible: false,
      barrierColor: Colors.black38,
    );
  }
}

class _LoadingDialogState extends State<LoadingDialog> {
  @override
  Widget build(BuildContext context) {
    return const SimpleDialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      children: [
        Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
