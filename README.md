# scripture_memory_flutter

A scripture memory app written using Flutter.

## Running From Source

1. Install flutter following the
   [Flutter installation instructions](https://flutter.io/get-started/install/).
2. [Clone](https://help.github.com/articles/cloning-a-repository/) this repository.

   ```bash
   git clone https://github.com/tsteward/scripture_memory_flutter.git
   ```

3. Connect a device or start an emulator (see instructions for
   [Windows](https://flutter.io/setup-windows/#set-up-your-android-device),
   [macOS](https://flutter.io/setup-macos/#set-up-the-ios-simulator), or
   [Linux](https://flutter.io/setup-linux/#set-up-your-android-device)).
4. From the `scripture_memory_flutter` directory, start the app by running
   `flutter run`.

   ```bash
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

## Links with information about Flutter

- [Flutter Website](https://flutter.io/)
- [Flutter Documentation](https://flutter.io/docs/)
- [Flutter Installation Instructions](https://flutter.io/get-started/install/)
- [Flutter Widget Catalog](https://flutter.io/widgets/)
- [Awesome Flutter](https://github.com/Solido/awesome-flutter)
