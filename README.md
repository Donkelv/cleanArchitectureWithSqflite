# Clean Architecture with Sqflite


[![fvm][fvm_badge]][fvm_link]
[<img src="https://riverpod.dev/img/logo.png" height="25" width="30" />][Riverpod_link]




## Getting Started 🚀

This project contains 2 flavors:

- development
- production

The project also uses fvm a simple CLI to manage Flutter SDK versions [![fvm][fvm_badge]][fvm_link]

To run the desired flavor either use the launch configuration in VSCode/Android Studio or use the following commands:

```sh
# Development
$ fvm flutter run -t lib/main_dev.dart 

# Production
$ fvm flutter run -t lib/main_prod.dart 

```

## State Management


This project uses Riverpod for state management [<img src="https://riverpod.dev/img/logo.png" height="25" width="30" />][Riverpod_link]


## Architecture

This project uses clean architecture using [Freezed ][Freezed_link]

## Database

This project  uses Sqflite for the local storage

```sh
CREATE TABLE IF NOT EXISTS $_tableName (
        $_columnId INTEGER PRIMARY  KEY AUTOINCREMENT NOT NULL,
        $_columnImei TEXT,
        $_columnFirstName TEXT,
        $_columnLastName TEXT,
        $_columnDob TEXT,
        $_columnPassport TEXT,
        $_columnEmail TEXT,
        $_columnPicture TEXT
        
)

```










[Freezed_link]: https://pub.dev/packages/freezed
[Riverpod_Badge]: https://riverpod.dev/img/logo.png
[Riverpod_link]: https://pub.dev/packages/flutter_riverpod
[intl_link]: https://pub.dev/packages/intl
[Firebase_link]: https://pub.dev/packages/firebase_core
[fvm_badge]: https://fvm.app/img/logo.svg
[fvm_link]: https://fvm.app/

