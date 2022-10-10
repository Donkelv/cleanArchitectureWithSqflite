import 'package:mobile_technology/data/utils/exports.dart';

void main() async {
  var databasesPath = await getDatabasesPath();
  String joinPath = [databasesPath, 'dev.db'].join();
  String path = joinPath;
  FlavorConfig(flavor: Flavor.dev, values: FlavorValues(path: path));
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const Home());
}
