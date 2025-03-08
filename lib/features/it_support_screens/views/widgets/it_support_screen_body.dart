import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_connect/core/di/dependancy_injection.dart';
import 'package:smart_connect/core/helper/open_dialog.dart';
import 'package:smart_connect/core/utilies/colors/app_colors.dart';
import 'package:smart_connect/core/utilies/extensions/app_extensions.dart';
import 'package:smart_connect/core/utilies/styles/app_text_styles.dart';
import 'package:smart_connect/features/auth/sign_up/views/widgets/custom_title.dart';
import 'package:smart_connect/features/it_support_screens/view_models/cubit/it_support_cubit.dart';
import 'package:smart_connect/features/it_support_screens/views/widgets/it_support_card.dart';
import 'package:smart_connect/features/it_support_screens/views/widgets/show_it_support_card_details.dart';

class ItSupportScreenBody extends StatelessWidget {
  const ItSupportScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: context.width * 0.05, vertical: context.height * 0.01),
        child: Column(
          children: [
            Center(child: CustomTitle(title: "View Issues")),
            SizedBox(
              height: context.height * 0.05,
            ),
            Expanded(
              child: BlocBuilder<ItSupportCubit, ItSupportState>(
                builder: (context, state) {
                  if (state is ItSupportLoading) {
                    return Center(
                        child: CircularProgressIndicator(
                      color: AppColors.primaryColor,
                    ));
                  } else if (state is ItSupportEmpty) {
                    return Center(
                      child: Text(
                        "No Issues Exist",
                        style: AppTextStyles.title20PrimaryColorW500,
                      ),
                    );
                  } else if (state is ItSupportFailed) {
                    return Center(child: Text("Error: ${state.errorMessage}"));
                  } else {
                    final cubit = context.itSupportCubit;
                    return ListView.builder(
                      itemCount: cubit.tickets.length,
                      itemBuilder: (context, index) {
                        final ticket = cubit.tickets[index];
                        return ItSupportCard(
                          ticketModel: ticket,
                          onTap: () {
                            openDialog(
                              context: context,
                              widget: BlocProvider.value(
                                value: getIt<ItSupportCubit>(),
                                child: ShowItSupportCardDetails(ticket: ticket),
                              ),
                            );
                          },
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
