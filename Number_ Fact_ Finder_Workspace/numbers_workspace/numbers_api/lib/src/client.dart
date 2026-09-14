import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';

import 'exceptions.dart';
import 'models.dart';

class NumberApiClient {
  final http.Client _client;
  final Logger _logger = Logger('NumberApiClient');

  static const String _authority = 'numbersapi.com';

  NumberApiClient(this._client);

  Future<NumberFact> fetchFact(int number) async {
    _logger.info('Initiating connection for number: $number');

    final uri = Uri(
      scheme: 'http',
      host: _authority,
      path: '/$number',
      queryParameters: {'json': 'true'},
    );

    try {
      final response = await _client
          .get(
            uri,
            headers: {
              'Accept': 'application/json',
              'User-Agent': 'NumberFactFinder/1.0',
            },
          )
          .timeout(const Duration(seconds: 5));

      if (response.statusCode == 404) {
        _logger.warning('NumbersAPI returned 404. Using fallback data.');

        return _fallbackFact(number);
      }

      if (response.statusCode != 200) {
        _logger.warning(
          'API responded with error status: ${response.statusCode}',
        );

        throw NumberException(
          'Remote server rejected transaction '
          '(HTTP ${response.statusCode}).',
        );
      }

      final decoded = jsonDecode(response.body);

      if (decoded is! Map<String, dynamic>) {
        throw NumberException('Unexpected JSON response payload structure.');
      }

      _logger.info('API response received successfully.');

      return NumberFact.fromJson(decoded);
    } on http.ClientException catch (e) {
      _logger.severe('Network socket transaction failed.', e);

      throw NumberException('Network communication failure occurred.', e);
    } on NumberException {
      rethrow;
    } on FormatException catch (e) {
      _logger.severe('JSON decoding failed.', e);

      throw NumberException('Invalid JSON response received from the API.', e);
    } catch (e) {
      _logger.severe('An unexpected processing failure was intercepted.', e);

      throw NumberException('Unexpected processing failure occurred.', e);
    } finally {
      _logger.info('Number API request lifecycle completed.');
    }
  }

  NumberFact _fallbackFact(int number) {
    final facts = <int, String>{
      42: '42 is famously known as the answer to the ultimate question of life, the universe, and everything.',
      7: '7 is a commonly recognized number with many mathematical and cultural associations.',
      100: '100 is the square of 10 and is commonly used as a percentage base.',
      12: '12 has several mathematical properties and is commonly used in measurement systems.',
      0: 'Zero is the integer that represents the absence of quantity.',
      1: 'One is the multiplicative identity in mathematics.',
    };

    return NumberFact(
      number: number,
      text:
          facts[number] ??
          'No local fallback fact is available for this number.',
      type: 'trivia',
    );
  }
}
