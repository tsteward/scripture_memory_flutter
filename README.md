# scripture_memory_flutter

A scripture memory app written using Flutter.

## Running From Source
1. Install flutter following the [Flutter installation instructions](https://flutter.io/get-started/install/).
2. [Clone](https://help.github.com/articles/cloning-a-repository/) this repository.
```
git clone https://github.com/tsteward/scripture_memory_flutter.git
```
3. Connect a device or start an emulator (see instructions for [Windows](https://flutter.io/setup-windows/#set-up-your-android-device), [macOS](https://flutter.io/setup-macos/#set-up-the-ios-simulator), or [Linux](https://flutter.io/setup-linux/#set-up-your-android-device)).
4. From the `scripture_memory_flutter` directory, start the app by running `flutter run`.
```
cd scripture_memory_flutter
flutter run
```

## ESV API Key

The project uses the [ESV API](https://api.esv.org/) for retrieving verse text.
An API key is required to use the api. You can get an API key from the [ESV
API website](https://api.esv.org/account/). You will need to create a new API
application. Select **Personal Study** for the **Intended Use**.

To add your api key the project:

1. Open the file `secrets.json`.
2. Replace the text `ESV API KEY HERE` with your api key.

```diff
...
-  "esv_api_key": "ESV API KEY HERE"
+  "esv_api_key": "6d7fdf59b83798808b88bed8ae48523a9c9f9ede"
...
```

***
For help getting started with Flutter, view Flutter online
[documentation](https://flutter.io/).
