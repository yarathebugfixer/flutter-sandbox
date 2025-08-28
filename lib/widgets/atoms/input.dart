import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

enum InputSize { sm, md, lg }

class PrimaryInput extends StatefulWidget {
  final String? label;
  final String? placeholder;
  final InputSize size;
  final IconData? icon;
   final IconData? stateOnIcon;
  final IconData? stateOffIcon; 
  final void Function(bool state)? onIconPressed;
  final TextEditingController controller;
  final bool obscureText;

  const PrimaryInput({
    super.key,
    this.label,
    this.placeholder,
    this.size = InputSize.md,
    this.icon,
    this.stateOnIcon,
    this.stateOffIcon,
    this.onIconPressed,
    required this.controller,
    required this.obscureText,
  });
  @override
  State<PrimaryInput> createState() => _PrimaryInputState();
}

@override
class _PrimaryInputState extends State<PrimaryInput> {
  bool state = true;
  @override
  void initState() {
    super.initState();
    state = widget.obscureText;
  }

  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: state,
      decoration: InputDecoration(
        labelText: widget.label,
        hintText: widget.placeholder,
        prefixIcon: widget.icon != null ? Icon(widget.icon) : null,
        suffixIcon: widget.stateOnIcon != null
            ?  IconButton(
                icon: state? Icon(widget.stateOnIcon) : Icon(widget.stateOffIcon),
                onPressed: () => setState(() => state = !state),
              )
            : null,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white12),
          borderRadius: BorderRadius.circular(28),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 16,
        ),
      ),
    );
  }
}
