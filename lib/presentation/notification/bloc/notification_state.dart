abstract class NotificationState{}

class NotificationLoading extends NotificationState {}

class NotificationLoaded extends NotificationState {
  final List<String> notifications;
  NotificationLoaded(this.notifications);
}

class NotificationError extends NotificationState {
  final String message;
  NotificationError(this.message);
}