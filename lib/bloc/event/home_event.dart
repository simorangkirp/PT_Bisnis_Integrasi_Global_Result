class HomeEvent {}

class InitHome extends HomeEvent {
  final int limit;
  final int offset;
  InitHome(
    this.limit,
    this.offset,
  );
}

class ToDetailScreen extends HomeEvent {
  int? orderId;
  ToDetailScreen({
    this.orderId,
  });
}
