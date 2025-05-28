part of 'saved_items_bloc.dart';


sealed class SavedItemsEvent {}


final class SavedItemsLoading extends SavedItemsEvent{}

final class SavedItemsUnSave extends SavedItemsEvent{

  final int id;
  SavedItemsUnSave({required  this.id});
}