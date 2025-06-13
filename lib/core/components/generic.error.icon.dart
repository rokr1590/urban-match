import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class GenericErrorIcon extends StatelessWidget {
  const GenericErrorIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(16),
      child: const Icon(
        LucideIcons.info,
        size: 20,
        color: Colors.redAccent,
      ),
    );
  }
}
