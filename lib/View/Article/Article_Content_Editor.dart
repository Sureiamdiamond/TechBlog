
   import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:techblog/Components/MyComponents.dart';
import 'package:techblog/Controller/Article/ManageArticleController.dart';

class ArticleContentEditor extends StatelessWidget{

  final HtmlEditorController controller = HtmlEditorController();
  var manageArticleController =  Get.put(ManageArticleController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => controller.clearFocus() ,
      child: Scaffold(
        appBar: MYAppbar("نوشتن / ویرایش مقاله"),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HtmlEditor(
                controller: controller,
                htmlEditorOptions: HtmlEditorOptions(
                  hint: "... اینجا بنویس",
                  shouldEnsureVisible: true,
                  initialText: manageArticleController.articleInfoModel.value.content!,

                ),
                callbacks: Callbacks(
                  onChangeContent: (p0) {
                    manageArticleController.articleInfoModel.update((val) {
                      val?.content = p0;
                    });
                    log(manageArticleController.articleInfoModel.value.content.toString());
                  },
                ),

              )
            ],
          ),
        ),
      ),
    );
  }

}