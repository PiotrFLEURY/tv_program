import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SafeImage extends StatelessWidget {
  const SafeImage({
    super.key,
    required this.url,
    this.size,
    required this.fallback,
  });

  final String? url;
  final double? size;
  final String? fallback;

  @override
  Widget build(BuildContext context) {
    return url != null && url!.isNotEmpty
        ? Image.network(
            url!,
            width: size,
            height: size,
            errorBuilder: (context, error, stackTrace) {
              if (fallback != null) {
                return SizedBox(
                  width: size,
                  height: size,
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      fallback!.replaceAll(' ', '\n'),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        color: Colors.black.withAlpha(200),
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ),
                );
              }
              return Icon(
                Icons.broken_image_outlined,
                size: size,
              );
            },
            fit: BoxFit.contain,
          )
        : SvgPicture.asset(
            'assets/images/nologo.svg',
            width: size != null ? size! / 2 : 24,
            height: size != null ? size! / 2 : 24,
          );
  }
}
