import 'package:flutter/material.dart';

class CustomSnackbar extends StatelessWidget {
  final String message;
  final Color backgroundColor;
  final TextStyle textStyle;
  final String? actionLabel;
  final VoidCallback? onActionPressed;
  final Duration duration;

  const CustomSnackbar({
    super.key,
    required this.message,
    this.backgroundColor = Colors.green,
    this.textStyle = const TextStyle(color: Colors.white, fontSize: 16),
    this.actionLabel,
    this.onActionPressed,
    this.duration = const Duration(seconds: 3),
  });

  void show(BuildContext context) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: textStyle,
      ),
      backgroundColor: backgroundColor,
      duration: duration,
      action: actionLabel != null
          ? SnackBarAction(
              label: actionLabel!,
              onPressed: onActionPressed ?? () {},
              textColor: textStyle.color,
            )
          : null,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}
