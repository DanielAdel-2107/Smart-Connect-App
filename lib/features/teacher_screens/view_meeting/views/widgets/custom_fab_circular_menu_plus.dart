import 'package:fab_circular_menu_plus/fab_circular_menu_plus.dart';
import 'package:flutter/material.dart';
import 'package:smart_connect/core/utilies/colors/app_colors.dart';
import 'package:smart_connect/features/teacher_screens/view_meeting/models/fac_circular_menu_plus_model.dart';
import 'package:smart_connect/features/teacher_screens/view_meeting/views/widgets/custom_icon_button.dart';

class CustomFabCircularMenuPlus extends StatelessWidget {
  const CustomFabCircularMenuPlus({
    super.key,
    required this.menuItems,
  });

  final List<FacCircularMenuPlusModel> menuItems;

  @override
  Widget build(BuildContext context) {
    return FabCircularMenuPlus(
      fabColor: AppColors.primaryColor,
      ringColor: AppColors.primaryColor.withOpacity(0.5),
      fabOpenIcon: const Icon(
        Icons.menu,
        color: Colors.white,
      ),
      fabCloseIcon: const Icon(
        Icons.close,
        color: Colors.white,
      ),
      fabSize: 56.0,
      children: <Widget>[
        ...menuItems.map(
          (e) => CustomIconButton(
            iconData: e.icon,
            route: e.route,
            label: e.label,
          ),
        ),
      ],
    );
  }
}
