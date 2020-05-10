part of 'page_bloc.dart';

abstract class PageEvent extends Equatable {
  const PageEvent();
}

abstract class GotoSplashPage extends PageEvent {
  @override
  List<Object> get props => [];
}

abstract class GotoLoginPage extends PageEvent {
  @override
  List<Object> get props => [];
}

abstract class GotoMainPage extends PageEvent {
  @override
  List<Object> get props => [];
}

