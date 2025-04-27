import 'dart:io';

import 'package:equatable/equatable.dart';

class ChatState extends Equatable {
  final List<Map<String, dynamic>> messages;
  final File? selectedImage;
  final bool isLoading;
  final String? error;

  const ChatState({
    this.messages = const [],
    this.selectedImage,
    this.isLoading = false,
    this.error,
  });

  ChatState copyWith({
    List<Map<String, dynamic>>? messages,
    File? selectedImage,
    bool? isLoading,
    String? error,
  }) {
    return ChatState(
      messages: messages ?? this.messages,
      selectedImage: selectedImage,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [messages, selectedImage, isLoading, error];
}
