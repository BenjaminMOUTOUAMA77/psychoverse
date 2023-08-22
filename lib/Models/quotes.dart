class Quote{
  late int id;
  late String texte;
  late String? image;
  late String author;

  get citation => texte;

  Quote({this.id=0, this.texte="Citation", this.image, this.author="Auteur"});
}