
import 'package:flutter/material.dart';

import 'Colors.dart';
import '../Models/FakeData.dart';
import '../gen/assets.gen.dart';

class TechDivider extends StatelessWidget {
  const TechDivider({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: SolidColors.dividerColor,
      indent: size.width/7,
      endIndent: size.width/7,
      thickness: 0.5,
    );
  }
}

class MainTags extends StatelessWidget {
   MainTags({
    Key? key,
    required this.txttheme,
    required this.index
  }) : super(key: key);

  final TextTheme txttheme;
  var index;

  @override
  Widget build(BuildContext context) {
    return Container(
      //width nemidim ke motaghayer bana be text toosh begire
      height: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(23)),
          gradient: LinearGradient(
              colors: GradiantColors.tags,
              begin: Alignment.centerRight,
              end: Alignment.centerLeft)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
        child: Row(
          children: [
            //image icon chon ham ax bashe ham khasiat icon
            ImageIcon(
                Image.asset(Assets.icons.tag.path).image,
                color: Colors.white,
                size: 16),
            SizedBox(width: 8),
            Text(
              tagList[index].title,
              style: txttheme.headline2,
            )
          ],
        ),
      ),
    );
  }
}