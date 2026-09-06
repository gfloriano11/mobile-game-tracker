class Game {
  final int id;
  final String name;
  final String genre;
  final String platform;
  final String images;
  final String description;
  int hoursPlayed;
  int review;
  bool? wasPlayedRecently;

  Game({
    required this.id,
    required this.name,
    required this.genre,
    required this.platform,
    required this.images,
    required this.description,
    required this.hoursPlayed,
    required this.review,
    this.wasPlayedRecently,
  });

  factory Game.fromJson(Map<String, dynamic> json) {
    return Game(
      id: json["id"],
      name: json["name"],
      genre: json["genre"],
      platform: json["platform"],
      images: json["images"],
      description: json["description"],
      hoursPlayed: int.tryParse(json["hoursPlayed"].toString()) ?? 0,
      review:
          int.tryParse(json["review"].toString().replaceAll("/10", "")) ?? 0,
      wasPlayedRecently: json["wasPlayedRecently"],
    );
  }
}
