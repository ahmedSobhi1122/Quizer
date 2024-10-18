import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizer/config/themes/theme.dart';
import 'package:quizer/features/presentation/common/background.dart';

import '../../../../core/resources/app_values.dart';
import '../../../../core/resources/assets_manager.dart';

class CategorySearchScreen extends SearchDelegate {
  List<Map<String, String>> cate = [
    {
      "image": ImageAssets.image,
      "text": "Medieval History1",
      "subtitle": "10 quest"
    },
    {
      "image": ImageAssets.image,
      "text": "Medieval History2",
      "subtitle": "10 quest"
    },
    {
      "image": ImageAssets.image,
      "text": "Medieval History3",
      "subtitle": "10 quest"
    },
    {
      "image": ImageAssets.image,
      "text": "Medieval History4",
      "subtitle": "10 quest"
    },
    {
      "image": ImageAssets.image,
      "text": "Medieval History5",
      "subtitle": "10 quest"
    },
    {
      "image": ImageAssets.image,
      "text": "Medieval History6",
      "subtitle": "10 quest"
    },
    {
      "image": ImageAssets.image,
      "text": "Medieval History",
      "subtitle": "10 quest"
    },
    {
      "image": ImageAssets.image,
      "text": "Medieval History",
      "subtitle": "10 quest"
    },
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    // Show clear button if query is not empty
    return [
      if (query.isNotEmpty)
        IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
            showSuggestions(context);
          },
        ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // Back button to close the search
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Implement search result display
    List<Map<String, String>> results = cate
        .where((element) =>
        element['text']!.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppBorderRadius.br16)
          ),
          height: 129.h,
          width: 390.w,
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(AppBorderRadius.br20),
                child: Container(
                  height: 129.h,
                  width: 129.w,

                  child: Image(
                    image: AssetImage(results[index]['image']!),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              Expanded(
                child: ListTile(
                  title: Text(
                    results[index]['text']!,
                    style: TextStyle(fontSize: AppSize.s18,
                        fontWeight: FontWeight.bold,color: MyTheme.textColor),
                  ),
                  subtitle: Text(
                    results[index]['subtitle']!,
                    style: TextStyle(fontSize: AppSize.s12,color: MyTheme.textColor),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Map<String, String>> suggestions = cate
        .where((element) =>
        element['text']!.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.all(AppPadding.p16),
          child: InkWell(
            onTap: (){},
            splashColor: MyTheme.textColor,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppBorderRadius.br16),
              child: Container(
                height: 129.h,
                width: 390.w,
                color: MyTheme.disabledColor.withOpacity(.5),
                child: Row(
                  children: [
                    Container(
                      height: 129.h,
                      width: 129.w,
                      child: Image(
                        image: AssetImage(suggestions[index]['image']!),
                        fit: BoxFit.cover,
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text(
                          suggestions[index]['text']!,
                          style: TextStyle(fontSize: AppSize.s18,
                              fontWeight: FontWeight.bold,color: MyTheme.textColor),
                        ),
                        subtitle: Text(
                          suggestions[index]['subtitle']!,
                          style: TextStyle(fontSize: AppSize.s12,color: MyTheme.textColor),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}