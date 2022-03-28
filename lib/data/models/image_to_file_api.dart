// This model is designed to enclose all the fields required to convert file from Flutter to format acceptable by
// API. We pass this model to BankDetails model.

class CustomFile {
  Stream<List<int>> stream;
  final String field;
  final int length;
  final String? filename;
  CustomFile({
    required this.stream,
    required this.field,
    required this.length,
    this.filename,
  });
}
