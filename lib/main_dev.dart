import 'package:mobile_technology/data/utils/exports.dart';
import 'package:mobile_technology/route.dart';

void main() async {
  var databasesPath = await getDatabasesPath();
  String joinPath = [databasesPath, 'dev.db'].join();
  String path = joinPath;
  FlavorConfig(flavor: Flavor.dev, values: FlavorValues(path: path));
  WidgetsFlutterBinding.ensureInitialized();
  runApp( const RoutePath());
}
