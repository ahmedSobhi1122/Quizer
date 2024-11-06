import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quizer/config/themes/theme.dart';
import 'package:quizer/features/presentation/pages/chat%20bot%20Page/widgets/message.dart';
import '../../../../core/resources/app_values.dart';

class ChatBotScreen extends StatefulWidget {
  const ChatBotScreen({Key? key}) : super(key: key);

  @override
  _ChatBotScreenState createState() => _ChatBotScreenState();
}

class _ChatBotScreenState extends State<ChatBotScreen> {
  File? image;
  final ImagePicker _picker = ImagePicker();
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, dynamic>> _messages = [];

  void _sendMessage() {
    final text = _controller.text.trim();
    if (text.isNotEmpty) {
      setState(() {
        _messages.add({
          'text': text,
          'isUserMessage': true,
        });
      });
      _controller.clear();
      Future.delayed(const Duration(seconds: 1), () {
        setState(() {
          _messages.add({
            'text': "Chatbot is here 🤖",
            'isUserMessage': false,
          });
        });
      });
    }
  }

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        image = File(pickedFile.path);
        _messages.add({
          'text': 'Image attached',
          'isUserMessage': true,
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat 🤖'),
        backgroundColor: MyTheme.appbarTop,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[_messages.length - index - 1];
                return buildMessageBubble(
                  message['text'] as String,
                  message['isUserMessage'] as bool,
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppPadding.p8,
              vertical: AppPadding.p5,
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      fillColor: MyTheme.inputColor,
                      hintText: "Type a message",
                      border: const OutlineInputBorder(),
                      prefixIcon: IconButton(
                        onPressed: _pickImage,
                        icon: const Icon(Icons.add),
                      ),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.send),
                        color: MyTheme.backgroundColor1,
                        onPressed: _sendMessage,
                      ),
                    ),
                    style: TextStyle(
                      color: MyTheme.textColor
                    ),
                    onSubmitted: (_) => _sendMessage(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
