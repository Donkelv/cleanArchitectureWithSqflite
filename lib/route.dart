
import 'package:mobile_technology/data/utils/exports.dart';

class RoutePath extends StatelessWidget {
  const RoutePath({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mobile Technologies',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}
