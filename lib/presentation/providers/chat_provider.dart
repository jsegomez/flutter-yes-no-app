import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  List<Message> messages = [
    Message(text: 'Hola, ¿cómo estás?', fromWho: FromWho.me),
    Message(text: '¡Hola! Estoy bien, gracias. ¿Y tú?', fromWho: FromWho.her),
    Message(text: '¿Qué tal tu día?', fromWho: FromWho.me),
    Message(text: 'Ha sido un buen día...', fromWho: FromWho.her),
  ];

  Future<void> sendMessage(String text) async {
    // TODO: Implementar la lógica para enviar un mensaje
  }
}
