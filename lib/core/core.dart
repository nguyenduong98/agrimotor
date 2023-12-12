library core;

export 'utils/utils.dart';
export 'storage/storage.dart';
export 'network/dio/dio.dart';
// export 'analytics/analytics.dart';
export 'exceptions/exceptions.dart';
export 'cubit/cubit.dart';
export 'const/constants.dart';
export 'package:intl/intl.dart' hide TextDirection;

export 'dart:io';
export 'dart:async';
export 'dart:convert';
export 'package:flutter/material.dart'
    hide RefreshIndicator, RefreshIndicatorState;
export 'package:flutter/gestures.dart';
export 'package:flutter/services.dart';
export 'package:collection/collection.dart';
export 'package:provider/provider.dart';
export 'package:bloc/bloc.dart';
export 'package:flutter_bloc/flutter_bloc.dart';
export 'package:equatable/equatable.dart';
export 'package:quiver/iterables.dart';
export 'package:get_it/get_it.dart';
export 'package:dio/dio.dart';
export 'package:url_launcher/url_launcher.dart';
export 'package:device_info_plus/device_info_plus.dart';
export 'package:package_info_plus/package_info_plus.dart';
export 'package:crypto/crypto.dart';
export 'package:firebase_core/firebase_core.dart';
// export 'package:firebase_crashlytics/firebase_crashlytics.dart';
export 'package:version/version.dart';
export 'package:firebase_remote_config/firebase_remote_config.dart';
export 'package:url_launcher/url_launcher_string.dart';
export 'package:flutter_localizations/flutter_localizations.dart';
export 'package:bot_toast/bot_toast.dart';
export 'package:firebase_messaging/firebase_messaging.dart';
export 'package:flutter_local_notifications/flutter_local_notifications.dart';
export 'package:go_router/go_router.dart';
export 'package:go_router/src/matching.dart';
export 'package:go_router/src/match.dart';
export 'package:connectivity_plus/connectivity_plus.dart';
export 'package:async/async.dart';
export 'package:hexcolor/hexcolor.dart';
export 'package:flutter_screenutil/flutter_screenutil.dart';
export 'package:google_fonts/google_fonts.dart';
export 'package:shared_preferences/shared_preferences.dart';
export 'package:pull_to_refresh/pull_to_refresh.dart'
    hide RefreshIndicator, RefreshIndicatorState;
export 'package:app_links/app_links.dart';
export 'package:mime/mime.dart';
export 'package:geolocator/geolocator.dart';
export 'package:permission_handler/permission_handler.dart' hide ServiceStatus;
export 'package:uuid/uuid.dart';
export 'package:quiver/async.dart' hide concat, enumerate;
export 'package:showcaseview/showcaseview.dart';
export 'package:flutter_secure_storage/flutter_secure_storage.dart';
export 'package:event_bus/event_bus.dart';
export 'package:pull_to_refresh/pull_to_refresh.dart';
// export 'package:firebase_analytics/firebase_analytics.dart';
// export 'package:firebase_analytics_platform_interface/firebase_analytics_platform_interface.dart';
export 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';
export 'package:flutter_svg/flutter_svg.dart';

enum Env { dev, stg, prod }
