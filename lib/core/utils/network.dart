//import 'dart:convert';
//
//import 'package:http/http.dart' as http;
//
//class Network {
//  final http.Client client = http.Client();
//
//  Future<int> fetchRepoStargazersCount(String repoName) async {
//    final response = await client.get(
//      "https://api.github.com/repos/david-legend/$repoName/stargazers?per_page=10000000",
//      headers: {
//        "Accept": "application/json",
//      },
//    );
//
//    print("Status Code ${response.statusCode}");
//    print("Status Code ${response.body}");
//    if (response.statusCode == 200) {
//      List count = json.decode(response.body);
//      print("Star Gazers Length ${count.length}");
//      return count.length;
//    }
//  }
//
//  Future<int> fetchRepoForksCount(String repoName) async {
//    final response = await client.get(
//      "https://api.github.com/repos/david-legend/$repoName/forks?per_page=10000000",
//      headers: {
//        "Accept": "application/json",
//      },
//    );
//
//    print("Status Code ${response.statusCode}");
//    print("Status Code ${response.body}");
//    if (response.statusCode == 200) {
//      List count = json.decode(response.body);
//      print("Star Gazers Length ${count.length}");
//      return count.length;
//    }
//  }
//}
