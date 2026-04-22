import 'package:flutter/material.dart';

class CircleButtonWidget extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  const CircleButtonWidget({super.key, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.3),
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Icon(icon, color: Colors.white, size: 20),
        onPressed: onTap,
      ),
    );
  }
}