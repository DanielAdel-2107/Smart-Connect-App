import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:smart_connect/app/my_app.dart';

void showCustomDialog({
  required String title,
  required String description,
  required DialogType dialogType,
   Function()? btnOkOnPress
}) {
  AwesomeDialog(
    context: navigatorKey.currentState!.context,
    dialogType: dialogType,
    animType: AnimType.bottomSlide,
    title: title,
    desc: description,
    btnCancelOnPress: () {},
    btnOkOnPress:btnOkOnPress ?? () {},
  ).show();
}
