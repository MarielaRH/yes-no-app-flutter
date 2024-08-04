// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:yes_no_app/domain/entities/message.dart';

class YesNoModel {
  String answer;
  bool forced;
  String image;

  YesNoModel({required this.answer, required this.forced, required this.image});

  factory YesNoModel.fromJsonMap(Map<String, dynamic> json) {
    return YesNoModel(answer: json['answer'], forced: json['forced'], image: json['image']);
  }

  Map<String, dynamic> toJson() => {"answer": answer, "forced": forced, "image": image};

  Message toMessageEntity() => Message(text: answer == 'yes' ? 'Si' : 'No', fromWho: FromWho.him, imageUrl: image);
}
