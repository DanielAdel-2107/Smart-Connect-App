import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_connect/core/utilies/colors/app_colors.dart';
import 'package:smart_connect/features/teacher_screens/chat/view_models/cubit/chat_cubit.dart';
import 'package:smart_connect/features/teacher_screens/chat/view_models/cubit/chat_state.dart';

class SendMessages extends StatelessWidget {
  const SendMessages({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          IconButton(
            icon: Icon(
              Icons.image,
              color: AppColors.primaryColor,
            ),
            onPressed: () => context.read<ChatCubit>().pickImage(),
          ),
          Expanded(
            child: TextField(
              controller: context.read<ChatCubit>().controller,
              decoration: InputDecoration(
                hintText: 'Type a message...',
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(32),
                ),
                fillColor: AppColors.primaryColor.withOpacity(0.4),
                filled: true,
              ),
            ),
          ),
          BlocBuilder<ChatCubit, ChatState>(
            builder: (context, state) {
              return state.isLoading
                  ? Center(
                      child: CircularProgressIndicator(
                      color: AppColors.primaryColor,
                    ))
                  : IconButton(
                      icon: Icon(
                        Icons.send,
                        color: AppColors.primaryColor,
                      ),
                      onPressed: () {
                        if (context
                                .read<ChatCubit>()
                                .controller
                                .text
                                .isNotEmpty ||
                            state.selectedImage != null) {
                          context.read<ChatCubit>().sendMessage(
                                context
                                        .read<ChatCubit>()
                                        .controller
                                        .text
                                        .isEmpty
                                    ? 'Image sent'
                                    : context.read<ChatCubit>().controller.text,
                                image: state.selectedImage,
                              );
                        }
                      },
                    );
            },
          ),
        ],
      ),
    );
  }
}
