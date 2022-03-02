import 'dart:io';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:football_app/Controlller/chatRoomController.dart';
import 'package:football_app/Utils/constants.dart';
import 'package:get/get.dart';

class ChatRoom extends GetView<ChatRoomControlller> {
  const ChatRoom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLightColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kPrimeColor,
        leadingWidth: 70,
        leading: InkWell(
          onTap: () => Get.back(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.arrow_back),
              SizedBox(
                width: 5,
              ),
              SvgPicture.asset(
                "assets/images/user.svg",
                height: 30,
              ),
            ],
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Club 17",
              style: TextStyle(
                  color: kLightColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              color: kLightColor,
              width: Get.width,
              child: ListView(
                children: [
                  ItemChat(
                    isSender: true,
                  ),
                  ItemChat(
                    isSender: false,
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                bottom: controller.isShowEmoji.isTrue
                    ? 5
                    : context.mediaQueryPadding.bottom),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            width: Get.width,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller.chatController,
                    focusNode: controller.focusNode,
                    decoration: InputDecoration(
                      prefixIcon: IconButton(
                        onPressed: () {
                          controller.focusNode.unfocus();
                          controller.isShowEmoji.toggle();
                        },
                        icon: const Icon(Icons.emoji_emotions_outlined),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                MaterialButton(
                  elevation: 4,
                  height: 50,
                  minWidth: 20,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0))),
                  color: kDarkLightColor,
                  onPressed: () {},
                  child: const Icon(Icons.send, color: kLightColor),
                ),
              ],
            ),
          ),
          Obx(() => (controller.isShowEmoji.isTrue)
              ? SizedBox(
                  height: 325,
                  child: EmojiPicker(
                    onEmojiSelected: (category, emoji) {
                      controller.addEmojiToChat(emoji);
                    },
                    onBackspacePressed: () {
                      controller.delEmojiToChat();
                    },
                    config: Config(
                        columns: 7,
                        emojiSizeMax: 32 *
                            (Platform.isIOS
                                ? 1.30
                                : 1.0), // Issue: https://github.com/flutter/flutter/issues/28894
                        verticalSpacing: 0,
                        horizontalSpacing: 0,
                        initCategory: Category.RECENT,
                        bgColor: const Color(0xFFF2F2F2),
                        indicatorColor: Colors.blue,
                        iconColor: Colors.grey,
                        iconColorSelected: Colors.blue,
                        progressIndicatorColor: Colors.blue,
                        backspaceColor: Colors.blue,
                        skinToneDialogBgColor: Colors.white,
                        skinToneIndicatorColor: Colors.grey,
                        enableSkinTones: true,
                        showRecentsTab: true,
                        recentsLimit: 28,
                        noRecentsText: "No Recents",
                        noRecentsStyle: const TextStyle(
                            fontSize: 20, color: Colors.black26),
                        tabIndicatorAnimDuration: kTabScrollDuration,
                        categoryIcons: const CategoryIcons(),
                        buttonMode: ButtonMode.MATERIAL),
                  ),
                )
              : const SizedBox())
        ],
      ),
    );
  }
}

class ItemChat extends StatelessWidget {
  const ItemChat({
    Key? key,
    required this.isSender,
  }) : super(key: key);

  final bool isSender;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Column(
        crossAxisAlignment:
            isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: kDarkLightColor,
              borderRadius: isSender
                  ? const BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                      bottomLeft: Radius.circular(24),
                    )
                  : const BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                      bottomRight: Radius.circular(24),
                    ),
            ),
            width: 250,
            padding: const EdgeInsets.all(10),
            child: const Center(
              child: Text(
                "This is Ahsan, I am a flutter developer, mjd dha hd",
                style: TextStyle(color: kLightColor, fontSize: 16),
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          const Text(
            "4:00 PM",
            style: TextStyle(color: kDarkColor, fontSize: 12),
          ),
        ],
      ),
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
    );
  }
}
