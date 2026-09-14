import 'package:numbers_api/numbers_api.dart';
import 'package:terminal_colors/terminal_colors.dart';

import 'command_base.dart';

class QueryCommand extends CliCommand {
  QueryCommand() : super('query', 'Fetches a fact for a specific number.');

  @override
  Future<void> execute(NumberApiClient client, List<String> arguments) async {
    if (arguments.isEmpty) {
      print('Execution Error: Number is missing.'.styleError);
      return;
    }

    final number = int.tryParse(arguments.first);

    if (number == null) {
      print('Execution Error: Please provide a valid integer.'.styleError);
      return;
    }

    try {
      final result = await client.fetchFact(number);

      final buffer = StringBuffer()
        ..writeln('--- NUMBER FACT ---'.styleHeader)
        ..writeln('Number: ${result.number}'.styleSuccess)
        ..writeln('Type:   ${result.type}')
        ..writeln('Fact:   ${result.text}')
        ..writeln('-------------------'.styleHeader);

      print(buffer.toString());
    } on NumberException catch (e) {
      print('Operation Failed: ${e.message}'.styleError);
    }
  }
}
