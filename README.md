# AI-KODA FLUTTER APP

## Project Overview

This Flutter app is designed to [describe the purpose of your app]. It includes features such as [list key features].

## Getting Started

These instructions will guide you through setting up and running the app on your local machine.

### Prerequisites

- Flutter SDK: [Installation Guide](https://flutter.dev/docs/get-started/install)
- Dart SDK: Comes with Flutter
- Android Studio or Xcode: For running the app on an emulator or physical device
- Firebase account: For backend services

### Installation 
#### (run these commands in the terminal)

1. Clone the repository:
    ```bash
    git clone https://github.com/your-username/your-repo.git
    ```

2. Update flutter and its dependencies: 
    ```bash
    flutter upgrade
    ```
 
3. Check whether flutter is ready for use: 
    ```bash
    flutter doctor
    ```
    Resolve any issues shown by flutter doctor before moving to next steps


4. Install the dependencies:
    ```bash
    flutter pub get
    ```

### Running the App

1. Connect your device or start an emulator.

2. Run the app:
    ```bash
    flutter run
    ```

### Firebase Setup

1. Go to the [Firebase Console](https://console.firebase.google.com/) and create a new project.

2. Add an Android app to your Firebase project. Download the `google-services.json` file and place it in the `android/app` directory. A sample of the json file is already in the directory.

3. Add an iOS app to your Firebase project. Download the `GoogleService-Info.plist` file and place it in the `ios/Runner` directory and also update `ios/firebase_app_id_file.json`. A sample of the both the files could be found in the mentioned directory.

4. Modify the `pubspec.yaml` file to include the necessary Firebase dependencies:
    ```yaml
    dependencies:
      firebase_core: latest_version
      firebase_auth: latest_version
      cloud_firestore: latest_version
    ```

## Files Structure And their purpose:
+ android/
+ ios/
    + [Flutter/](https://github.com/Manya-15/AI-KODA/tree/main/ios/Flutter) (This folder contains Flutter-specific files that are automatically generated and managed by the Flutter framework)
        + `AppFrameworkInfo.plist` (contains metadata about the Flutter framework)
    + [Runner.xcodeproj/](https://github.com/Manya-15/AI-KODA/tree/main/ios/Runner.xcodeproj) (This folder contains the Xcode project files for your IOS app)
        + `project.pbxproj` (project file that describes the targets, build configurations, and file references for your Xcode project)
    +  [Runner.xcworkspace/](https://github.com/Manya-15/AI-KODA/tree/main/ios/Runner.xcworkspace) (This folder contains the workspace settings for your Xcode project)
        + `contents.xcworkspacedata.xml` (ile defines the structure of your Xcode workspace, including references to your project and any dependencies)
    + [Runner/](https://github.com/Manya-15/AI-KODA/tree/main/ios/Runner) (This folder contains the main iOS project files, including the app's source code, assets, and configurations)
        + `Assets.xcassets/` (This folder contains the app's image assets, such as icons and launch images)
            + `AppIcon.appiconset/`
                +  `Contents.json` (A JSON file that describes the structure and properties of the icon set)
            + LaunchImage.imageset/
                +  `Contents.json` (A JSON file that describes the structure and properties of the launch image set)
                + `README.md` (explains steps to modify the launch screen)
        + `Base.lproj/` (This folder contains the storyboard files for the app's user interface)
            + `LaunchScreen.storyboard.xml` (defines the layout and properties of the app's launch screen)
            + `Main.storyboard.xml` (defines the layout and properties of the app's main interface)
        + `AppDelegate.swift` (This file contains the entry point for the iOS app and handles app lifecycle events)
        + `GoogleService-Info.plist` (This file contains configuration information for Firebase, including API keys and project identifiers)
        + `Info.plist` (contains configuration settings for the iOS app, such as app permissions, icons, and other metadata)
    + [Podfile](https://github.com/Manya-15/AI-KODA/tree/main/ios/Podfile) (This file is used by CocoaPods to manage your app's dependencies)
    + [firebase_app_id_file.json](https://github.com/Manya-15/AI-KODA/tree/main/ios/firebase_app_id_file.json) (This file contains your Firebase project configuration, including your Firebase app ID and other settings)
+ lib/
+ test/




### Contributing

1. Fork the repository.
2. Create a new branch (`git checkout -b feature/your-feature`).
3. Commit your changes (`git commit -am 'Add your feature'`).
4. Push to the branch (`git push origin feature/your-feature`).
5. Create a new Pull Request.

### License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
