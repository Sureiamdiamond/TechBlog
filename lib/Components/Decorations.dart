
import 'package:flutter/cupertino.dart';

import '../Const/Colors.dart';

class myDecoration {

  myDecoration._(); //Nemishe nemone gereft vaghti intori minevisim

  static BoxDecoration mainGradiant =  BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(20)),
    gradient: LinearGradient(
    colors: GradiantColors.buttomNav
  ));

}