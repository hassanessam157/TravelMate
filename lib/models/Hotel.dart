class Hotel {
  final String hotelId;
  final String name;
  final String image;
  final String description1;
  final String description2;
  final String location;
  final String price;
  final double starRating;

  Hotel({
    required this.hotelId,
    required this.name,
    required this.image,
    required this.description1,
    required this.description2,
    required this.location,
    required this.price,
    required this.starRating,
  });

  // Factory method to create a Hotel from a map (Firebase data)
  factory Hotel.fromMap(String id, Map<dynamic, dynamic> data) {
    return Hotel(
      hotelId: id,
      name: data['name'] ?? '',
      image: data['image'] ?? '',
      description1: data['description1'] ?? '',
      description2: data['description2'] ?? '',
      location: data['location'] ?? '',
      price: data['price'] ?? '',
      starRating: (data['starRating'] ?? 0).toDouble(),
    );
  }
}
