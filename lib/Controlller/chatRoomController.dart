import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class ChatRoomControlller extends GetxController {
  var isShowEmoji = false.obs;

  late FocusNode focusNode;
  late TextEditingController chatController;

  void addEmojiToChat(Emoji emoji) {
    chatController.text = chatController.text + emoji.emoji;
  }

  void delEmojiToChat() {
    chatController.text =
        chatController.text.substring(0, chatController.text.length - 2);
  }

  @override
  void onInit() {
    chatController = TextEditingController();
    focusNode = FocusNode();
    focusNode.addListener(
      () {
        if (focusNode.hasFocus) {
          isShowEmoji.value = false;
        }
      },
    );
    super.onInit();
  }

  @override
  void onClose() {
    chatController.dispose();
    focusNode.dispose();
    super.onClose();
  }
}
