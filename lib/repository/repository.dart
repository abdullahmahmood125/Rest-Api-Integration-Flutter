
import 'package:api_integration/model/Post.dart';
import 'package:http/http.dart' as http;
abstract class Repository{

  Future<List<Post>?> getPostList();
  Future<String> patchCompleted(Post post);
  Future<String> postPost(Post post);

  // Future<List<Post>?> getPosts()  async{
  //   var client = http.Client();
  //
  //   var uri  = Uri.parse("https://jsonplaceholder.typicode.com/posts");
  //   var response = await client.get(uri);
  //
  //   if(response.statusCode == 200){
  //     var json = response.body;
  //    return postFromJson(json);
  //   }
  //
  // }
  //
  // Future<List<Post>?> postPosts(Post post)  async{
  //   var client = http.Client();
  //
  //   var uri  = Uri.parse("https://jsonplaceholder.typicode.com/posts");
  //   var response = await client.post(uri);
  //
  //   if(response.statusCode == 200){
  //     var json = response.body;
  //     return postFromJson(json);
  //   }
  //
  // }

}