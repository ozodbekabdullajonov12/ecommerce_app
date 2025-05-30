import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store/core/utils/colors.dart';
import 'package:store/features/common/ecommerce_app_bar.dart';
import 'package:store/features/home/presentation/widgets/ecommerce_bottom_navigation_bar.dart';
import 'package:store/features/notification/presentation/manager/notification_bloc.dart';
import 'package:store/features/notification/presentation/manager/notification_state.dart';

class NotificationsView extends StatelessWidget {
  NotificationsView({super.key});
  final List dates = [];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: EcommerceAppBar(title: "Notifications", actions: []),
      body: BlocBuilder<NotificationBloc, NotificationState>(
        builder: (context, state) {
          var notifications = state.notifications;
          if (state.status == NotificationStatus.loading) {
            return Center(child: CircularProgressIndicator());
          }
          if (notifications == null || notifications.isEmpty) {
            return Center(child: Text("Hech qanday bildirishnoma yo‘q"));
          }
          return ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            itemCount: notifications.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  children: [
                    SvgPicture.network(notifications[index].icon),
                    SizedBox(width: 15.w,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          notifications[index].title,
                          style: TextStyle(
                            color: AppColors.primary.withValues(alpha: 0.9),
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          notifications[index].content,
                          style: TextStyle(
                            color: AppColors.primary.withValues(alpha: 0.5),
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      bottomNavigationBar: EcommerceBottomNavigationBar(),
    );
  }
}
