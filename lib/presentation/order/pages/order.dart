
import 'package:ecommerce_mobile_app/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_mobile_app/presentation/order/bloc/orders_cubit.dart';
import 'package:ecommerce_mobile_app/presentation/order/bloc/orders_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';

import '../../../common/widgets/tile_card/tile_card.dart';
import '../../../core/configs/assets/app_images.dart';
import '../../../core/configs/theme/app_color.dart';

class OrderPage extends StatelessWidget{
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<OrdersCubit>().loadOrders();
    return Scaffold(
      appBar: BasicAppBar(
        title: Text(
          'Orders',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'Satoshi'
          ),
        ),
        hideBack: true,
      ),
      body: BlocBuilder<OrdersCubit, OrdersState>(
        builder: (context, state) {
          if (state is OrdersLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is OrdersLoaded) {
            if (state.orders.isEmpty) {
              return Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(AppImages.order),
                    SizedBox(height: 30,),
                    Text(
                      'No Orders Yet',
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
                itemCount: state.orders.length,
                itemBuilder: (context, index) {
                  return TileCard(
                    icon: Icon(IconlyBroken.bag),
                    title: state.orders[index],
                  );
                }
            );
          } else if (state is OrdersError) {
            return Center(child: Text(state.message));
          }
          return SizedBox.shrink();
        }
        ),
    );
  }

}