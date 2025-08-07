import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';

import '../../../common/bloc/bottom_nav/bottom_nav_cubit.dart';
import '../../home/pages/home.dart';


class MainScreen extends StatelessWidget {
  final List<Widget> pages =  [
    HomePage(),
    Container(color: Colors.green),
    Container(color: Colors.blue),
    Container(color: Colors.yellow),
  ];

  MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BottomNavCubit(),
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
