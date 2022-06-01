import 'package:logger/logger.dart';

final logger = (Type type) => Logger(
      printer: CustomLogPrinter(type.toString()),
    );

class CustomLogPrinter extends LogPrinter {
  final String className;
  CustomLogPrinter(this.className);
  @override
  List<String> log(LogEvent event) {
    final color = PrettyPrinter.levelColors[event.level];
    final emoji = PrettyPrinter.levelEmojis[event.level];
    final message = event.message;
    return [
      color!(' $emoji: ${className.toString()} - $message'),
    ];
  }
}
