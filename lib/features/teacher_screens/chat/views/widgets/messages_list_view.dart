import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:smart_connect/core/utilies/colors/app_colors.dart';
import 'package:smart_connect/features/teacher_screens/chat/view_models/cubit/chat_cubit.dart';
import 'package:smart_connect/features/teacher_screens/chat/view_models/cubit/chat_state.dart';

class MessagesListView extends StatelessWidget {
  const MessagesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatCubit, ChatState>(
      builder: (context, state) {
        return Expanded(
          child: ListView.builder(
            itemCount: state.messages.length,
            itemBuilder: (context, index) {
              final message = state.messages[index];
              final isUser = message['type'] == 'user';
              final text = message['content'];
              final image = message['image'];
              return Column(
                children: [
                  BubbleSpecialThree(
                    text: text ?? '',
                    color: isUser ? AppColors.primaryColor : Colors.grey,
                    isSender: isUser,
                    tail: true,
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  if (image != null && image is File)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.file(
                          image,
                          width: 200,
                          height: 200,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
