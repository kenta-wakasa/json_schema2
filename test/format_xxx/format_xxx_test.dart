import 'package:json_schema2/json_schema2.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  test('formatXXX test', () {
    final schema = {
      'type': 'string',
      'format': 'date-time',
      'formatMinimum': '2022-07-02T00:00:00', // 7/2以降
      'formatExclusiveMaximum': '2022-09-01T00:00:00' // 9/1より前
    };
    final jsonSchema = JsonSchema.createSchema(
      schema,
      schemaVersion: SchemaVersion.draft6,
    );
    final normalValueA = '2022-07-02T00:00:00';
    final normalValueB = '2022-08-31T00:00:00';
    final abnormalValue = '2022-09-01T00:00:00';

    expect(jsonSchema.validate(normalValueA), true);
    expect(jsonSchema.validate(normalValueB), true);
    expect(jsonSchema.validate(abnormalValue), false);
  });
}
