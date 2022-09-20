// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

class Postmodel {
  
  final String name;
  final String desc;
  final File images;
  final DateTime date;
   bool isLiked;

  Postmodel({
    required this.name,
    required this.desc,
    required this.images,
    required this.date,
     this.isLiked=false,
  });
}
