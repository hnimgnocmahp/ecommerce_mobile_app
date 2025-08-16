abstract class OrdersState{}

class OrdersLoading extends OrdersState {}

class OrdersLoaded extends OrdersState {
  final List<String> orders;
  OrdersLoaded(this.orders);
}

class OrdersError extends OrdersState  {
  final String message;
  OrdersError(this.message);
}