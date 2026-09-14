import 'package:http/http.dart' as http;
import 'package:numbers_api/numbers_api.dart';
import 'package:numbers_cli/numbers_cli.dart';

Future<void> main(List<String> arguments) async {
  final client = NumberApiClient(http.Client());

  final queryCommand = QueryCommand();

  final commands = <CliCommand>[queryCommand];

  final helpCommand = HelpCommand(commands);

  if (arguments.isEmpty || arguments.first == 'help') {
    await helpCommand.execute(client, []);
    return;
  }

  if (arguments.first == 'query') {
    await queryCommand.execute(client, arguments.skip(1).toList());
    return;
  }

  print('Unknown command: ${arguments.first}');
  await helpCommand.execute(client, []);
}
