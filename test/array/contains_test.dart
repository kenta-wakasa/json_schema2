import 'package:json_schema2/json_schema2.dart';
import 'package:test/test.dart';

void main() {
  test('test filter', () {
    final jsonSchema = JsonSchema.createSchema({
      'type': 'array',
      'contains': {
        'type': 'object',
        'properties': {
          'name': {'type': 'string', 'const': 'Cake'}
        }
      }
    });

    final errors = jsonSchema.validateWithErrors([
      {'name': 'Cake'},
      {'name': 'Coke'},
    ]);

    final res = jsonSchema.validate([
      {'name': 'Cake'},
      {'name': 'Coke'},
    ]);
    expect(res, true);
  });
}
