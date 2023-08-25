class Quote{
  int id;
  String texte;
  String? image;
  String author;

  get citation => texte;

  Quote({this.id=0, this.texte="Citation", this.image, this.author="Auteur"});
}