part of 'alloffers_cubit.dart';

abstract class AllOffersState {}

class AllOffersInitial extends AllOffersState {}

class AllOffersLoading extends AllOffersState {}

class AllOffersLoaded extends AllOffersState {
  final List<String> categories;
  AllOffersLoaded(this.categories);
}

class AllOffersEmpty extends AllOffersState {}

class AllOffersError extends AllOffersState {
  final String message;
  AllOffersError(this.message);
}
