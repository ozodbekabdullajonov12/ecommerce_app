import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store/core/utils/colors.dart';
import 'package:store/data/models/search_history_model.dart';
import 'package:store/features/home/presentation/manager/search/search_bloc.dart';

class SearchViewSearchHistories extends StatelessWidget {
  const SearchViewSearchHistories({super.key, required this.searchHistories});

  final List<SearchHistoryModel> searchHistories;

  @override
  Widget build(BuildContext context) {
    return Column(
      children:
          searchHistories.map((searchText) {
            return Column(
              children: [
                ListTile(
                  title: Text(
                    searchText.title,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: AppColors.primary.withValues(alpha: 0.9),
                    ),
                  ),
                  trailing: IconButton(
                    icon: SvgPicture.asset("assets/icons/delete_search.svg"),
                    onPressed:
                        () => context.read<SearchBloc>().add(
                          DeleteSearchHistory(text: searchText.title),
                        ),
                  ),
                ),
                Divider(
                  // Add divider here
                  color: AppColors.primary.withValues(alpha: 0.2),
                ),
                SizedBox(height: 8.h),
              ],
            );
          }).toList(),
    );
  }
}
