part of 'pages.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FirebaseUser firebaseUser = Provider.of<FirebaseUser>(context);

    if (firebaseUser == null) {
      if (!(prevPageEvent is GotoSplashPage)) {
        prevPageEvent = GotoSplashPage();
         context.bloc<PageBloc>().add(prevPageEvent);
      }
     
    } else {
      if (!(prevPageEvent is GotoMainPage)) {
        prevPageEvent = GotoMainPage();
        context.bloc<PageBloc>().add(GotoMainPage());
      }
      
    }
    return BlocBuilder<PageBloc, PageState>(
        builder: (_, pageState) => (pageState is OnSplashPage)
            ? SplashPage()
            : (pageState is OnLoginPage) ? SignInPage() : MainPage());
  }
}
