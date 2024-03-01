import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  const ChatMessage({
    super.key,
    required this.value,
    required this.uid,
    required this.animationController,
  });
  final String value;
  final String uid;
  final AnimationController animationController;
  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animationController,
      child: SizeTransition(
        sizeFactor: CurvedAnimation(
            parent: animationController, curve: Curves.elasticOut),
        child: SizedBox(
          child: uid == '123' ? _myMessage() : _notMyMessage(),
        ),
      ),
    );
  }

  Widget _myMessage() {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.only(bottom: 5, left: 50, right: 5),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color(0xff4d9ef6),
        ),
        child: Text(
          value,
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }

  Widget _notMyMessage() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(bottom: 5, left: 5, right: 50),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color(0xffE4E5E8),
        ),
        child: Text(
          value,
          style: const TextStyle(
              color: Colors.black87, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
