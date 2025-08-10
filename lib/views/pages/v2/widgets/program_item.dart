import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tv_program/models/channel.dart';
import 'package:tv_program/models/program.dart';
import 'package:tv_program/views/widgets/safe_image.dart';

class ProgramItem extends ConsumerWidget {
  const ProgramItem({
    super.key,
    required this.channel,
    required this.program,
    this.big = true,
  });

  final Channel channel;
  final Program program;
  final bool big;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(50),
        borderRadius: BorderRadius.circular(8),
        image: big && program.icon != null && program.icon!.isNotEmpty
            ? DecorationImage(
                image: NetworkImage(program.icon ?? ''),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withAlpha(100),
                  BlendMode.darken,
                ),
              )
            : null,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment:
            big ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white.withAlpha(120),
            ),
            child: SafeImage(
              url: big ? channel.icon : program.icon ?? '',
              size: 96,
            ),
          ),
          const SizedBox(width: 16),
          Flexible(
            child: Text(
              '${program.startTime} - ${program.title}',
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              softWrap: true,
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.white,
                fontSize: big ? 24 : 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
