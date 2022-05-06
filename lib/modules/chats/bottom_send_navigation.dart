import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class BottomSendNavigation extends StatelessWidget {
  TextEditingController massegeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(color: HexColor('#001313')),
      child: Row(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.5,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(20)),
                  child: TextFormField(
                    cursorColor: Colors.black,
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Type Here",
                        icon: Icon(
                          Icons.emoji_emotions_rounded,
                          color: Colors.grey,
                        ),
                        suffixIcon: Icon(
                          Icons.file_present_rounded,
                          color: Colors.grey,
                        )),
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.mic,
              color: Colors.grey,
            ),
          ),
          const SizedBox(
            width: 7,
          ),
          Container(
            height: 40,
            width: 40,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.green,
            ),
            child: const Icon(
              Icons.message_rounded,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
