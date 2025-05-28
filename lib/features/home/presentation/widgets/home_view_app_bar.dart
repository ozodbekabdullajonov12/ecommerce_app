import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:store/core/connection_state.dart';
import 'package:store/core/routing/routes.dart';
import 'package:store/core/utils/colors.dart';
import 'package:store/features/home/presentation/manager/home_bloc.dart';

import '../manager/home_state.dart';
import 'home_bottom_sheet.dart';

class HomeViewAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeViewAppBar({super.key});



  @override
  Size get preferredSize => const Size(double.infinity, 170);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: AppBar(
        surfaceTintColor: Colors.transparent,
        title: Text(
          "Discover",
          style: TextStyle(
            color: AppColors.primary.withValues(alpha: 0.9),
            fontWeight: FontWeight.w600,
            fontSize: 32,
          ),
        ),
        actions: [
          IconButton(
            icon: SvgPicture.asset("assets/icons/notification.svg"),
            onPressed: () {
              context.push(Routes.notifications);
            },
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 160),
          child: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) =>
              Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 281.w,
                    height: 52.h,
                    child: TextFormField(
                      controller: context
                          .read<HomeBloc>()
                          .searchController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: AppColors.primary.withValues(alpha: 0.1),
                        hintText: "Search for clothes...",
                        hintStyle: TextStyle(
                          color: AppColors.primary.withValues(alpha: 0.7),
                          fontWeight: FontWeight.w400,
                          fontFamily: "General Sans",
                          fontSize: 16,
                        ),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: SvgPicture.asset(
                            "assets/icons/search.svg",
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: SvgPicture.asset(
                            "assets/icons/microphone.svg",
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      style: TextStyle(
                        color: AppColors.primary.withValues(alpha: 0.9),
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        fontFamily: "General Sans",
                      ),
                      onChanged: (value) =>
                          context.read<HomeBloc>().add(HomeSearch()),
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      if(context.read<ConnectionStateCubit>().state.isOnline) {
                        final filters = await showModalBottomSheet<HomeApplyFilters?>(
                        useSafeArea: true,
                        context: context,
                        builder: (context) =>
                            HomeBottomSheet(sizes: state.sizes),);
                        if (filters != null){
                          context.mounted?  context.read<HomeBloc>().add(filters):null;
                      }
                      }else{
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("You can't use filters when you are not in network ")));
                      }
                    },
                    child: Container(
                      width: 52.w,
                      height: 52,
                      decoration: BoxDecoration(
                        color: AppColors.primary.withValues(alpha: 0.9),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: SvgPicture.asset("assets/icons/filters.svg"),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 60,
                child: (state.status == HomeStatus.idle) ?
                ListView.separated(
                  itemCount: state.categories.length,
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) => SizedBox(width: 10,),
                  itemBuilder: (context, index) =>
                      GestureDetector(
                        onTap: () =>
                            context.read<HomeBloc>().add(CurrentCategory(
                                id: state.categories[index].id)),
                        child: Center(
                          child: Container(
                          height: 36.h,
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: (state.currentCategoryId !=
                                  state.categories[index].id) ? AppColors
                                  .primary.withValues(alpha: 0.1) : Colors
                                  .transparent,
                            ),
                            borderRadius: BorderRadius.circular(8),
                              color: (state.currentCategoryId !=
                                  state.categories[index].id)
                                  ? Colors.white
                                  : AppColors.primary
                          ),
                          child: Center(
                            child: Text(
                              state.categories[index].title,
                              style: TextStyle(
                                color: (state.currentCategoryId !=
                                    state.categories[index].id) ? AppColors
                                    .primary.withValues(alpha: 0.9) : Colors
                                    .white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                fontFamily: "General sans",
                              ),
                            ),
                          ),
                        ),
                        ),
                      ),
                ) : SizedBox(),
              ),
            ],
              ),),
        ),
      ),
    );
  }
}
