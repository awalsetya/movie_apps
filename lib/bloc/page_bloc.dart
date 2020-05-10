import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'page_event.dart';
part 'page_state.dart';

class PageBloc extends Bloc<PageEvent, PageState> {
  @override
  PageState get initialState => OnInitialPage();

  @override
  Stream<PageState> mapEventToState(
    PageEvent event,
  ) async* {
    if (event is GotoSplashPage) {
      yield OnSplashPage();
    }else if (event is GotoLoginPage) {
      yield OnLoginPage();
    }else if (event is GotoMainPage) {
      yield OnMainPage();
    }
  }
}
