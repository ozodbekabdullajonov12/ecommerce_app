import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store/core/utils/colors.dart';
import 'package:store/features/common/ecommerce_app_bar.dart';

class SearchView extends StatefulWidget {
  SearchView({super.key});

  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final TextEditingController search = TextEditingController();
  List<String> recentSearches = [];

  void _performSearch() {
    setState(() {
      if (search.text.isNotEmpty && !recentSearches.contains(search.text)) {
        recentSearches.add(search.text);
      }
      search.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EcommerceAppBar(
        title: "Search",
        actions: [SvgPicture.asset("assets/icons/notification.svg")],
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 52.h),
          child: TextFormField(
            style: TextStyle(color: AppColors.primary.withValues(alpha: 0.9)),
            minLines: 1,
            maxLines: 1,
            controller: search,
            decoration: InputDecoration(
              hintText: "Search for clothes",
              icon: SvgPicture.asset("assets/icons/search.svg"),
            ),
            onFieldSubmitted: (_) => _performSearch(),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Recent Searches",
                  style: TextStyle(
                    color: AppColors.primary.withValues(alpha: 0.9),
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    fontFamily: "General Sans",
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      recentSearches.clear();
                    });
                  },
                  child: Text(
                    "clear all",
                    style: TextStyle(
                      color: AppColors.primary.withValues(alpha: 0.9),
                      fontFamily: "General Sans",
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            recentSearches.isNotEmpty
                ? Column(
              children: recentSearches.map((searchText) {
                return Column(
                  children: [
                    ListTile(
                      title: Text(searchText),
                      trailing: IconButton(
                        icon: SvgPicture.asset(
                          "assets/icons/delete_search.svg",
                        ),
                        onPressed: () {
                          setState(() {
                            recentSearches.remove(searchText);
                          });
                        },
                      ),
                    ),
                    Divider( // Add divider here
                      color: AppColors.primary.withValues(alpha: 0.2),
                    ),
                    SizedBox(height: 8.h),
                  ],
                );
              }).toList(),
            )
                : Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    "No recent searches",
                    style: TextStyle(
                      color: AppColors.primary.withValues(alpha: 0.7),
                    ),
                  ),
                ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
