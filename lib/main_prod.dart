import 'package:mobile_technology/data/utils/exports.dart';
import 'package:mobile_technology/route.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  var databasesPath = await getDatabasesPath();
  String joinPath = [databasesPath, 'prod.db'].join();
  String path = joinPath;
  FlavorConfig(flavor: Flavor.dev, values: FlavorValues(path: path));
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const RoutePath());
}
