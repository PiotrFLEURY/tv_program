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
    this.showChannelIcon = true,
  });

  final Channel channel;
  final Program program;
  final bool showChannelIcon;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(50),
        borderRadius: BorderRadius.circular(8),
        image:
            showChannelIcon && program.icon != null && program.icon!.isNotEmpty
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
            showChannelIcon ? CrossAxisAlignment.start : CrossAxisAlignment.end,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white.withAlpha(120),
            ),
            child: SafeImage(
              url: showChannelIcon ? channel.icon : program.icon ?? '',
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
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
