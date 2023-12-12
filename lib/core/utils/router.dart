part of 'utils.dart';

String? encodeFrom(String? input) {
  if (input == null) return null;
  return utf8.fuse(base64).encode(input);
}

String? decodeFrom(String? input) {
  if (input == null) return null;
  return utf8.fuse(base64).decode(input);
}
