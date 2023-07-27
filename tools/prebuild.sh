:: FOR WINDOWS SYSTEMS

:: Cleans and refetches all dependencies in preparation for an app build.

del android\app\build

flutter clean &&^
flutter pub get &&^
flutter pub run build_runner build --delete-conflicting-outputs