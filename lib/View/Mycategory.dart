



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:techblog/Models/FakeData.dart';
import 'package:techblog/Components/MyComponents.dart';
import 'package:techblog/Const/Strings.dart';

import '../Const/Colors.dart';
import '../gen/assets.gen.dart';

class Mycatg extends StatefulWidget{
  @override
  State<Mycatg> createState() => _MycatgState();
}

class _MycatgState extends State<Mycatg> {
  @override
  Widget build(BuildContext context) {

    var txttheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    double _bodymargin = size.width / 12.5;


    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(right: _bodymargin, left: _bodymargin ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 40,),
                SvgPicture.asset(
                  Assets.images.robot,
                  height: 100,
                ),
                SizedBox(height: 18,),
                Text(MyStrings.successfulRegistration , style: txttheme.headline4,textAlign: TextAlign.center ,),
                TextField(

                  style: TextStyle(color: Color(0xcf2f1e2e), fontSize: 22, fontWeight: FontWeight.bold ),
                  textAlign: TextAlign.center ,
                  decoration: InputDecoration(
                    alignLabelWithHint: true,
                    hintText: "نام و نام خانوادگی",
                    hintStyle: txttheme.headline6
                  ),
                ),
                SizedBox(height: 45),
                Text(MyStrings.chooseCats , style: txttheme.headline4,),
                SizedBox(height: 20,),
                ///gridview
                SizedBox(
                  width: double.infinity,
                  height: 87,
                  child: GridView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: ClampingScrollPhysics(),//sanjagh scroll
                    itemCount: 6,
                    shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                        crossAxisCount: 2,
                        childAspectRatio: 0.293),
                      itemBuilder: (context, index) {
                        return InkWell(
                            onTap: (){
                              setState(() {

                                //age az index chizi nabood ezafe kon
                                if (!selectedTags.contains(tagList[index])){

                                   selectedTags.add(tagList[index]);

                                }else{ // dar gheyr in sorat..

                                  print("${tagList[index].title} exist");
                                }

                              });
                            },
                            child: MainTags(txttheme: txttheme, index: index));
                      },
                  ),
                ),
                SizedBox(height: 25),
                Image.asset(
                  Assets.images.arrow.path, scale: 3,),
                SizedBox(height: 20),

                ///gridview selected tags
                SizedBox(
                  width: double.infinity,
                  height: 87,
                  child: GridView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: ClampingScrollPhysics(),//sanjagh scroll
                    itemCount: selectedTags.length,
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                        crossAxisCount: 2,
                        childAspectRatio: 0.255),
                    itemBuilder: (context, index) {
                      return Container(
                        //width nemidim ke motaghayer bana be text toosh begire
                        height: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(23)),
                            color: SolidColors.surface
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              //image icon chon ham ax bashe ham khasiat icon
                              Text(
                                selectedTags[index].title,
                                style: txttheme.headline4,
                              ),
                              SizedBox(width: 8),
                              InkWell(
                                onTap: ((){
                                  setState(() {
                                    selectedTags.removeAt(index);
                                  });
                                }),
                                  child: Icon(CupertinoIcons.delete, color: Colors.grey,size: 20,))
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: ElevatedButton(
                      onPressed: (){},
                      child: Text("تایید", style: txttheme.headline1,)
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
