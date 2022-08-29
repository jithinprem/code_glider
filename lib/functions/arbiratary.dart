import 'package:flutter/material.dart';

String get_comment_completed(comp){
  if (comp < 10){
    return 'it\'s great time to Get Started..';
  }
  return 'Congrulations, you are doing Great !';

}