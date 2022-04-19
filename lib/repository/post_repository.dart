import 'dart:convert';

import 'package:api_integration/model/Post.dart';
import 'package:api_integration/repository/repository.dart';
import 'package:http/http.dart' as http;

class PostRepository extends Repository{

  String baseURL = "https://jsonplaceholder.typicode.com";

  @override
  Future<List<Post>?> getPostList() async{
    var client = http.Client();

    var uri  = Uri.parse("$baseURL/posts");
    var response = await client.get(uri);

    if(response.statusCode == 200){
      var json = response.body;

      return postFromJson(json);
    }

  }

  @override
  Future<String> patchCompleted(Post post) async{
    var uri  = Uri.parse("$baseURL/posts/${post.id}");
    String resData = '';
    String bodyresult = "";
    await http.patch(
      uri,
      body: {
        'title': 'test title',
      },
      headers: {    'Authorization': 'your_token' },
    ).then((response) => {
        bodyresult = response.body,
        resData = response.reasonPhrase!

    });
    print(bodyresult);
    return resData;

  }

  @override
  Future<String> postPost(Post post) async {
    //print(post.toJson());
    var uri  = Uri.parse("$baseURL/posts/");
    var response = await http.post(uri,
      body: post.toJson(),
    );
    print(response.body);

    return response.reasonPhrase.toString();
  }
  
}