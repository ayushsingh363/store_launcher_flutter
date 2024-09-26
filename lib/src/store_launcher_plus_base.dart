import 'dart:io';

import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

/// A utility class for launching the app's page in the Play Store or App Store.
///
/// This class provides methods for launching platform-specific app stores (Google Play Store for Android
/// and Apple App Store for iOS) using the app's package name or app ID.
class StoreLauncher {
  /// Launches the Google Play Store to the app's details page.
  ///
  /// If [packageName] is provided, the method will use that to open the app page in the Play Store.
  /// If not, the method will fetch the current app's package name using [PackageInfo].
  ///
  /// Returns `true` if the Play Store was successfully launched, and `false` otherwise.
  ///
  /// This method is only applicable for Android platforms. If the method is called on
  /// any non-Android platform, it will return `false`.
  ///
  /// Example usage:
  /// ```dart
  /// bool success = await StoreLauncher.launchPlayStore();
  /// ```
  ///
  /// [packageName] - The optional package name of the app to be launched. If not provided,
  /// it will default to the current app's package name.
  static Future<bool> launchPlayStore({String? packageName}) async {
    try {
      if (!Platform.isAndroid) {
        return false;
      } else {
        PackageInfo packageInfo = await PackageInfo.fromPlatform();
        String package = packageName ?? packageInfo.packageName;
        final url = Uri.parse("market://details?id=$package");
        return await launchUrl(
          url,
          mode: LaunchMode.externalApplication,
        );
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  /// Launches the Apple App Store to the app's details page.
  ///
  /// The [appId] must be provided, which corresponds to the unique identifier of the app
  /// in the App Store.
  ///
  /// Returns `true` if the App Store was successfully launched, and `false` otherwise.
  ///
  /// This method is only applicable for iOS platforms. If the method is called on
  /// any non-iOS platform, it will return `false`.
  ///
  /// Example usage:
  /// ```dart
  /// bool success = await StoreLauncher.launchAppStore(appId: '1234567890');
  /// ```
  ///
  /// [appId] - The unique identifier of the app in the App Store.
  static Future<bool> launchAppStore({required String appId}) async {
    try {
      if (!Platform.isIOS) {
        return false;
      } else {
        final url = Uri.parse("https://apps.apple.com/app/id/$appId");
        return await launchUrl(
          url,
          mode: LaunchMode.externalApplication,
        );
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  /// Launches the appropriate app store based on the platform (Play Store for Android, App Store for iOS).
  ///
  /// This method determines the platform at runtime and launches the relevant store.
  ///
  /// - For Android, it will call [launchPlayStore] and use the [packageName] if provided,
  ///   otherwise it will use the current app's package name.
  /// - For iOS, it will call [launchAppStore] using the provided [appId].
  ///
  /// Returns `true` if the relevant store was successfully launched, and `false` otherwise.
  ///
  /// If the platform is neither Android nor iOS, this method will return `false`.
  ///
  /// Example usage:
  /// ```dart
  /// bool success = await StoreLauncher.launchStore(
  ///   packageName: 'com.example.myapp',
  ///   appId: '1234567890',
  /// );
  /// ```
  ///
  /// [packageName] - The optional package name for the Play Store (Android). If not provided,
  /// the current app's package name will be used.
  ///
  /// [appId] - The required App Store app ID for iOS.
  static Future<bool> launchStore(
      {String? packageName, required String appId}) async {
    try {
      if (Platform.isIOS || Platform.isAndroid) {
        return Platform.isAndroid
            ? await launchPlayStore(packageName: packageName)
            : await launchAppStore(appId: appId);
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }
}
