import 'package:equatable/equatable.dart';

import '../../domain/entities/category.dart';

abstract class HomeCategoriesState extends Equatable
{
  @override
  List<Object?> get props => [];
}

class HomeCategoriesInitial extends HomeCategoriesState{}
class HomeCategoriesLoading extends HomeCategoriesState{}
class HomeCategoriesLoaded extends HomeCategoriesState
{
  final List<Category> categories;
  HomeCategoriesLoaded({required this.categories});
  @override
  List<Object?> get props => [categories];
}
class HomeCategoriesFailure extends HomeCategoriesState
{
  final String error;
  HomeCategoriesFailure({required this.error});
  @override
  List<Object?> get props => [error];
}