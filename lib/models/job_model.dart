import 'dart:convert';

import 'package:http/http.dart' as http;

class JobModel {
  final String name;
  final String companyName;
  final String companyLogo;

  JobModel({
    required this.name,
    required this.companyName,
    required this.companyLogo,
  });

  factory JobModel.fromJson(Map<String, dynamic> json) {
    return JobModel(
      name: json['name'],
      companyName: json['companyName'],
      companyLogo: json['companyLogo'],
    );
  }
}

Future<List<JobModel>> getJob() async {
  final response =
      await http.get(Uri.parse('http://bwa-jobs.herokuapp.com/jobs'));
  if (response.statusCode == 200) {
    List<JobModel> jobData = [];
    List parsedJson = jsonDecode(response.body);

    for (var element in parsedJson) {
      jobData.add(JobModel.fromJson(element));
    }

    return jobData;
  } else {
    throw Exception('Failed');
  }
}
