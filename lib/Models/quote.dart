class Quote{
  String? id;
  String? citation;
  String? auteur;
  String? image;
  String? asm_id;
  bool? is_global;

  Quote({required this.id,this.citation="Citation",this.auteur="Auteur", this.image, this.asm_id,this.is_global=false});
}