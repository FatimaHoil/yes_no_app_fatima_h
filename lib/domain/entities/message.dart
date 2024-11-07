enum FromWho { mine, him,}

class Messages {
  final String text;
  final String? imageUrl;
  final FromWho fromWho;

  Messages({ 
    required this.text,
    this.imageUrl,
    required this.fromWho
  });
}