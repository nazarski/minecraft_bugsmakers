import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class GenericDialog extends StatefulWidget {
  const GenericDialog({super.key});

}

extension ShowDialogExtension on GenericDialog {
  void show(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return this;
        });
  }
}
