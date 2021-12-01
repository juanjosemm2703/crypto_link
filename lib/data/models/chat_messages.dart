class ChatMessage {
  final String text;
  final bool isSender;

  ChatMessage({required this.text, required this.isSender});
}

List<ChatMessage> giveMeChatMessages = [
  ChatMessage(text: 'Hola Juan', isSender: false),
  ChatMessage(text: 'Hola Pedro', isSender: true),
  ChatMessage(text: 'Como estas?', isSender: false),
  ChatMessage(text: 'Bien y tu?', isSender: true),
  ChatMessage(text: 'Me alegro, muy bien.', isSender: false),
  ChatMessage(text: 'Que tal si hablamos de Criptomonedas?', isSender: true),
];
