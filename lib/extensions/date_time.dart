import 'package:flutter/widgets.dart';
import 'package:weather/extensions/extensions.dart';

extension ElapsedTimeExtension on DateTime {
  String formatElapsedTimeFrom({
    required DateTime then,
    required BuildContext context,
  }) {
    final Duration difference = this.difference(then);
    if (difference.inDays > 0) {
      return '${difference.inDays} ${context.strings.d} ${context.strings.ago}';
    }
    if (difference.inHours > 0) {
      return '${difference.inHours} ${context.strings.h} '
          '${context.strings.ago}';
    }
    if (difference.inMinutes > 0) {
      return '${difference.inMinutes} ${context.strings.min} '
          '${context.strings.ago}';
    }
    return context.strings.now;
  }
}
