import 'package:ecommerce_mobile_app/presentation/notification/pages/notification.dart';
import 'package:ecommerce_mobile_app/presentation/order/pages/order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import '../../../common/bloc/bottom_nav/bottom_nav_cubit.dart';
import '../../home/pages/home.dart';
import '../../notification/bloc/notification_cubit.dart';


class MainScreen extends StatelessWidget {
  final List<Widget> pages =  [
    HomePage(),
    NotifyPage(),
    OrderPage(),
    Container(color: Colors.yellow),
  ];

  MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => BottomNavCubit()),
        BlocProvider(create: (_) => NotificationCubit()),
      ],
      child: BlocBuilder<BottomNavCubit, int>(
        builder: (context, currentIndex) {
          return Scaffold(
            body: pages[currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: currentIndex,
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              onTap: (index) {
                context.read<BottomNavCubit>().changeTab(index);
              },
              items: [
                BottomNavigationBarItem(icon: Icon(IconlyBroken.home), label: ''),
                BottomNavigationBarItem(icon: Icon(IconlyBroken.notification), label: ''),
                BottomNavigationBarItem(icon: Icon(IconlyBroken.bag), label: ''),
                BottomNavigationBarItem(icon: Icon(IconlyBroken.profile), label: ''),
              ],
            ),
          );
        },
      ),
    );
  }
}
