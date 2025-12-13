class Product {
  int id;
  String title;
  double price;
  String description;
  Category category;
  String image;
  Rating rating;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      price: json['price'].toDouble(),
      description: json['description'],
      category: CategoryExtension.fromString(json['category']),
      image: json['image'],
      rating: Rating.fromJson(json['rating']),
    );
  }
}

enum Category {
  ELECTRONICS,
  JEWELERY,
  MEN,
  WOMEN,
}

extension CategoryExtension on Category {
  static Category fromString(String value) {
    switch (value) {
      case "electronics":
        return Category.ELECTRONICS;
      case "jewelery":
        return Category.JEWELERY;
      case "men's clothing":
        return Category.MEN;
      case "women's clothing":
        return Category.WOMEN;
      default:
        return Category.ELECTRONICS;
    }
  }

  String get displayName {
    switch (this) {
      case Category.ELECTRONICS:
        return "Electronics";
      case Category.JEWELERY:
        return "Jewelery";
      case Category.MEN:
        return "Men";
      case Category.WOMEN:
        return "Women";
    }
  }
}

class Rating {
  double rate;
  int count;

  Rating({required this.rate, required this.count});

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      rate: json['rate'].toDouble(),
      count: json['count'],
    );
  }
}
