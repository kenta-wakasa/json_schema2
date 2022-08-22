import 'package:json_schema2/json_schema2.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  test('date', () {
    final schema = {
      'type': 'string',
      'format': 'date',
    };

    final jsonSchema = JsonSchema.createSchema(schema);

    expect(jsonSchema.validate('2022-07-01'), true);
    expect(jsonSchema.validate('2022-07-01T23:59:59'), false);
  });

  test('time', () {
    final schema = {
      'type': 'string',
      'format': 'time',
    };

    final jsonSchema = JsonSchema.createSchema(schema);

    expect(jsonSchema.validate('23:59:59'), true);
    expect(jsonSchema.validate('xxx23:59:59xxx'), false);
    expect(jsonSchema.validate('2022-07-01T23:59:59'), false);
    expect(jsonSchema.validate('2022-07-01'), false);
  });

  test('date-time', () {
    final schema = {
      'type': 'string',
      'format': 'date-time',
    };

    final jsonSchema = JsonSchema.createSchema(schema);

    expect(jsonSchema.validate('2022-07-01'), false);
    expect(jsonSchema.validate('2022-07-01T23:59:59'), true);
  });
}
