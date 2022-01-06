abstract class SearchEvent {}

class OnChangeEvent extends SearchEvent {
  final String value;
  OnChangeEvent(this.value);
}

class GetSearchEvent extends SearchEvent {}
