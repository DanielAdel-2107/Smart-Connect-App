import 'package:flutter/material.dart';

Future openBottomSheet({
    required BuildContext context,
    required Widget widget,
  }) async {
    await showModalBottomSheet(
      context: context,
      builder: (ctx) => widget,
      isScrollControlled: true,
      constraints:
          BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.85),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }
