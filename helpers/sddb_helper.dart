import 'package:nb_utils/nb_utils.dart';

printx(dynamic data, [String? tag]) {
  final String ttag = tag != null ? tag.toString() : '';
  log("$ttag : $data");
}
