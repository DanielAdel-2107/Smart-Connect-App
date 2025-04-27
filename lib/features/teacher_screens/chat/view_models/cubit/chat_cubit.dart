import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:smart_connect/features/teacher_screens/chat/view_models/cubit/chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final String prompt;

  final ImagePicker _picker = ImagePicker();
  final String apiKey = 'AIzaSyDKRr-IYT1xe_zcGCU1tGAS4RVr7kwQBt4';
  final String apiUrl =
      'https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent';
  final TextEditingController controller = TextEditingController();

  ChatCubit({required this.prompt}) : super(const ChatState());

  String getLanguage(String text) {
    if (RegExp(r'^[\x00-\x7F]+$').hasMatch(text)) {
      return 'en';
    } else {
      return 'ar';
    }
  }

  Future<void> sendMessage(String text, {File? image}) async {
    emit(state.copyWith(isLoading: true));

    final updatedMessages = List<Map<String, dynamic>>.from(state.messages)
      ..add({
        'type': 'user',
        'content': text,
        'image': image,
      });
    emit(state.copyWith(messages: updatedMessages));
    String language = getLanguage(text);

    try {
      var requestBody = {
        'contents': [
          {
            'parts': [
              {
                'text': '$prompt\n\nUser: $text\nLanguage: $language',
              },
              if (image != null)
                {
                  'inlineData': {
                    'mimeType': 'image/jpeg',
                    'data': base64Encode(image.readAsBytesSync()),
                  }
                }
            ]
          }
        ]
      };

      final response = await http.post(
        Uri.parse('$apiUrl?key=$apiKey'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(requestBody),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final botReply = data['candidates'][0]['content']['parts'][0]['text'];
        final newMessages = List<Map<String, dynamic>>.from(state.messages)
          ..add({
            'type': 'bot',
            'content': botReply,
            'image': null,
          });

        emit(state.copyWith(
          messages: newMessages,
          isLoading: false,
          selectedImage: null,
        ));
      } else {
        emit(state.copyWith(
          isLoading: false,
          error: 'Error: ${response.statusCode}',
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        error: 'Error: $e',
      ));
    }
  }

  Future<void> pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final imageFile = File(pickedFile.path);
      emit(state.copyWith(selectedImage: imageFile));
    }
  }

  void clearImage() {
    emit(state.copyWith(selectedImage: null));
  }
}
