part of 'pages.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordCOntroller = TextEditingController();

  bool isEmailValid = false;
  bool isPasswordValid = false;
  bool isSigninValid = false;
  @override
  Widget build(BuildContext context) {
    context
        .bloc<ThemeBloc>()
        .add(ChangeTheme(ThemeData().copyWith(primaryColor: accentColor2)));
    return WillPopScope(
      onWillPop: (){
        context.bloc<PageBloc>().add(GotoSplashPage());
        return;
      },
          child: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: ListView(
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      height: 70,
                      child: Image.asset("assets/logo.png"),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 70, bottom: 40),
                      child: Text(
                        "Welcome Back \nExplore!",
                        style: blackTextFont.copyWith(fontSize: 20),
                      ),
                    ),
                    TextField(
                      onChanged: (text) {
                        setState(() {
                          isEmailValid = EmailValidator.validate(text);
                        });
                      },
                      controller: emailController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: "Email Address",
                        hintText: "Email Address",
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextField(
                      onChanged: (text) {
                        setState(() {
                          isPasswordValid = text.length >= 6;
                        });
                      },
                      controller: passwordCOntroller,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: "Password",
                        hintText: "Password",
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          "Forgot Password",
                          style: greyTextFont.copyWith(
                              fontSize: 12, fontWeight: FontWeight.w400),
                        ),
                        Text(
                          "Get Now",
                          style: purpleTextFont.copyWith(fontSize: 12),
                        ),
                      ],
                    ),
                    Center(
                      child: Container(
                        height: 50,
                        width: 50,
                        margin: EdgeInsets.only(top: 40, bottom: 30),
                        child: isSigninValid ? SpinKitFadingCircle(color: mainCOlor,) : FloatingActionButton(
                          elevation: 0,
                          child: Icon(
                            Icons.arrow_forward,
                            color: isEmailValid && isPasswordValid
                                ? Colors.white
                                : Color(0xFFBEBEBE),
                          ),
                          backgroundColor: isEmailValid && isPasswordValid
                              ? mainCOlor
                              : Color(0xFFE4E4E4),
                          onPressed: isEmailValid && isPasswordValid
                           ? () async {
                            setState(() {
                              isSigninValid = true;
                            });
                            SignInSignUpResult result = await AuthServices.signIn(emailController.text, passwordCOntroller.text);

                            if (result.user == null) {
                              setState(() {
                                isSigninValid = false;
                              });
                              Flushbar(
                                duration: Duration(seconds: 4),
                                flushbarPosition: FlushbarPosition.TOP,
                                backgroundColor: Color(0xFFFF5C83),
                                message: result.message,
                              )..show(context);
                            }
                          }
                        : null),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Start Fresh now?",
                          style:
                              greyTextFont.copyWith(fontWeight: FontWeight.w400),
                        ),
                        Text(
                          "Sign Up",
                          style: purpleTextFont,
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
