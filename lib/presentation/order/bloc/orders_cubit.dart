import 'package:ecommerce_mobile_app/presentation/order/bloc/orders_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class OrdersCubit extends Cubit<OrdersState>{
  OrdersCubit() : super(OrdersLoading());

  void loadOrders() async {
    emit(OrdersLoading());
    await Future.delayed(Duration(seconds: 1)); // giả lập loading

    try {

      final List<String> orders = [
        'Order #333333',
        'Order #444444',
        'Order #234234',
      ];

      emit(OrdersLoaded(orders));
    } catch (e) {
      emit(OrdersError('Failed to load orders'));
    }
  }
}