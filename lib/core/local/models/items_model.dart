import 'package:flutter/foundation.dart';

class ItemsModel{

  String text;
  String imagePath;

  ItemsModel({
    required this.text,
    required this.imagePath
  });

  factory ItemsModel.fromJson(Map<String,dynamic> json){
    return ItemsModel(
      text: json['text'],
      imagePath: json['imagePath']
    );
  }

  Map<String,dynamic> toJson(){
    return {
      'text': this.text,
      'imagePath' : this.imagePath
    };
  }


}