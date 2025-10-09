class PackageModel {
  final String name;
  final String price;
  final String? offer;
  final int? x;
  final bool isChecked;

  const PackageModel({
    required this.name,
    required this.price,
    this.offer,
    this.x,
    this.isChecked = false,
  });
}
