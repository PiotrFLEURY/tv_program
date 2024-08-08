import 'package:flutter/material.dart';

class SafeImage extends StatelessWidget {
  const SafeImage({
    super.key,
    required this.url,
    this.size,
  });

  final String? url;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return url != null && url!.isNotEmpty
        ? Image.network(
            url!,
            width: size,
            height: size,
            errorBuilder: (context, error, stackTrace) => Icon(
              Icons.broken_image_outlined,
              size: size,
            ),
          )
        : Icon(
            Icons.image_not_supported_outlined,
            size: size != null ? size! / 2 : 24,
          );
  }
}
