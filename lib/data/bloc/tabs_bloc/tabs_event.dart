abstract class BottomNavigationEvent {}

class UpdateBottomNavigationIndex extends BottomNavigationEvent {
  final int index;

  UpdateBottomNavigationIndex(this.index);
}

