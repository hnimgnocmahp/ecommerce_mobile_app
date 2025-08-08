import 'package:flutter_bloc/flutter_bloc.dart';

import 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState>{
  NotificationCubit() : super(NotificationLoading());

  void loadNotifications() async {
    emit(NotificationLoading());
    await Future.delayed(Duration(seconds: 1)); // giả lập loading

    try {

      final List<String> notifications = [
        'New order receivedddddddddddddddddddddddddddddddddddddddrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr',
        'Your order has been shipped',
        'Flash sale starts now!',
      ];

      emit(NotificationLoaded(notifications));
    } catch (e) {
      emit(NotificationError('Failed to load notifications'));
    }
  }
}