class Brands {
  final String name, longName, image;
  final int price;
  double rating;

  Brands({
    required this.name,
    required this.longName,
    required this.image,
    required this.price,
    required this.rating,
  });
}

final BrandsList = [
  Brands(
    image: "nike_shoe4.png",
    name: "Nike Air",
    longName: "Nike Air Retro Shoe",
    price: 300,
    rating: 4.6,
  ),
  Brands(
    image: "nike_shoe3.png",
    name: "Nike Air",
    longName: "Nike Air Retro Shoe",
    price: 320,
    rating: 4.2,
  ),
  Brands(
    image: "nike_shoe2.png",
    name: "Nike Jordan",
    longName: "Nike Jordan Retro Shoe",
    price: 270,
    rating: 4,
  ),
  Brands(
    image: "nike_shoe.png",
    name: "Nike Jordan",
    longName: "Nike Jordan Retro Shoe",
    price: 280,
    rating: 4.3,
  ),
  Brands(
    image: "nike_shoe1.png",
    name: "Nike Jordan",
    longName: "Nike Jordan Retro Shoe",
    price: 250,
    rating: 4.5,
  ),
];
