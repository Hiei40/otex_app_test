class ProductModel {
  final String name;
  final String image;
  final double price;
  final double? oldPrice;

  final int soldCount;
  final String? storeImage;


  ProductModel({
    required this.name,
    required this.image,
    required this.price,
    this.oldPrice,
    this.soldCount = 0,
    this.storeImage,

  });
}

