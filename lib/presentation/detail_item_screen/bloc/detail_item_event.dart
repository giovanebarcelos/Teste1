// ignore_for_file: must_be_immutable

part of 'detail_item_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///DetailItem widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class DetailItemEvent extends Equatable {}

/// Event that is dispatched when the DetailItem widget is first created.
class DetailItemInitialEvent extends DetailItemEvent {
  @override
  List<Object?> get props => [];
}

///Event for changing ChipView selection
class UpdateChipViewEvent extends DetailItemEvent {
  UpdateChipViewEvent({
    required this.index,
    this.isSelected,
  });

  int index;

  bool? isSelected;

  @override
  List<Object?> get props => [
        index,
        isSelected,
      ];
}
