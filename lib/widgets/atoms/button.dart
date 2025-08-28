import 'package:flutter/material.dart';

enum ButtonVariant { solid, outline}

enum ButtonSize { sm, md, lg }

class PrimaryButton extends StatelessWidget {
  final String? text;
  final void Function()? onPressed;
  final ButtonVariant variant;
  final ButtonSize size;
  final IconData? icon;
  final bool? isLoading;

  const PrimaryButton({
    super.key,
    this.text,
    required this.onPressed,
    this.variant = ButtonVariant.solid,
    this.size = ButtonSize.md,
    this.icon,
    this.isLoading,
  }) : assert(
         icon != null || text != null,
         "Buttons must have either an icon or text.",
       );

  @override
  Widget build(BuildContext context) {

    final double height = {
      ButtonSize.sm: 36.0,
      ButtonSize.md: 44.0,
      ButtonSize.lg: 52.0,
    }[size]!;

    final double fontSize = {
      ButtonSize.sm: 14.0,
      ButtonSize.md: 16.0,
      ButtonSize.lg: 18.0,
    }[size]!;

    final ButtonStyle style = () {
      switch (variant) {
        case ButtonVariant.solid:
          return ElevatedButton.styleFrom(
            minimumSize: Size(double.infinity, height),
            textStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.w600,
            ),
          );
        case ButtonVariant.outline:
          return OutlinedButton.styleFrom(
            minimumSize: Size(double.infinity, height),
            textStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.w600,
            ),
          );
        
      }
    }(); // the brackets immediately call this function and populate style

    Widget buttonChild = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,

      children: [
        if (icon != null) Icon(icon, size: 20),
        if (icon != null && text != null) const SizedBox(width: 8),
        if (text != null && isLoading != true) Text(text!),
        if (isLoading != false)
          SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(
              color: Colors.white,
              strokeWidth: 2,
            ),
          ),
      ],
    );

    switch (variant) {
      case ButtonVariant.solid:
        return ElevatedButton(
          onPressed: onPressed,
          style: style,
          child: buttonChild,
          
        );
      case ButtonVariant.outline:
        return OutlinedButton(
          onPressed: onPressed,
          style: style,
          child: buttonChild,
        );
   
    }
  }
}
