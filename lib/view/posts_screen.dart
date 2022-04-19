import 'package:api_integration/controller/post_controller.dart';
import 'package:api_integration/model/Post.dart';
import 'package:api_integration/repository/post_repository.dart';
import 'package:api_integration/repository/repository.dart';
import 'package:api_integration/view/widget/item_post.dart';
import 'package:flutter/material.dart';


class PostsScreen extends StatefulWidget {
  const PostsScreen({Key? key}) : super(key: key);

  @override
  _PostsScreenState createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {


  List<Post>? posts;
  var isLoaded = false;
  var postController;



  @override
  Widget build(BuildContext context) {



    return Scaffold(
      appBar: AppBar(title: Text("Get Posts")),

      body: Visibility(
        visible: isLoaded,
        child: ListView.builder(
          itemCount: posts?.length,
            itemBuilder: (context, index){
              return ItemPostScreen(index: index, item: posts![index], postController: postController,);
            }
        ),
      ),

    );
  }

  @override
  void initState() {
    super.initState();
    postController = PostController(PostRepository());
    getData();
  }

  getData() async{
    print("init run");
    posts = await postController.fetchPostList();
    if(posts != null){
      setState(() {
        isLoaded = true;
      });
    }

  }
}
