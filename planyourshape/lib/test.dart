import 'dart:developer';

void dire({required String phrase}) {
  log(phrase);
}

class Marguerite {
  final String _couleur;

  Marguerite({required String couleur}) : _couleur = couleur;

  const Marguerite.rouge() : _couleur = "rouge";

  @override
  String toString() {
    return "la couleur de ma marguerite est $_couleur";
  }
}