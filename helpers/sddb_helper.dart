printx(dynamic data, [String? tag]) {
  final String ttag = tag != null ? tag.toString() : '';
  print("$ttag : $data");
}
