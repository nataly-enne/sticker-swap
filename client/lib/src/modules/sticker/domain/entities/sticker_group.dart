class StickerGroup{
  int id;
  String name;
  String image;
  bool isImageIcon;

  StickerGroup({
    required this.id,
    required this.name,
    required this.image,
    this.isImageIcon = false
  });

}