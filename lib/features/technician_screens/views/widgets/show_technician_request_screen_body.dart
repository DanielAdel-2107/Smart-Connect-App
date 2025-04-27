import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_connect/core/di/dependancy_injection.dart';
import 'package:smart_connect/core/helper/open_dialog.dart';
import 'package:smart_connect/core/utilies/colors/app_colors.dart';
import 'package:smart_connect/core/utilies/extensions/app_extensions.dart';
import 'package:smart_connect/features/auth/sign_up/views/widgets/custom_title.dart';
import 'package:smart_connect/features/technician_screens/view_models/cubit/technician_request_cubit.dart';
import 'package:smart_connect/features/technician_screens/views/widgets/custom_technician_request_list_tile.dart';
import 'package:smart_connect/features/technician_screens/views/widgets/show_technician_request_details.dart';

class ShowTechnicianRequestScreenBody extends StatelessWidget {
  const ShowTechnicianRequestScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: context.width * 0.05, vertical: context.height * 0.02),
      child: BlocConsumer<TechnicianRequestCubit, TechnicianRequestState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is TechnicianRequestLoading) {
            return Expanded(
              child: Center(
                  child: CircularProgressIndicator(
                color: AppColors.primaryColor,
              )),
            );
          }
          if (state is EmptyTechnicianRequest) {
            return Expanded(
              child: Center(
                child: Text("No technician request found."),
              ),
            );
          }
          if (state is TechnicianRequestFailed) {
            return Expanded(
              child: Center(
                child: Text(state.errorMessage),
              ),
            );
          }
          var requests = context.technicianRequestCubit.technicianRequests;
          return SafeArea(
            child: Column(
              spacing: context.height * 0.02,
              children: [
                Center(child: CustomTitle(title: "Technician request")),
                Expanded(
                  child: ListView.builder(

                    itemCount: requests.length,
                    itemBuilder: (context, index) {
                      return CustomTechnicianRequestListTile(
                        request: requests[index],
                        onTap: () {
                          openDialog(
                              context: context,
                              widget: BlocProvider.value(
                                value: getIt<TechnicianRequestCubit>(),
                                child: ShowTechnicianRequestDetails(
                                  request: requests[index],
                                ),
                              ));
                        },
                      );
                    },
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
