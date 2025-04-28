part of "search_bloc.dart";


sealed class   SearchEvent {}
final class Searching extends SearchEvent{}

final class DeleteSearchHistory extends SearchEvent{
  final String text;
  DeleteSearchHistory({required this.text});
}

final class PerformSearchHistory extends SearchEvent{}

final class ClearAllHistories extends SearchEvent{}

final class LoadSearchHistory extends SearchEvent{}

final class SearchSearching extends SearchEvent{}