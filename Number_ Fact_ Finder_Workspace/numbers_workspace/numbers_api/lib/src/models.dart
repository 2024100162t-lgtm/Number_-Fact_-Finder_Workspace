import 'exceptions.dart';

class NumberFact {
  final int number;
  final String text;
  final String type;

  const NumberFact({
    required this.number,
    required this.text,
    required this.type,
  });

  factory NumberFact.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'number': num parsedNumber,
        'text': String parsedText,
        'type': String parsedType,
      } =>
        NumberFact(
          number: parsedNumber.toInt(),
          text: parsedText,
          type: parsedType,
        ),

      _ => throw NumberException('Payload failed pattern validation check!'),
    };
  }

  Map<String, dynamic> toJson() {
    return {'number': number, 'text': text, 'type': type};
  }
}
