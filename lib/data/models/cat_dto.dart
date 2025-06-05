class Cat {
  final String id;
  final String url;
  final String breedName;
  final String description;

  const Cat({
    required this.id,
    required this.url,
    required this.breedName,
    required this.description,
  });

  factory Cat.fromJson(Map<String, dynamic> json) {
    return Cat(
      id: json['id'] as String,
      url: json['url'] as String,
      breedName: json['breeds'][0]['name'] as String,
      description: json['breeds'][0]['description'] as String,
    );
  }

  get likedDate => null;

  Map<String, dynamic> toJson() => {
    'id': id,
    'url': url,
    'breedName': breedName,
    'description': description,
  };
}