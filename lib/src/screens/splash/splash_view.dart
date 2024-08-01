import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app.dart';
import '../../../main.dart';

class SplashView extends ConsumerStatefulWidget {
  const SplashView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<SplashView> {
  @override
  void initState() {
    super.initState();
    ref.listenManual(productsProvider, (previous, next) {
      if ((previous?.hasError ?? false) && next.hasValue && !next.hasError) {
        Navigator.pushReplacementNamed(context, entryPointScreenRoute,
            arguments:
                EntryPoint(productsModel: next.value ?? ProductsModel.empty));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final asyncValue = ref.watch(productsProvider);
    return Builder(builder: (context) {
      return asyncValue.when(
          data: (data) => EntryPoint(productsModel: data),
          loading: () => const Splash(),
          error: (error, stack) {
            printDebug(error);
            ErrorHandler errorHandler =
                const ErrorHandler("Error Could not load data!");
            try {
              errorHandler = error as ErrorHandler;
            } catch (_) {}
            Dialogs.showInfoDialog(
                context, errorHandler.message.toString(), "error");
            return const Splash(hasError: true);
          });
    });
  }
}

class Splash extends ConsumerWidget {
  final bool hasError;
  const Splash({super.key, this.hasError = false});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            Image.asset(ImagesAsset.aevue, height: deviceSize.height * 0.12),
            hasError
                ? Column(
                    children: [
                      IconButton(
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                          onPressed: () => ref.refresh(productsProvider.future),
                          icon: const Icon(Icons.refresh)),
                    ],
                  )
                : const SizedBox.shrink(),
            const Spacer(),
            Text(poweredBy, style: Theme.of(context).textTheme.bodyMedium!),
            Text("${packageInfo.version} (${packageInfo.buildNumber})",
                style: Theme.of(context).textTheme.bodySmall),
            sizedHeight(10)
          ],
        ),
      ),
    );
  }
}
