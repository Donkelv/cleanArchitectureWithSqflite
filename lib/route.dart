import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_technology/data/utils/exports.dart';

class RoutePath extends StatelessWidget {
  const RoutePath({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
      ),
    );
    return ProviderScope(
      child: ScreenUtilInit(
          designSize: const Size(375, 812),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Mobile Technologies',
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home: const Home(),
            );
          }),
    );
  }
}
