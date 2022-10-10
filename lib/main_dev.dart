import 'package:mobile_technology/data/utils/exports.dart';
import 'package:mobile_technology/route.dart';
import 'package:permission_handler/permission_handler.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  var databasesPath = await getDatabasesPath();
  String joinPath = join(databasesPath, 'dev.db');
  String path = joinPath;
  FlavorConfig(flavor: Flavor.dev, values: FlavorValues(path: path));
  
  runApp(const RoutePath());
}


