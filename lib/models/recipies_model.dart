class RecipeModel {
  String docId;
  String category;
  String title;
  String description;
  String image;
  String time;

  RecipeModel({
    required this.docId,
    required this.category,
    required this.title,
    required this.description,
    required this.image,
    required this.time,
  });

  // Convert Firestore document to Model
  factory RecipeModel.fromFirestore(Map<String, dynamic> data) {
    return RecipeModel(
      docId: data['docId'] ?? '',
      category: data['category'] ?? '',
      title: data['title'] ?? '',
      description: data['description'] ?? '',
      image: data['image'] ?? '',
      time: data['time'] ?? '',
    );
  }

  // Convert RecipeModel to Firestore Document
  Map<String, dynamic> toFirestore() {
    return {
      'docId': docId,
      'category': category,
      'title': title,
      'description': description,
      'image': image,
      'time': time,
    };
  }
}
