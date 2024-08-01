import 'package:flutter/material.dart';
import 'package:aevue_demo/src/router/router.dart' as router;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app.dart';

class Application extends ConsumerWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
        title: 'Aevue',
        debugShowCheckedModeBanner: false,
        onGenerateRoute: router.generateRoute,
        theme: lightTheme(context),
        initialRoute: splashScreenRoute);
  }
}
