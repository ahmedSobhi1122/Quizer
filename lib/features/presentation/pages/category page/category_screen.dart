import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizer/core/resources/assets_manager.dart';
import 'package:quizer/features/presentation/pages/category%20search%20page/category_search_screen.dart';

import '../../../../config/themes/theme.dart';
import '../../../../core/resources/app_values.dart';
import '../../common/background.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List<Map<String, String>> cate = [
    {
      "image": ImageAssets.image,
      "text": "Medieval History"
    },
    {
      "image": ImageAssets.image,
      "text": "Medieval History"
    },
    {
      "image": ImageAssets.image,
      "text": "Medieval History"
    },
    {
      "image": ImageAssets.image,
      "text": "Medieval History"
    },
    {
      "image": ImageAssets.image,
      "text": "Medieval History"
    },
    {
      "image": ImageAssets.image,
      "text": "Medieval History"
    },
    {
      "image": ImageAssets.image,
      "text": "Medieval History"
    },
    {
      "image": ImageAssets.image,
      "text": "Medieval History"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyTheme.backgroundColor,
        leading: const Icon(Icons.arrow_back,
            color: MyTheme.textColor),
        title: const Text(
          "Categories",
          style: TextStyle(fontWeight: FontWeight.bold,color: MyTheme.textColor),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: CategorySearchScreen());
            },
            icon: const Icon(Icons.search),
            color: MyTheme.textColor,
          )
        ],
      ),
      body: SafeArea(
        child: Background(
          paddingRight: AppSize.s10,
          paddingLeft: AppSize.s10,
          paddingTop: AppSize.s20,
          child: Container(
            padding: const EdgeInsets.all(AppPadding.p8),
            child: Column(
              children: [
                Expanded(
                  child: GridView.builder(
                    itemCount: cate.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 3 / 2,
                    ),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: (){},
                        splashColor: Colors.grey,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(AppBorderRadius.br16),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(AppBorderRadius.br16),
                            child: Stack(
                              children: [
                                Image.asset(
                                  cate[index]['image']!,
                                  width: double.infinity,
                                  height: double.infinity,
                                  fit: BoxFit.cover,
                                ),

                                Positioned(
                                  bottom: 0,
                                  left: 0,
                                  right: 0,
                                  child: Container(
                                    padding: const EdgeInsets.all(AppPadding.p8),
                                    child: Text(
                                      cate[index]['text']!,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: AppSize.s18,
                                        color: Colors.white,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}