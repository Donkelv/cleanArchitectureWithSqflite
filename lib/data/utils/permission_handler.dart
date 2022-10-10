


import 'package:permission_handler/permission_handler.dart';

Future<PermissionStatus> getPhonePermission() async {
  final PermissionStatus permission = await Permission.phone.status;
  if (permission != PermissionStatus.granted ||
      permission != PermissionStatus.denied) {
    final Map<Permission, PermissionStatus> permissionStatus =
        await [Permission.phone].request();
    return permissionStatus[Permission.phone] ?? PermissionStatus.denied;
  } else {
    return permission;
  }
}
