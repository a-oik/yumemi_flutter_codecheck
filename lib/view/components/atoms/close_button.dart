import 'package:flutter/material.dart';

/// 閉じる(×)ボタン
class CloseIconButton extends StatelessWidget {
  const CloseIconButton({super.key, required this.size});

  final double size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Icon(Icons.close, color: Colors.white, size: size),
    );
  }
}
