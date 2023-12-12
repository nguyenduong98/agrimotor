import 'package:flutter/foundation.dart';
import 'app/app.dart';
import 'core/core.dart';
import 'main_dev.dart';

void main() {
  runZonedGuarded(() async {
    await initializeComponents(Env.stg);
    runApp(const LotteMartApp());
  }, (error, stack) {
    if (kDebugMode) return;
  });
}
