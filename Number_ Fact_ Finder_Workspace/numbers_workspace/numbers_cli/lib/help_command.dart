import 'package:numbers_api/numbers_api.dart';
import 'package:terminal_colors/terminal_colors.dart';

import 'command_base.dart';

class HelpCommand extends CliCommand {
  final List<CliCommand> commands;

  HelpCommand(this.commands) : super('help', 'Displays available commands.');

  @override
  Future<void> execute(NumberApiClient client, List<String> arguments) async {
    final buffer = StringBuffer()
      ..writeln('NUMBER FACT FINDER'.styleHeader)
      ..writeln()
      ..writeln('Available Commands:');

    for (final command in commands) {
      buffer.writeln('  ${command.name.padRight(10)} ${command.description}');
    }

    buffer
      ..writeln()
      ..writeln('Example:')
      ..writeln('  query 42');

    print(buffer.toString());
  }
}
