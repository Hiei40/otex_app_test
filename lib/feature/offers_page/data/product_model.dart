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

final List<ProductModel> products = [
  ProductModel(
    name: "جاكيت من الصوف مناسب",
    image: "assets/02e47cf0ed554bc399ec7a98c03dccd8f99147c6.png",

    price: 32000000,
    oldPrice: 60,
    soldCount: 3300,
    storeImage: "assets/7ac3c5cc-e9ec-4a6b-869f-e926a03638f7.png",
  ),
  ProductModel(
    name: "تيشيرت رجالي قطن 100%",
    image: "assets/image/t-shirt.png",

    price: 32000000,
    oldPrice: 60,
    soldCount: 890,
    storeImage: "assets/store_logo_1.png",

  ),
  ProductModel(
    name: "بنطال جينز أزرق",
    image: "assets/image/shoes.png",
    price: 32000000,
    oldPrice: 60,
    soldCount: 1200,
    storeImage: "assets/store_logo_2.png",
  ),
  ProductModel(
    name: "حذاء رياضي أبيض",
    image: "assets/02e47cf0ed554bc399ec7a98c03dccd8f99147c6.png",
    price: 32000000,
    oldPrice: 60,
    soldCount: 2700,
    storeImage: "assets/store_logo_3.png",
  ),

  ProductModel(
    name: "جاكيت من الصوف مناسب",
    image: "assets/02e47cf0ed554bc399ec7a98c03dccd8f99147c6.png",

    price: 32000000,
    oldPrice: 60,

    soldCount: 3300,
    storeImage: "assets/7ac3c5cc-e9ec-4a6b-869f-e926a03638f7.png",
  ),
  ProductModel(
    name: "تيشيرت رجالي قطن 100%",
    image: "assets/image/t-shirt.png",

    price: 32000000,
    oldPrice: 60,

    soldCount: 890,
    storeImage: "assets/store_logo_1.png",
  ),
];
