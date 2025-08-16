import 'package:ecommerce_mobile_app/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_mobile_app/common/widgets/tile_card/tile_card.dart';
import 'package:ecommerce_mobile_app/core/configs/assets/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import '../../../core/configs/theme/app_color.dart';
import '../bloc/notification_cubit.dart';
import '../bloc/notification_state.dart';


class NotifyPage extends StatelessWidget{
  const NotifyPage({super.key});
  @override
  Widget build(BuildContext context) {
    context.read<NotificationCubit>().loadNotifications();
    return Scaffold(
      appBar: BasicAppBar(
        title: Text(
          'Notifications',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'Satoshi'
          ),
        ),
        hideBack: true,
      ),
      body: BlocBuilder<NotificationCubit, NotificationState>(
        builder: (context, state) {
          if (state is NotificationLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is NotificationLoaded) {
            if (state.notifications.isEmpty) {
              return Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(AppImages.notification),
                    SizedBox(height: 30,),
                    Text(
                      'No Notifications Yet',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 30,),
                    ElevatedButton(
                      onPressed: (){},
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(200, 50),
                        backgroundColor: AppColor.primary,
                      ),
                      child: Text(
                      'Explore Categories',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),

                    )
                  ],
                ),
              );
            }
            return ListView.builder(
              padding: EdgeInsets.only(top: 20, left: 20, right: 20),
              itemCount: state.notifications.length,
              itemBuilder: (context, index) {
                return TileCard(
                  icon: Icon(IconlyBroken.notification),
                  title: state.notifications[index],
                );
              }
            );
          } else if (state is NotificationError) {
            return Center(child: Text(state.message));
          }
          return SizedBox.shrink();
        }
      )
    );
  }
}