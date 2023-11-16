// ignore_for_file: must_be_immutable

part of 'order_tab_container_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///OrderTabContainer widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class OrderTabContainerEvent extends Equatable {}

/// Event that is dispatched when the OrderTabContainer widget is first created.
class OrderTabContainerInitialEvent extends OrderTabContainerEvent {
  @override
  List<Object?> get props => [];
}
