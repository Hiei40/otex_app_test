import 'package:otex_app_test/utils/photos/photos.dart';

class Alltypes {
  final String name;
  final String image;

  Alltypes({required this.name, required this.image});
}

List<Alltypes> constalltype = [
  Alltypes(name: "موضة رجالى", image: Photos.manacceories),
  Alltypes(name: "ساعات", image: Photos.watch),
  Alltypes(name: "موبايلات", image: Photos.iphone),
  Alltypes(name: "منتجات تجميل", image: "assets/photocontainer_womenmakeup.png"),
];
