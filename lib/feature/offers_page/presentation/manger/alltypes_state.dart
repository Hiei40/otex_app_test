part of 'alltypes_cubit.dart';

abstract class AlltypesState {}

class AlltypesInitial extends AlltypesState {}

class AlltypesLoading extends AlltypesState {}

class AlltypesLoaded extends AlltypesState {
  final List<Alltypes> alltypes;
  AlltypesLoaded(this.alltypes);
}

class AlltypesEmpty extends AlltypesState {}

class AlltypesError extends AlltypesState {
  final String message;
  AlltypesError(this.message);
}
