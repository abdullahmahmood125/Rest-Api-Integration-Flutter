import 'package:api_integration/view/posts_screen.dart';
import 'package:api_integration/view/upload_file_screen.dart';
import 'package:api_integration/view/widget/item_post.dart';
import 'package:flutter/material.dart';

class SelectionScreen extends StatelessWidget {
  const SelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) { return PostsScreen(); }));
                },
                child:  buildBigButtonContainer("Api Methods", Color(0xFFE1BEE7)),
              ),
              InkWell(
                  onTap: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) { return UploadFileScreen(); }));
                  },
                child: buildBigButtonContainer("File Section", Color(0xFFFFE0B2))
              )


            ],
          ),
        ),
      ),
    );
  }
}
