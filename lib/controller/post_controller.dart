

import 'package:api_integration/model/Post.dart';
import 'package:api_integration/repository/repository.dart';
import 'package:flutter/material.dart';

class PostController {

  final Repository _repository;

  PostController(this._repository);

  Future<List<Post>?> fetchPostList() async{
    return _repository.getPostList();
  }

  Future<String> patchPost(Post post) async{
    return _repository.patchCompleted(post);
  }

  Future<String> postPost(Post post) async{
    return _repository.postPost(post);
  }



}