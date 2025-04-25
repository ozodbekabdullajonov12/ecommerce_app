import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store/core/utils/colors.dart';
import 'package:store/features/common/ecommerce_app_bar.dart';
import 'package:store/features/home/presentation/manager/search/search_bloc.dart';
import 'package:store/features/home/presentation/manager/search/search_state.dart';
import 'package:store/features/home/presentation/widgets/search_view_products.dart';
import 'package:store/features/home/presentation/widgets/search_view_search_histories.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

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
            controller: context
                .read<SearchBloc>()
                .searchController,
            decoration: InputDecoration(
              hintText: "Search for clothes",
              icon: SvgPicture.asset("assets/icons/search.svg"),
            ),
            onFieldSubmitted:
                (_) => context.read<SearchBloc>().add(PerformSearchHistory()),
            onChanged: (_) => context.read<SearchBloc>().add(SearchSearching()),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocBuilder<SearchBloc, SearchState>(
                builder: (context, state) {
                  if (state.status == SearchStatus.idle) {
                    return Row(
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
                          onPressed:
                              () =>
                              context.read<SearchBloc>().add(ClearAllHistories()),
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
                    );
                  }
                  else {
                    return SizedBox();
                  }
                },),
              SizedBox(height: 16.h),
              BlocBuilder<SearchBloc, SearchState>(
                builder: (context, state) {
                  if (state.status == SearchStatus.loading) {
                    return SearchViewProducts(products: state.products,);
                  } else {
                    if (state.status == SearchStatus.idle) {
                      return SearchViewSearchHistories(
                        searchHistories: state.searchHistories,);
                    } else if (state.status == SearchStatus.notFound) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset("assets/icons/search-duotone.svg",
                              fit: BoxFit.cover,),
                            Text(
                              "No Results Found!",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                color: AppColors.primary.withValues(alpha: 0.9),
                              ),
                            ),
                            Text(
                              "Try a similar word or something more general.",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: AppColors.primary.withValues(alpha: 0.5),
                              ),
                            ),
                          ],
                        ),
                      );
                    } else {
                      return Center(child: Text(
                        "Something went wrong", style: TextStyle(color: AppColors
                          .error, fontSize: 20),));
                    }
                  }
                },
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
