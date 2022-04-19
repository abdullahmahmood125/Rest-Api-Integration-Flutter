import 'package:api_integration/controller/post_controller.dart';
import 'package:api_integration/model/Post.dart';
import 'package:flutter/material.dart';

class ItemPostScreen extends StatelessWidget {
  const ItemPostScreen({Key? key, this.index, this.item, this.postController}) : super(key: key);

  final int? index;
  final Post? item;
  final PostController? postController;
  @override
  Widget build(BuildContext context) {
    return
      Card(
      elevation: 5,
      color: Colors.white,
      child:
        Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Text(
              item!.title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
            Text(
              item!.body ?? '',
              style: TextStyle( fontSize: 14, fontWeight: FontWeight.normal),
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
               InkWell(
                 onTap: (){
                   postController!.patchPost(item!)
                       .then((value) => {
                     ScaffoldMessenger.of(context)
                         .showSnackBar(SnackBar(content: Text('$value'), duration: Duration(milliseconds: 500),))
                   });
                 },
                   child: buildButtonContainer('patch', Color(0xFFA5D6A7))
               ),
                InkWell(
                    onTap: (){
                      Post post = Post(userId: 1, id: 1, title: 'title test', body: 'body test');
                      postController!.postPost(post)
                      .then((value) => {
                        ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text('$value'), duration: Duration(milliseconds: 500),))
                      });
                    },
                    child: buildButtonContainer('post', Color(0xFFFFE0B2))),
              ],
            ),
          ],
        )
      ),
    );
  }
}

Container buildButtonContainer(String title , Color color){
return Container(
  margin: EdgeInsets.only(top: 10),
  padding: EdgeInsets.all(10.0),
  width: 80.0,
  height: 40.0,
  decoration: BoxDecoration(
    color: color,
    borderRadius: BorderRadius.circular(10.0),
  ),
  child: Center(child: Text('$title')),
);
}
Container buildBigButtonContainer(String title , Color color){
  return Container(
    margin: EdgeInsets.all(30),
    padding: EdgeInsets.all(10.0),
    width: double.infinity,
    height: 50.0,
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: Center(child: Text('$title')),
  );
}