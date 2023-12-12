part of 'utils.dart';

class ListenableStream extends ChangeNotifier {
  ListenableStream(Stream stream) {
    stream.listen((event) => notifyListeners());
  }
}
