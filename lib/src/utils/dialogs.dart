import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart';

import '../../app.dart';

class Dialogs {
  static Future showInfoDialog(
      BuildContext context, String message, String dialogtype) async {
    final deviceSize = MediaQuery.of(context).size;
    // var routeee = FlushbarRoute<EntryPoint>(flushbar: Flushbar());
    Color color = dialogtype == "warning"
        ? warning
        : dialogtype == "error"
            ? error
            : dialogtype == "rejected"
                ? Colors.grey[400]!
                : success;
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      try {
        await Flushbar().dismiss();
        Flushbar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          flushbarStyle: FlushbarStyle.FLOATING,
          titleText: Text(capitalize(dialogtype),
              style: Theme.of(context).textTheme.bodySmall),
          messageText:
              Text(message, style: Theme.of(context).textTheme.bodyMedium),
          boxShadows: [
            BoxShadow(
                color: color.withOpacity(0.5), spreadRadius: 2, blurRadius: 10)
          ],
          //  flushbarRoute: routeee,
          flushbarPosition: FlushbarPosition.TOP,
          duration: const Duration(seconds: 4),
          icon: SizedBox(
            height: deviceSize.height * 0.1,
            child: VerticalDivider(
                thickness: deviceSize.width * 0.02, color: color),
          ),
        ).show(context);
      } catch (_) {}
    });
  }
}
