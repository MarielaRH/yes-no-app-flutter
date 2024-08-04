enum FromWho { me, him }

// Las entidades vienen siendo como las interfaces de JS
class Message {
  final String text;
  final String? imageUrl;
  final FromWho fromWho;

  Message({required this.text, this.imageUrl, required this.fromWho});
}
