# StoreLauncher

`StoreLauncher` is a utility package for Flutter apps that allows launching the Google Play Store (for Android) or the Apple App Store (for iOS) directly from your app. It uses platform-specific logic to automatically determine whether the app is running on Android or iOS and launches the respective store for the app's details page.

## Features

- **Launch Google Play Store**: Open the Play Store app page for a specified app using its package name (or the current app's package name by default).
- **Launch Apple App Store**: Open the App Store app page for a specified app using its app ID.
- **Platform detection**: Automatically detects whether the app is running on Android or iOS and launches the correct store accordingly.

## Getting started

To start using the `StoreLauncher` package, add the following dependencies to your `pubspec.yaml` file:

```yaml
dependencies:
  store_launcher: ^1.0.0  # Add the latest version of the package
```

Then, install the dependencies by running:

```bash
flutter pub get
```

## Prerequisites

- Ensure that your app targets either Android or iOS platforms.
- The app should be deployed on the Google Play Store or Apple App Store for this functionality to work.

## Usage

Here are a few examples of how you can use the StoreLauncher class in your Flutter app:

### Launch Google Play Store

To launch the Google Play Store for your app (or another app by specifying its package name):

```dart
bool success = await StoreLauncher.launchPlayStore(packageName: 'com.example.app');
if (success) {
  print('Google Play Store launched successfully!');
} else {
  print('Failed to launch Google Play Store.');
}
```

If no package name is provided, the package will use the current app's package name:

```dart
bool success = await StoreLauncher.launchPlayStore();
if (success) {
  print('Google Play Store launched successfully!');
} else {
  print('Failed to launch Google Play Store.');
}
```

### Launch Apple App Store

To launch the Apple App Store for your app, provide the App Store ID of the app:

```dart
bool success = await StoreLauncher.launchAppStore(appId: '123456789');
if (success) {
  print('App Store launched successfully!');
} else {
  print('Failed to launch App Store.');
}
```

### Automatically Detect Platform and Launch Store

You can use the launchStore method to automatically detect the platform and launch the appropriate store:

```dart
bool success = await StoreLauncher.launchStore(
  packageName: 'com.example.app', // Optional for Android
  appId: '1234567890', // Required for iOS
);
if (success) {
  print('Store launched successfully!');
} else {
  print('Failed to launch store.');
}
```

## Additional information

- This package is designed for use in Flutter apps targeting Android and iOS.
- For more information on configuring [package_info_plus](https://pub.dev/packages/package_info_plus), visit the package_info_plus documentation.
- For more information on configuring [url_launcher](https://pub.dev/packages/url_launcher), visit the url_launcher documentation.

## Contributing

Contributions are welcome! If you have any suggestions, bug reports, or would like to contribute to the package, feel free to open an issue or submit a pull request.

## Issues

If you encounter any issues while using this package, please file an issue on the [GitHub repository](https://github.com/ayushsingh363/store_launcher_flutter). We will do our best to address the issue as soon as possible.

## License

This package is licensed under the MIT license.
