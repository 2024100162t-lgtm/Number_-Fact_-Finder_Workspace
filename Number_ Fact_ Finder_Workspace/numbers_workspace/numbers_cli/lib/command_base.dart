import 'package:numbers_api/numbers_api.dart';

abstract class CliCommand {
  final String name;
  final String description;

  CliCommand(this.name, this.description);

  Future<void> execute(NumberApiClient client, List<String> arguments);
}
