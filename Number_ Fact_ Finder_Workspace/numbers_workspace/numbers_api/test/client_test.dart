import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:test/test.dart';

import 'package:numbers_api/numbers_api.dart';

void main() {
  group('NumberApiClient Mock Connection Suite', () {
    test('Successfully fetches number fact from mock API', () async {
      final mockClient = MockClient((request) async {
        return http.Response(
          '''
          {
            "text": "42 is the answer to life, the universe, and everything.",
            "number": 42,
            "found": true,
            "type": "trivia"
          }
          ''',
          200,
          headers: {'content-type': 'application/json'},
        );
      });

      final apiClient = NumberApiClient(mockClient);

      final result = await apiClient.fetchFact(42);

      expect(result.number, equals(42));
      expect(result.type, equals('trivia'));
      expect(
        result.text,
        equals('42 is the answer to life, the universe, and everything.'),
      );
    });

    test(
      'Throws NumberException when mock API returns invalid payload',
      () async {
        final mockClient = MockClient((request) async {
          return http.Response(
            '''
          {
            "number": 42
          }
          ''',
            200,
            headers: {'content-type': 'application/json'},
          );
        });

        final apiClient = NumberApiClient(mockClient);

        expect(() => apiClient.fetchFact(42), throwsA(isA<NumberException>()));
      },
    );
  });
}
