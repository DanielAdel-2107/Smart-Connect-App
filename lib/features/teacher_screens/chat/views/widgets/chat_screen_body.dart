import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_connect/core/constants/chat_prompts.dart';
import 'package:smart_connect/core/utilies/styles/app_text_styles.dart';
import 'package:smart_connect/features/teacher_screens/chat/view_models/cubit/chat_cubit.dart';
import 'package:smart_connect/features/teacher_screens/chat/view_models/cubit/chat_state.dart';
import 'package:smart_connect/features/teacher_screens/chat/views/widgets/messages_list_view.dart';
import 'package:smart_connect/features/teacher_screens/chat/views/widgets/send_message.dart';

class ChatScreenBody extends StatelessWidget {
  const ChatScreenBody({
    super.key,
    required this.args,
  });

  final String args;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatCubit(prompt: Prompts.getPromptForRole(args)),
      child: BlocBuilder<ChatCubit, ChatState>(
        builder: (context, state) {
          return Column(
            children: [
              MessagesListView(),
              if (state.error != null)
                Text(state.error!,
                    style: AppTextStyles.title20PrimaryColorW500),
              if (state.selectedImage != null) ...[
                Row(
                  children: [
                    Image.file(state.selectedImage!, height: 100),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => context.read<ChatCubit>().clearImage(),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
              ],
              SendMessages(),
            ],
          );
        },
      ),
    );
  }
}
