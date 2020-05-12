part of 'page_bloc.dart';

abstract class PageEvent extends Equatable {
  const PageEvent();
}

 class GotoSplashPage extends PageEvent {
  @override
  List<Object> get props => [];
}

 class GotoLoginPage extends PageEvent {
  @override
  List<Object> get props => [];
}

 class GotoMainPage extends PageEvent {
  @override
  List<Object> get props => [];
}

