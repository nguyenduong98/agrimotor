import 'package:flutter/foundation.dart';
import '../core/core.dart';
import 'app.dart';

class AppDeeplinkHandler {
  AppDeeplinkHandler._();

  static final AppDeeplinkHandler _instance = AppDeeplinkHandler._();
  static AppDeeplinkHandler get instance => _instance;

  bool _initialUriIsHandled = false;
  String? _initialLink;
  StreamSubscription? _subscription;

  Future<void> init() {
    return Future.wait([
      _handleIncomingLinks(),
      _handleInitialLink(),
    ]);
  }

  void dispose() => _subscription?.cancel();

  String? get initalRoute => _initialLink;

  Future<void> _handleIncomingLinks() async {
    if (kIsWeb) return;
    _subscription = AppLinks().uriLinkStream.listen(
      (uri) {
        final path = parse(uri);
        final context = navigatorKey.currentContext;
        if (context == null) return;
        final router = GoRouter.of(context);
        router.push(path);
      },
      onError: (error) {},
    );
  }

  Future<void> _handleInitialLink() async {
    if (_initialUriIsHandled) return;
    try {
      final uri = await AppLinks().getInitialAppLink();
      if (uri == null) return;
      _initialLink = parse(uri);
      _initialUriIsHandled = true;
    } catch (_) {}
  }

  static String parse(Uri uri) {
    final query = uri.query.isNotEmpty ? '?${uri.query}' : '';
    final segments = uri.pathSegments.toList();
    segments.removeWhere((s) => RegExp(Patterns.storeCode).hasMatch(s));
    final newUri = uri.replace(pathSegments: segments);
    final path = newUri.path.isEmpty ? '/' : newUri.path;
    return '$path$query';
  }
}
