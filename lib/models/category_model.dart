import 'dart:convert';
import 'package:http/http.dart' as http;

class CategoryModel {
  final String name;
  final String imageUrl;

  CategoryModel({
    required this.name,
    required this.imageUrl,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      name: json['name'],
      imageUrl: json['imageUrl'],
    );
  }
}

Future<List<CategoryModel>> getCategory() async {
  final response =
      await http.get(Uri.parse('http://bwa-jobs.herokuapp.com/categories'));
  if (response.statusCode == 200) {
    List<CategoryModel> myData = [];
    List parsedJson = jsonDecode(response.body);

    for (var element in parsedJson) {
      myData.add(CategoryModel.fromJson(element));
    }

    return myData;
  } else {
    throw Exception('Failed');
  }
}
