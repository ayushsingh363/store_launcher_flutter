import 'package:store_launcher/store_launcher.dart';

void main() {
  StoreLauncher.launchPlayStore(packageName: "com.example.package");
  StoreLauncher.launchAppStore(appId: "123456789");

  // Launches AppStore on IOS and PlayStore on Android device
  StoreLauncher.launchStore(
      packageName: "com.example.package", appId: "123456789");
}
