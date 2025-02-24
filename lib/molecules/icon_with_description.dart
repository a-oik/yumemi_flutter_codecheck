import 'package:flutter/material.dart';

class IconWithDescription extends StatelessWidget {
  const IconWithDescription({
    super.key,
    required this.icon,
    required this.description,
  });

  final Icon icon;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [icon, SizedBox(width: 5.0), Text(description)],
    );
  }
}
