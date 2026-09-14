import 'package:test/test.dart';
import 'package:numbers_api/numbers_api.dart';

void main() {
  group('Model Deserialisation Suite', () {
    test('Successful parsing of structural attributes', () {
      final mockJson = {
        'number': 42,
        'text': 'The answer to life, the universe, and everything.',
        'type': 'trivia',
      };

      final item = NumberFact.fromJson(mockJson);

      expect(item.number, equals(42));
      expect(
        item.text,
        equals('The answer to life, the universe, and everything.'),
      );
      expect(item.type, equals('trivia'));
    });

    test('Trigger custom exception on broken mapping keys', () {
      final malformedJson = {'number': 42};

      expect(
        () => NumberFact.fromJson(malformedJson),
        throwsA(isA<NumberException>()),
      );
    });
  });
}
