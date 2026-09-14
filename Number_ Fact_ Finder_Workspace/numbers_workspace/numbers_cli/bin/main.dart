import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:numbers_api/numbers_api.dart';
import 'package:terminal_colors/terminal_colors.dart';
import 'package:numbers_cli/numbers_cli.dart';

import '../lib/logging_config.dart';

Future<void> main() async {
  configureSystemTelemetry();

  final httpClient = http.Client();
  final apiClient = NumberApiClient(httpClient);

  final queryCmd = QueryCommand();

  final commandsList = <CliCommand>[queryCmd];

  final helpCmd = HelpCommand(commandsList);

  print('Welcome to the Number Fact Finder CLI Tool!'.styleHeader);

  try {
    while (true) {
      stdout.write('\n[number_finder] > ');

      final input = stdin.readLineSync();

      if (input == null || input.trim().toLowerCase() == 'exit') {
        print('Exiting platform...'.styleWarning);
        break;
      }

      final trimmed = input.trim();

      if (trimmed.isEmpty) {
        continue;
      }

      final parts = trimmed.split(RegExp(r'\s+'));

      final commandName = parts.first;
      final args = parts.sublist(1);

      switch (commandName.toLowerCase()) {
        case 'query':
          await queryCmd.execute(apiClient, args);

        case 'help':
          await helpCmd.execute(apiClient, args);

        default:
          print(
            'Unknown command. Type "help" for available commands.'.styleError,
          );
      }
    }
  } finally {
    httpClient.close();

    print('System network socket disconnected successfully.'.styleSuccess);
  }
}
