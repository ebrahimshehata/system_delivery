import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Utils{
  void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ));

  void navigateAndFinish(
      context,
      widget,
      ) =>
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => widget,
        ),
            (Route<dynamic> route) => false,
      );

  static bool isKeyboardShowing() {
    if (WidgetsBinding.instance != null) {
      return WidgetsBinding.instance!.window.viewInsets.bottom > 0;
    } else {
      return false;
    }
  }

  static closeKeyboard(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  static void hideKeyboard(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }
}


/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    // ignore: missing_enum_constant_in_switch
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
              'you can reconfigure this by running the FlutterFire CLI again.',
        );
    }

    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAtV3xTGlOnjknj3nLJ3i_PVhW_X1A7Q3Q',
    appId: '1:325349139934:web:ea9374a7a03746a602694f',
    messagingSenderId: '325349139934',
    projectId: 'wecode-app',
    authDomain: 'wecode-app.firebaseapp.com',
    storageBucket: 'wecode-app.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDKNL3cIRlpIZ0cvmKevXOCGNiS-z58G6g',
    appId: '1:325349139934:android:6be185e03d5bf77702694f',
    messagingSenderId: '325349139934',
    projectId: 'wecode-app',
    storageBucket: 'wecode-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA0Z2w0zHYwZIgIThw7oWqvvV7cmbB3MYA',
    appId: '1:325349139934:ios:2aa76f6277a71b6402694f',
    messagingSenderId: '325349139934',
    projectId: 'wecode-app',
    storageBucket: 'wecode-app.appspot.com',
    iosClientId: '325349139934-266nfcgenf2tk66h6h6u2lunt6crm263.apps.googleusercontent.com',
    iosBundleId: 'app.w',
  );
}
class Auth {
// prop ..
  final _auth = FirebaseAuth.instance;

// Sign up ...
  Future<bool> signUp(String email, String password) async {
    await _auth.createUserWithEmailAndPassword(
        email: email, password: password);

    return true;
  }

// sign in ...
  Future<UserCredential> signIn(String email, String password) async {
    final userCredential = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    return userCredential;
  }

// logout ...

  Future<void> signOut() async {
    await _auth.signOut();
  }

// info
  void changePassword(String? password, Function() fun) async {
    if (password == null) {
      fun();
    } else {
      //Create an instance of the current user.
      final user = _auth.currentUser;
      //Pass in the password to updatePassword.
      user!.updatePassword(password).then((_) {
        debugPrint("Successfully changed password");
        Fluttertoast.showToast(
            msg: "Successfully changed password",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
        fun();
      }).catchError((error) {
        debugPrint("Password can't be changed" + error.toString());
        Fluttertoast.showToast(
            msg: "Password can't be changed + ${error.toString()}",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
        //This might happen, when the wrong password is in, the user isn't found, or if the user hasn't logged in recently.
      });
    }
  }

}
extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}
class CacheHelper {
  static SharedPreferences? sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool?> saveDate(
      {required String key, required dynamic value}) async {
    if (value is String) return await sharedPreferences?.setString(key, value);
    if (value is int) return await sharedPreferences?.setInt(key, value);
    if (value is bool) return await sharedPreferences?.setBool(key, value);

    return await sharedPreferences?.setDouble(key, value);
  }
}
class SlideRightRoute extends PageRouteBuilder<SlideRightRoute> {
  SlideRightRoute({required this.page})
      : super(
    pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        ) =>
    page,
    transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
        ) =>
        SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(-1, 0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        ),
  );
  final Widget page;
}
class SlideLeftRoute extends PageRouteBuilder<SlideLeftRoute> {
  SlideLeftRoute({required this.page})
      : super(
    pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        ) =>
    page,
    transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
        ) =>
        SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1, 0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        ),
  );
  final Widget page;
}
class SlideTopRoute extends PageRouteBuilder<SlideTopRoute> {
  SlideTopRoute({required this.page})
      : super(
    pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        ) =>
    page,
    transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
        ) =>
        SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, 1),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        ),
  );
  final Widget page;
}
class SlideBottomRoute extends PageRouteBuilder<SlideBottomRoute> {
  SlideBottomRoute({required this.page})
      : super(
    pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        ) =>
    page,
    transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
        ) =>
        SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, -1),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        ),
  );
  final Widget page;
}
class Validator {
  static String? email(String? value) {
    if (value!.isEmpty)
      return 'Email Empty!';
    else if (!value.contains('@') || !value.contains('.com'))
      return 'EX: example@example.com';
  }

  static String? password(String? value) {
    if (value!.isEmpty)
      return 'Password Empty!';
    else if (value.length < 8) return 'Password must be at least 8 digit';
  }

  static String? phoneNumber(String? value) {
    if (value!.isEmpty) return 'Phone Number Empty';
  }
  static String? name(String? value) {
    if (value!.isEmpty) return 'Name is Empty';
  }
//  static String? confirmEmail(String? value) {
//     if (value!== em) return 'Phone Number Empty';
//   }


}
class AppTheme {

  static const TextStyle display1 = TextStyle(
    fontFamily: 'WorkSans',
    color: Colors.black,
    fontSize: 38,
    fontWeight: FontWeight.w600,
    letterSpacing: 1.2,
  );

  static const TextStyle display2 = TextStyle(
    fontFamily: 'WorkSans',
    color: Colors.black,
    fontSize: 32,
    fontWeight: FontWeight.normal,
    letterSpacing: 1.1,
  );

  static final TextStyle heading = TextStyle(
    fontFamily: 'WorkSans',
    fontWeight: FontWeight.w900,
    fontSize: 34,
    color: Colors.white.withOpacity(0.8),
    letterSpacing: 1.2,
  );

  static final TextStyle subHeading = TextStyle(
    inherit: true,
    fontFamily: 'WorkSans',
    fontWeight: FontWeight.w500,
    fontSize: 24,
    color: Colors.white.withOpacity(0.8),
  );
}
class MyThemes {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
    primarySwatch: Colors.blue,
    buttonColor: Colors.blue,
    cardColor: Colors.blue[100],
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
  );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
    brightness: Brightness.dark,
    cardColor: Color(0xFF1D2740),
    canvasColor: Color(0xFF0B1328),
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
    appBarTheme: AppBarTheme(
      color: Color(0xFF1D2740),
    ),
    buttonColor: Color(0xFF3172F5),
  );
}
class RatingBar extends StatelessWidget {
  RatingBar({
    Key? key,
    this.maxRating = 5,
    required this.rating,
    this.filledColor = Colors.amber,
    this.emptyColor = Colors.grey,
    required this.halfFilledColor,
    this.size = 16,
  })  : assert(maxRating != null),
        assert(size != null),
        super(key: key);

  final int maxRating;
  final double rating;
  final IconData filledIcon = Icons.star;
  final IconData emptyIcon = Icons.star_border;
  final IconData halfFilledIcon = Icons.star_half;
  final Color filledColor;
  final Color emptyColor;
  final Color halfFilledColor;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        maxRating,
            (index) {
          return buildIcon(context, index + 1);
        },
      ),
    );
  }

  Widget buildIcon(BuildContext context, int position) {
    IconData iconData = filledIcon;
    Color color = filledColor;
    if (position > rating + 0.5) {
      iconData = emptyIcon;
      color = emptyColor;
    } else if (position == rating + 0.5) {
      iconData = halfFilledIcon;
    }
    return Icon(iconData, color: color, size: size);
  }
}

/*
class UserApi {
  final CollectionReference userCollection =
  FirebaseFirestore.instance.collection('Users');

//get my user
  Stream<DocumentSnapshot> get getUserById {
    return userCollection.doc(FirebaseAuth.instance.currentUser!.uid).snapshots();
  }


  Stream<UserModel> get getCurrentUser {
    return userCollection
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .snapshots()
        .map((event) => UserModel.fromJson(event.data()));
  }

  Stream<List<UserModel>> get getLiveUsers {
    return userCollection
        .snapshots()
        .map(UserModel(email: '').fromQuery);
  }

//upload Image method
  Future uploadImageToStorage({required File file, String? id}) async {
    firebase_storage.Reference ref =
    firebase_storage.FirebaseStorage.instance.ref('images/$id.png');

    firebase_storage.UploadTask task = ref.putFile(file);

    // We can still optionally use the Future alongside the stream.
    try {
      //update image
      await task;
      String url = await FirebaseStorage.instance
          .ref('images/$id.png')
          .getDownloadURL();

      return url;
    } on firebase_storage.FirebaseException catch (e) {
      if (e.code == 'permission-denied') {
        print('User does not have permission to upload to this reference.');
      }
    }
  }

//updateUserData
  Future<void> updateUserData({required UserModel user}) async {
    return await userCollection.doc(user.uId).set(user.toJson());
  }

}
class _GoogleSignInButtonState extends State<GoogleSignInButton> {
  bool _isSigningIn = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: _isSigningIn
          ? const CircularProgressIndicator(
        color: Colors.orange,
      )
          : OutlinedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.white),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
          ),
        ),
        onPressed: () async {
          setState(() {
            _isSigningIn = true;
          });

          User? user = await Authentication.googleLogin(context: context);
          if (mounted) {
            setState(() {
              _isSigningIn = false;
            });
          }
          if (user != null) {
            // Navigator.of(context).pushReplacementNamed(HomePage.routeName,);
          }
        },
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Image(
                image: AssetImage("assets/images/google_icon.png"),
                height: 35.0,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  'Sign in with Google',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black54,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
class GoogleSignInButton extends StatefulWidget {
  const GoogleSignInButton({Key? key}) : super(key: key);

  @override
  _GoogleSignInButtonState createState() => _GoogleSignInButtonState();
}
class AdState {
  AdState(this.initialization);
  Future<InitializationStatus> initialization;

  // String get bannerAdUnitId => Platform.isAndroid?'ca-app-pub-1408860275796619~7877036507':'';
  String get bannerAdUnitId => 'ca-app-pub-3940256099942544/6300978111';

  AdListener get adListener => _adListener;

  final AdListener _adListener = AdListener(
    onAdLoaded: (Ad ad) => debugPrint('Ad loaded: ${ad.adUnitId}'),
    onAdClosed: (Ad ad) => debugPrint('Ad closed: ${ad.adUnitId}'),
    onAdFailedToLoad: (Ad ad, LoadAdError error) => debugPrint('Ad failed: ${ad.adUnitId}, $error'),
    onAdOpened: (Ad ad) => debugPrint('Ad opener: ${ad.adUnitId}'),
  );
}
class Store {
// props ...
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

// methods ...
  addProduct(Product product) async {
    await _firestore.collection(kProductCollection).add({
      kProductName: product.pName,
      kProductPrice: product.pPrice,
      kProductDescription: product.pDescription,
      kProductCategory: product.pcategory,
      kProductLocation: product.pLocation,
    });
  }

//.........................................................
  Stream<QuerySnapshot> loadProducts() {
    return _firestore.collection(kProductCollection).snapshots();
  }

//.........................................................
  deleteProduct(documentID) async {
    await _firestore.collection(kProductCollection).doc(documentID).delete();
  }

//.........................................................
  editProduct(productID, data) async {
    await _firestore.collection(kProductCollection).doc(productID).update(data);
  }

//.........................................................
  storeOrders(data, List<Product> products) async {
    var documentRef = _firestore.collection(kOrdersCollection).doc();
    documentRef.set(data);

    for (var product in products) {
      await documentRef.collection(kOrderDetailsCollection).doc().set({
        kProductName: product.pName,
        kProductPrice: product.pPrice,
        kProductLocation: product.pLocation,
        kProductQuantity: product.quantity,
      });
    }
  }

//.........................................................
  Stream<QuerySnapshot> loadOrders() {
    return _firestore.collection(kOrdersCollection).snapshots();
  }
// ******************* CLASS END *****************************
}
class DownloadFromUrl extends StatefulWidget {
  DownloadFromUrl({Key? key}) : super(key: key);

  @override
  State<DownloadFromUrl> createState() => _DownloadFromUrlState();
}
class _DownloadFromUrlState extends State<DownloadFromUrl> {
  Uint8List? uint8list;
  Future getResponse() async {
    final responseData = await http
        .get(Uri.parse("https://www.xnview.com/img/app-xnsoft-360.png"));
    uint8list = responseData.bodyBytes;
    File? file;
    final a1 = "/storage/emulated/0/Download/demoTextFile.png";

    File(a1).writeAsBytesSync(uint8list!);
    // final dir = await getdoc();
    // print(dir?.path);
    // return dir?.path;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: ElevatedButton(
            onPressed: () {
              getResponse().then((value) {
                uint8list == null ? Text("No Image Found") : print(uint8list!);
                setState(() {});
              });
            },
            child:
            uint8list == null ? Text("Download") : Image.memory(uint8list!),
          ),
        ),
      ),
    );
  }
}
class InputValidators {
  bool emailValidator(
      {required String email, required BuildContext context}) {
    const String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    final RegExp _regExp = RegExp(pattern);

    if (email.isEmpty || email == null) {
      showErrorDialog(
        context: context,
        errorMessage: 'Please fill the Email',
      );
      return false;
    } else if (!_regExp.hasMatch(email)) {
      showErrorDialog(
        errorMessage: 'Please enter a valid email.',
        context: context,
      );
      return false;
    }
    return true;
  }

  bool passwordValidator(
      {@required String password, @required BuildContext context}) {
    if (password.isEmpty || password == null) {
      showErrorDialog(
        context: context,
        errorMessage: 'Please fill the Password',
      );
      return false;
    } else if (password.length < 6) {
      showErrorDialog(
        errorMessage: 'Minimum length of password should be 6 characters.',
        context: context,
      );
      return false;
    }
    return true;
  }

  bool confirmPasswordValidator({
    @required String password,
    @required String confirmPassword,
    @required BuildContext context,
  }) {
    if (confirmPassword.isEmpty || confirmPassword == null) {
      showErrorDialog(
        context: context,
        errorMessage: 'Please fill the confirm password',
      );
      return false;
    } else if (confirmPassword.length < 6) {
      showErrorDialog(
        errorMessage: 'Minimum length of password should be 6 characters.',
        context: context,
      );
      return false;
    } else if (password != confirmPassword) {
      showErrorDialog(
        errorMessage: "Password doesn't match, Please try again.",
        context: context,
      );
      return false;
    }
    return true;
  }

  bool nameValidator(String name, BuildContext context) {
    if (name.isEmpty || name == null) {
      showErrorDialog(errorMessage: 'Please fill a name', context: context);
      return false;
    } else {
      return true;
    }
  }

  bool phoneNumberValidator(String phoneNumber, BuildContext context) {
    if (phoneNumber.isEmpty || phoneNumber == null) {
      showErrorDialog(
          errorMessage: 'Please fill a Phone Number', context: context);
      return false;
    } else if (phoneNumber.length != 10) {
      showErrorDialog(
        errorMessage: 'Length of phone number must be equal to 10',
        context: context,
      );
      return false;
    } else {
      return true;
    }
  }
}

class StripeTransactionResponse {
  String message;
  bool success;
  StripeTransactionResponse({required this.message, required this.success});
}
class CreditCard {}
class StripeService {
  static String apiBase = 'https://api.stripe.com/v1';
  static Uri paymentApiUrl = Uri.parse('https://api.stripe.com/v1/payment_intents');
  static String secret =
      'sk_test_51Kc85hHQzMPK5sWEriyOzwhAjVMpw8UZlygCAZT6y1YF6KJngVblHJj5g4OhOuC6rOcBhL9C4aikkVTUzlWby55M00R5pKEJ02';
  static Map<String, String> headers = {
    'Authorization': 'Bearer ${StripeService.secret}',
    'Content-Type': 'application/x-www-form-urlencoded',
  };
  static Map<String, dynamic>? paymentIntentData;

  static init() {
    Stripe.publishableKey =
    'pk_test_51Kc85hHQzMPK5sWEUUNeBXQNl6pyrqSDrJpaZ2ndO1jGSp9INyPEIvGCdOPLrZx8WroJCiz7nFVFfUd5GjT2nUaj00TCDLmfNk';
  }

  static Future<void> payWithNewCard(context) async {
    try {
      paymentIntentData =
      await createPaymentIntent('20', 'USD'); //json.decode(response.body);
      // print('Response body==>${response.body.toString()}');
      await Stripe.instance
          .initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
              paymentIntentClientSecret:
              paymentIntentData!['client_secret'],
              applePay: true,
              googlePay: true,
              testEnv: true,
              style: ThemeMode.dark,
              merchantCountryCode: 'US',
              merchantDisplayName: 'ANNIE'))
          .then((value) {});

      ///now finally display payment sheeet
      displayPaymentSheet(context);
    } catch (e, s) {
      print('exception:$e$s');
    }
  }

  static displayPaymentSheet(context) async {
    try {
      await Stripe.instance.presentPaymentSheet(
          parameters: PresentPaymentSheetParameters(
            clientSecret: paymentIntentData!['client_secret'],
            confirmPayment: true,
          ))
          .then((newValue) {
        print('payment intent' + paymentIntentData!['id'].toString());
        print(
            'payment intent' + paymentIntentData!['client_secret'].toString());
        print('payment intent' + paymentIntentData!['amount'].toString());
        print('payment intent' + paymentIntentData.toString());
        //orderPlaceApi(paymentIntentData!['id'].toString());
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("paid successfully")));

        paymentIntentData = null;
      }).onError((error, stackTrace) {
        print('Exception/DISPLAYPAYMENTSHEET==> $error $stackTrace');
      });
    } on StripeException catch (e) {
      print('Exception/DISPLAYPAYMENTSHEET==> $e');
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
            content: Text("Cancelled "),
          ));
    } catch (e) {
      print('$e');
    }
  }

//  Future<Map<String, dynamic>>
  static createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': calculateAmount('20'),
        'currency': currency,
        'payment_method_types[]': 'card'
      };
      print(body);
      var response = await http.post(
          paymentApiUrl,
          body: body,
          headers: headers);
      print('Create Intent reponse ===> ${response.body.toString()}');
      return jsonDecode(response.body);
    } catch (err) {
      print('err charging user: ${err.toString()}');
    }
  }

  static calculateAmount(String amount) {
    final a = (int.parse(amount)) * 100;
    return a.toString();
  }

}
class Helper{/*  getDoctorProfilePic(String? imgString) {
    if (imgString == null || imgString == '' || imgString == 'null') {
      return '';
    } else {
      return dynamicImageGetApi + imgString;
    }
  }

  getCount(int number) {
    String count = '0';
    if (number < 1000) {
      count = '$number';
    } else if (number < 1000000) {
      var counInK = (number / 1000).toStringAsFixed(2);
      count = '$counInK K';
    } else if (number < 1000000000) {
      var countInM = (number / 1000000).toStringAsFixed(2);
      count = '$countInM';
    }
    return count;
  }

  getImage(String? imgString) {
    if (imgString == null || imgString == '' || imgString == 'null') {
      return '';
    } else {
      return dynamicImageGetApi + imgString;
    }
  }

  convertDoctorPic(String pathstring) {
    return pathstring.substring(pathstring.indexOf('wwwroot/'));
  }

  generateUid() {
    var uuid = Uuid();
    String uid = uuid.v1();
    var rng = Random();
    var code = rng.nextInt(900000) + 100000;
    var time = DateTime.now().millisecondsSinceEpoch;
    return "$uid-$code-$time";
  }

  getAge(String dob) {
    DateTime dobdate = DateTime.parse(dob);
    DateTime dateToday = DateTime.now();
    int years = dateToday.difference(dobdate).inDays ~/ 365;
    return years.toString();
  }

  getDataAndTime(DateTime date) {
    // var dateTime = '2021-08-08T13:05:00';

    var year = date.year;
    var month = date.month;
    var day = date.day;
    var newMonth = month < 10 ? '0$month' : '$month';
    var newDay = day < 10 ? '0$day' : '$day';

    var newDate = '$year-$newMonth-$newDay';
    var hour = date.hour;
    var minute = date.minute;
    var amPm = hour >= 12 ? 'PM' : 'AM';
    hour = hour > 12 ? hour - 12 : hour;
    var newHour = hour < 10 ? '0$hour' : '$hour';
    var newMinute = minute < 10 ? '0$minute' : '$minute';
    var newTime = '$newHour:$newMinute $amPm';

    var newDateTime = '$newDate, $newTime';
    return newDateTime;
  }

  Future<int> getDoctorMemberId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt('doctorMemberId') ?? 0;
  }

  Future<String> getDoctorPhone() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('doctorPhone') ?? '';
  }

  Future<int> getValidityDays() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt('ValidityDaysLeft') ?? 0;
  }

  Future<int> getPatientId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt('patientId') ?? 0;
  }

  Future<String> getPatientPhone() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('patientPhone') ?? '';
  }

  getTimeNow() {
    String timeString = DateTime.now().toString();
    String timNow = timeString.substring(0, timeString.indexOf('.') + 4);
    return timNow;
  }

  getValidDateTime(String timeString) {
    String timNow = timeString.substring(0, timeString.indexOf('.') + 4);
    return timNow;
  }

  testDate(var time) {
    return DateFormat('dd-MM-yyyy').parse(time);
  }

  getCustomDateLocal(var dateTime) {
    if (dateTime == '') {
      return '';
    }
    DateTime time = DateTime.parse(dateTime);
    String month = getMonthName(time.month);
    int day = time.day;
    int year = time.year;
    String newDay = day < 10 ? '0$day' : '$day';

    var hour = time.hour;
    var minute = time.minute;
    var amPm = hour >= 12 ? 'PM' : 'AM';
    hour = hour > 12 ? hour - 12 : hour;
    var newHour = hour < 10 ? '0$hour' : '$hour';
    var newMinute = minute < 10 ? '0$minute' : '$minute';
    var newTime = '$newHour:$newMinute $amPm';

    String newDate = '$newDay $month $year';

    return '$newDate, $newTime';
  }

  getCustomDate(String date) {
    if (date == '') {
      return '';
    }
    DateTime time = DateTime.parse(date);
    String month = getMonthName(time.month);
    int day = time.day;
    int year = time.year;
    String newDay = day < 10 ? '0$day' : '$day';

    String newDate = '$newDay $month $year';

    return '$newDate';
  }

  getTimeAgo(String time) {
    DateTime dbDate = DateTime.parse(time);
    final currDate = DateTime.now();

    var difference = currDate.difference(dbDate).inMinutes;

    if (difference < 1) {
      return "Just Now";
    } else if (difference < 60) {
      return "$difference min ago";
    } else if (difference < 1440) {
      return "${(difference / 60).toStringAsFixed(0)} hr ago";
    } else if (difference < 43200) {
      return "${(difference / 1440).toStringAsFixed(0)} days ago";
    } else if (difference < 518400) {
      return "${(difference / 43200).toStringAsFixed(0)} days ago";
    }
  }

  getDate(String date) {
    DateTime time = DateTime.parse(date);
    int month = time.month;
    int day = time.day;
    int year = time.year;
    String newDay = day < 10 ? '0$day' : '$day';
    String newMonth = month < 10 ? '0$month' : '$month';

    String newDate = '$newDay-$newMonth-$year';

    return '$newDate';
  }

  getMonthName(int monthNum) {
    String month = '';

    switch (monthNum) {
      case 1:
        month = 'Jan';
        break;
      case 2:
        month = 'Feb';
        break;
      case 3:
        month = 'Mar';
        break;
      case 4:
        month = 'Apr';
        break;
      case 5:
        month = 'May';
        break;
      case 6:
        month = 'Jun';
        break;
      case 7:
        month = 'July';
        break;
      case 8:
        month = 'Aug';
        break;
      case 9:
        month = 'Sep';
        break;
      case 10:
        month = 'Oct';
        break;
      case 11:
        month = 'Nov';
        break;
      case 12:
        month = 'Dec';
        break;
      default:
        month = '';
        break;
    }

    return month;
  }

  Future<String> createFileFromString(String imageString) async {
    if (imageString == '') {
      return '';
    } else {
      final encodedStr = "$imageString";
      Uint8List bytes = base64.decode(encodedStr);
      String dir = (await getApplicationDocumentsDirectory()).path;
      File file = File(
          "$dir/" + DateTime.now().millisecondsSinceEpoch.toString() + ".pdf");
      await file.writeAsBytes(bytes);
      return file.path;
    }
  }
  bool isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  DateTime normalizedDate(DateTime value) {
    return DateTime.utc(value.year, value.month, value.day, 12);
  }

  static Future<int> getBuildNumber() async {
    return int.tryParse((await PackageInfo.fromPlatform()).buildNumber);
  }

  static Future<String> getAppVersion() async {
    return "${(await PackageInfo.fromPlatform()).version}-${WalletApp.buildTarget == BuildTargets.dev ? "dev" : "beta"}.${(await PackageInfo.fromPlatform()).buildNumber.substring((await PackageInfo.fromPlatform()).buildNumber.length - 1)}";
  }

  static String currencySymbol(String priceCurrency) {
    switch (priceCurrency) {
      case "USD":
        return "\$";
      case "CNY":
        return "￥";
      default:
        return "\$";
    }
  }

  //untuk separator angka
  static var format = new NumberFormat.currency(decimalDigits: 0,
      symbol: "");

  //daripada kita buat loading pada screen terus
  //lebih baik kita jadikan fungsi supaya tidak menulis kembali ulang kode...
  Widget buildLoading(){
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget buildMessage(IconData iconData,String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              iconData,
              color: Colors.grey,
              size: 70,
            ),
            Text(
              message,
              style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }

  */}
class SizeConfig {
  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;
  static double defaultSize;
  static Orientation orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
  }
}
class AuthService extends ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  GeneralUser? generalUser;
  String? theError;

  //a void func to set the error message
  void setTheError(String? err) {
    theError = err;
    notifyListeners();
  }

  // a void func which updates the value of the generalUser
  void setTheGeneralUser(GeneralUser theGUser) {
    generalUser = theGUser;
    notifyListeners();
  }

  Future<bool> fetchUserInfo(String uid) async {
    DocumentSnapshot _userSnap =
    await _firebaseFirestore.collection('users').doc(uid).get();
    if (_userSnap.exists) {
      //map the data to a general_user data model
      GeneralUser _generalUser =
      GeneralUser.fromMap(_userSnap.data() as Map<String, dynamic>);
      setTheGeneralUser(_generalUser);
      return true;
    } else {
      return false;
    }
  }

  User? theUser = FirebaseAuth
      .instance.currentUser; //to have the current user as the initial value

  void setTheUser(User? user) {
    theUser = user;
    notifyListeners();
  }

//method to register the user using emaoil and password
// todo error handling
  Future<UserCredential?> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential theUserCredentials = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      setTheUser(theUserCredentials.user);
      setTheError(null);
      return theUserCredentials;
    } on FirebaseAuthException catch (e) {
      setTheError(e.message);
    }
  }

//method to login the user using email and password
// error handling
  Future<UserCredential?> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential theUserCredentials = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      setTheUser(theUserCredentials.user);
      setTheError(null);
      return theUserCredentials;
    } on FirebaseAuthException catch (err) {
      setTheError(err.message!);
      debugPrint("==========>>>>>>" + err.message!);
    }
  }

  // logout method
  logOut() async {
    await _firebaseAuth.signOut();
    setTheUser(null);
  }

  Stream<User?> get authStatusChanges => _firebaseAuth.authStateChanges();
}
class AuthHandler extends StatelessWidget {
  AuthHandler({Key? key}) : super(key: key);

  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    //todo get the value of the current user

    //if the user exists in the database(using uid) =>
    //if the user exists in the database but the isCompletedProfile != true ? return the create profile

    //else if the user isTeacher == true return the teacherScreen

    // else return the students screen

    //if user doesnt exist in the database => return create profile screem

    User? user = Provider.of<AuthService>(context, listen: true)
        .theUser; //firebase auth user

    //checking with the firebase auth service for user
    if (user != null) {
      return Scaffold(
        backgroundColor: Colors.amber,
        // appBar: AppBar(title: Text('AuthHandler'), actions: [
        //   IconButton(
        //       onPressed: () {
        //         Provider.of<AuthService>(context, listen: false).logOut();
        //       },
        //       icon: Icon(Icons.logout)),
        // ]),
        body: FutureBuilder(
          future: Provider.of<AuthService>(context, listen: false)
              .fetchUserInfo(user.uid),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            } else if (snapshot.data == null) {
              return Text('empty');
            } else if (snapshot.data == false) {
              return CreateProfileScreen();
            } else if (snapshot.data == true &&
                Provider.of<AuthService>(context)
                    .generalUser!
                    .isCompletedProfile ==
                    false) {
              return CreateProfileScreen();
            } else if (snapshot.data == true &&
                Provider.of<AuthService>(context)
                    .generalUser!
                    .isCompletedProfile ==
                    true) {
              //is teacher  or is student
              if (Provider.of<AuthService>(context).generalUser!.isTeacher ==
                  true) {
                // return Text('66');
                return TrainersScreenView(); // change it to trainer
              } else {
                // return Text('69');
                return StudentScreen();
              }
            }

            return StudentScreen();
          },
        ),
      );
    } else {
      return HomeScreenView(); //main screen for non authenticates users
    }
  }
}
class DatabaseService {

  //upload Image method
  Future uploadImageToStorage({required File file, String? id}) async {
    firebase_storage.Reference ref =
    firebase_storage.FirebaseStorage.instance.ref('images/$id.png');

    firebase_storage.UploadTask task = ref.putFile(file);

    // We can still optionally use the Future alongside the stream.
    try {
      //update image
      await task;
      String url = await FirebaseStorage.instance
          .ref('images/${id}.png')
          .getDownloadURL();

      return url;
    } on firebase_storage.FirebaseException catch (e) {
      if (e.code == 'permission-denied') {
        print('User does not have permission to upload to this reference.');
      }
    }
  }
}
class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user obj based on firebase user
  UserModel _userFromFirebaseUser(User user) {
    return UserModel( uId: '', userType: '', password: '', isEmailVerified: null, bio: '', email: '', name: '', cover: '', phone: '', image: '');
  }

  // auth change user stream
  Stream<User?> get user {
    return _auth.authStateChanges();
  }

  // sign in with email and password
  Future signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Fluttertoast.showToast(
            msg: "No user found for that Email",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      } else if (e.code == 'wrong-password') {
        Fluttertoast.showToast(
            msg: "Wrong password provided for that user.",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }
  }

  // register with email and password
  Future registerWithEmailAndPassword(
      {required UserModel newUser}) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: '${newUser.email}', password: newUser.password!);

      User fbUser = result.user!;
      newUser.uId = fbUser.uid;
      await UserApi().updateUserData(user: newUser);

      return _userFromFirebaseUser(fbUser);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Fluttertoast.showToast(
            msg: "The password provided is too weak.",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      } else if (e.code == 'email-already-in-use') {
        Fluttertoast.showToast(
            msg: "The account already exists for that email.",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void changePassword(String? password, Function() fun) async {
    if (password == null) {
      fun();
    } else {
      //Create an instance of the current user.
      final user = _auth.currentUser;
      //Pass in the password to updatePassword.
      user!.updatePassword(password).then((_) {
        debugPrint("Successfully changed password");
        Fluttertoast.showToast(
            msg: "Successfully changed password",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
        fun();
      }).catchError((error) {
        debugPrint("Password can't be changed" + error.toString());
        Fluttertoast.showToast(
            msg: "Password can't be changed + ${error.toString()}",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
        //This might happen, when the wrong password is in, the user isn't found, or if the user hasn't logged in recently.
      });
    }
  }

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (error) {
      debugPrint(error.toString());
      return null;
    }
  }
}
class FirebaseService {
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  User? user = FirebaseAuth.instance.currentUser;
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  Future<String> uploadImage(XFile? file, String? reference) async {
    File _file = File(file!.path);
    firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
        .ref(reference);
    await ref.putFile(_file);
    String downloadURL = await ref.getDownloadURL();
    return downloadURL;
  }
  Future<void> addUser({Map<String, dynamic>? data}) {
    return users
        .doc(user!.uid)
        .set(data)
        .then((value) => print("User Register Successfully"))
        .catchError((error) => print("Failed to Register User: $error"));
  }
  Future uploadFile({File? image, String? reference,}) async {
    firebase_storage.Reference storageReference = storage.ref().child(
        '$reference/${DateTime
            .now()
            .microsecondsSinceEpoch}');
    firebase_storage.UploadTask uploadTask = storageReference.putFile(image!);
    await uploadTask;
    return storageReference.getDownloadURL();
  }
  Future<String?> uploadMediaToStorage(File filePath,
      {required String reference}) async {
    try {
      String? downLoadUrl;

      final String fileName =
          '${FirebaseAuth.instance.currentUser!.uid}${DateTime.now().day}${DateTime.now().month}${DateTime.now().year}${DateTime.now().hour}${DateTime.now().minute}${DateTime.now().second}${DateTime.now().millisecond}';

      final Reference firebaseStorageRef =
      FirebaseStorage.instance.ref(reference).child(fileName);

      print('Firebase Storage Reference: $firebaseStorageRef');

      final UploadTask uploadTask = firebaseStorageRef.putFile(filePath);

      await uploadTask.whenComplete(() async {
        print("Media Uploaded");
        downLoadUrl = await firebaseStorageRef.getDownloadURL();
        print("Download Url: $downLoadUrl}");
      });

      return downLoadUrl!;
    } catch (e) {
      print("Error: Firebase Storage Exception is: ${e.toString()}");
      return null;
    }
  }
}
// Get the proportionate height as per screen size
double getProportionateScreenHeight(double inputHeight) {
  double screenHeight = SizeConfig.screenHeight;
  // 812 is the layout height that designer use
  return (inputHeight / 812.0) * screenHeight;
}

// Get the proportionate width as per screen size
double getProportionateScreenWidth(double inputWidth) {
  double screenWidth = SizeConfig.screenWidth;
  // 375 is the layout width that designer use
  return (inputWidth / 375.0) * screenWidth;
}

class SQLHelper {
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE items(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        username TEXT,
        password TEXT,
        createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
      )
      """);
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'login.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }

  // Create new user (login)
  static Future<int> createItem(String username, String password) async {
    final db = await SQLHelper.db();

    final data = {'username': username, 'password': password};
    final id = await db.insert('items', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  // Read all users (login)
  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await SQLHelper.db();
    return db.query('items', orderBy: "id");
  }

  // Read a single item by id
  // The app doesn't use this method but I put here in case you want to see it
  static Future<List<Map<String, dynamic>>> getItem(int id) async {
    final db = await SQLHelper.db();
    return db.query('items', where: "id = ?", whereArgs: [id], limit: 1);
  }

  // Update an user by id
  static Future<int> updateItem(
      int id, String title, String? description) async {
    final db = await SQLHelper.db();

    final data = {
      'username': title,
      'password': description,
      'createdAt': DateTime.now().toString()
    };

    final result =
    await db.update('items', data, where: "id = ?", whereArgs: [id]);
    return result;
  }

  // Delete user
  static Future<void> deleteItem(int id) async {
    final db = await SQLHelper.db();
    try {
      await db.delete("items", where: "id = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint("Something went wrong when deleting an item: $err");
    }
  }
}

class TimeHelper {
  TimeHelper._();
  static String convertTimeLastUpdate(String dataTime) =>
      DateFormat('hh:mm dd-MM-yyyy')
          .format(DateTime.parse(dataTime).add(new Duration(hours: 7)));
}

class CustomTimerPainter extends CustomPainter {
  CustomTimerPainter({
    required this.total,
    required this.current,
    required this.backgroundColor,
    required this.color,
  });

  final double total;
  final int current;
  final Color backgroundColor, color;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = backgroundColor
      ..strokeWidth = 10.0
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;
    canvas.drawCircle(size.center(Offset.zero), size.width / 2.0, paint);
    paint.color = color;
    double progress =
        (current == total ? 1 : (total - current) / total) * 2 * math.pi;
    Offset center = new Offset(size.width / 2, size.height / 2);
    double radius = math.min(size.width / 2, size.height / 2);
    canvas.drawArc(
      new Rect.fromCircle(center: center, radius: radius),
      math.pi * 1.5,
      progress,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomTimerPainter old) {
    return (total != old.total ||
        current != old.current ||
        color != old.color ||
        backgroundColor != old.backgroundColor);
  }
}

class CountDownTimer extends StatelessWidget {
  final double total;
  final int current, bpm;
  final double fontSize;
  final double width, height;
  final Color bgColor, color, textColor;

  CountDownTimer({
    this.total,
    this.current,
    this.width = 200,
    this.height = 200,
    this.fontSize = 32.0,
    this.bgColor,
    this.color,
    this.textColor,
    this.bpm,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            SizedBox(
              width: width - 10.0,
              height: height - 10.0,
              child: CustomPaint(
                painter: CustomTimerPainter(
                  total: total,
                  current: current,
                  backgroundColor: bgColor,
                  color: color,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "$current",
                  style: TextStyle(
                    fontSize: fontSize,
                    color: textColor,
                  ),
                ),
                Divider(),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  if (bpm > 30 && bpm < 150)
                    Text(
                      "BPM ",
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                  Text(
                    (bpm > 30 && bpm < 150 ? bpm.toString() : "--"),
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                ]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Api {
  Future<dynamic> get({required String url, @required String? token}) async {
    Map<String, String> headers = {};

    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    http.Response response = await http.get(Uri.parse(url), headers: headers);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          'there is a problem with status code ${response.statusCode}');
    }
  }

  Future<dynamic> post(
      {required String url,
        @required dynamic body,
        @required String? token}) async {
    Map<String, String> headers = {};

    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    http.Response response =
    await http.post(Uri.parse(url), body: body, headers: headers);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);

      return data;
    } else {
      throw Exception(
          'there is a problem with status code ${response.statusCode} with body ${jsonDecode(response.body)}');
    }
  }

  Future<dynamic> put(
      {required String url,
        @required dynamic body,
        @required String? token}) async {
    Map<String, String> headers = {};
    headers.addAll({'Content-Type': 'application/x-www-form-urlencoded'});
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }

    print('url = $url body = $body token = $token ');
    http.Response response =
    await http.put(Uri.parse(url), body: body, headers: headers);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      print(data);
      return data;
    } else {
      throw Exception(
          'there is a problem with status code ${response.statusCode} with body ${jsonDecode(response.body)}');
    }
  }
}

abstract class NetworkInfo {
  Future<bool> get isConnected;
}
class NetworkInfoImpl implements NetworkInfo {
  final DataConnectionChecker connectionChecker;

  NetworkInfoImpl(this.connectionChecker);

  @override
  Future<bool> get isConnected => connectionChecker.hasConnection;
}

class NavigationService {
  late GlobalKey<NavigatorState> key;

  static NavigationService instance = NavigationService();
  static NavigationService adminInstance = NavigationService();
  static NavigationService userInstance = NavigationService();



  NavigationService() {
    key = GlobalKey<NavigatorState>();
  }

  Future<dynamic> navigateToReplacement(String _rn) {
    return key.currentState!.pushReplacementNamed(_rn);
  }

  Future<dynamic> navigateTo(String _rn) {
    return key.currentState!.pushNamed(_rn);
  }

  Future<dynamic> navigateToRoute(MaterialPageRoute _rn) {
    return key.currentState!.push(_rn);
  }

  Future<dynamic> navigateToWidget(Widget _rn) {
    return key.currentState!.push(MaterialPageRoute(builder: (_) => _rn));
  }

  goBack() {
    return key.currentState!.pop();
  }

  void pushReplacement(String newRouteName) {
    bool isNewRouteSameAsCurrent = false;

    key.currentState!.popUntil((route) {
      if (route.settings.name == newRouteName) {
        isNewRouteSameAsCurrent = true;
      }
      return true;
    });
    if (!isNewRouteSameAsCurrent) {
      key.currentState!.pushNamedAndRemoveUntil(newRouteName, (Route<dynamic> route) => false);
    }
  }
}

class MyBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    print('onCreate -- ${bloc.runtimeType}');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('onChange -- ${bloc.runtimeType}, $change');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print('onError -- ${bloc.runtimeType}, $error');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    print('onClose -- ${bloc.runtimeType}');
  }
}

const String _kNotificationChannelId = 'ScheduledNotification';
const String _kNotificationChannelName = 'Scheduled Notification';
const String _kNotificationChannelDescription = 'Pushes a notification at a specified date';
Future scheduleNotification(TodoEntity todo) async {
  final notificationDetails = NotificationDetails(
    AndroidNotificationDetails(
      _kNotificationChannelId,
      _kNotificationChannelName,
      _kNotificationChannelDescription,
      importance: Importance.Max,
      priority: Priority.High,
    ),
    IOSNotificationDetails(),
  );

  await notificationManager.schedule(
    _dateToUniqueInt(todo.addedDate),
    todo.name,
    !isBlank(todo.description) ? todo.description : todo.bulletPoints.map((b) => '- ${b.text}').join('    '),
    todo.notificationDate,
    notificationDetails,
    payload: todo.addedDate.toIso8601String(),
  );
}
void cancelNotification(TodoEntity todo) async {
  final id = _dateToUniqueInt(todo.addedDate);
  await notificationManager.cancel(id);
}
int _dateToUniqueInt(DateTime date) {
  return date.year * 10000 + date.minute * 100 + date.second;
}

class Device {
  static double devicePixelRatio = ui.window.devicePixelRatio;
  static ui.Size size = ui.window.physicalSize;
  static double width = size.width;
  static double height = size.height;
  static double screenWidth = width / devicePixelRatio;
  static double screenHeight = height / devicePixelRatio;
  static ui.Size screenSize = new ui.Size(screenWidth, screenHeight);
  final bool isTablet, isPhone, isComputer, isIos, isAndroid, isWeb;

  Device(
      {required this.isTablet,
        required this.isPhone,
        required this.isComputer,
        required this.isIos,
        required this.isAndroid,
        required this.isWeb});

  factory Device.get() {
    bool isTablet;
    bool isPhone;
    bool isIos = !kIsWeb && io.Platform.isIOS;
    bool isAndroid =!kIsWeb && io.Platform.isAndroid;
    bool isWeb = kIsWeb;
    bool isComputer =!kIsWeb && (io.Platform.isWindows ||
        io.Platform.isLinux ||
        io.Platform.isMacOS ||
        io.Platform.isFuchsia);

    if (devicePixelRatio < 2 && (width >= 1000 || height >= 1000)) {
      isTablet = true;
      isPhone = false;
    } else if (devicePixelRatio == 2 && (width >= 1920 || height >= 1920)) {
      isTablet = true;
      isPhone = false;
    } else {
      isTablet = false;
      isPhone = true;
    }

    return new Device(
        isTablet: isTablet,
        isPhone: isPhone,
        isComputer: isComputer,
        isAndroid: isAndroid,
        isIos: isIos,
        isWeb: isWeb);
  }
}

class Authentication {
  static Widget firstScreen() {
    Widget _firstScreen = FutureBuilder<User?>(
        future: FirebaseAuth.instance.authStateChanges().first,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SplashScreen();
          }
          final user = snapshot.data;
          if (user == null) {
            return const LoginScreen();
          }

          return const HomePage();
        });
    return _firstScreen;
  }

  static Future<FirebaseApp> initializeFirebase(
      {required BuildContext context}) async {
    Future<FirebaseApp> firebaseApp = Firebase.initializeApp();

    return firebaseApp;
  }

  static Future<User?> googleLogin({required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance; //firebase auth instance
    User? user;
    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount =
    await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        final UserCredential userCredential =
        await auth.signInWithCredential(credential);

        user = userCredential.user;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          ScaffoldMessenger.of(context).showSnackBar(
            Authentication.customSnackBar(
              content:
              'The account already exists with a different credential.',
            ),
          );
        } else if (e.code == 'invalid-credential') {
          ScaffoldMessenger.of(context).showSnackBar(
            Authentication.customSnackBar(
              content: 'Error occurred while accessing credentials. Try again.',
            ),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          Authentication.customSnackBar(
            content: 'Error occurred using Google Sign-In. Try again.',
          ),
        );
      }

      return user;
    }
  }

  static Future<void> signOut({required BuildContext context}) async {
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.pushReplacementNamed(context, LoginScreen.routeName);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        Authentication.customSnackBar(
          content: 'Error signing out. Try again.',
        ),
      );
    }
  }

  static SnackBar customSnackBar({required String content}) {
    return SnackBar(
      backgroundColor: Colors.black,
      content: Text(
        content,
        style: const TextStyle(color: Colors.redAccent, letterSpacing: 0.5),
      ),
    );
  }
}

class googlemap extends StatefulWidget {
  const googlemap({Key? key}) : super(key: key);

  @override
  _googlemapState createState() => _googlemapState();
}

class _googlemapState extends State<googlemap> {
  /// Control and access the map with [mapController].
  late GoogleMapController mapController;

  /// Set of [Marker] which is shown on map.
  final Set<Marker> _markers = {};

  /// Object which stores the image to make into a [Marker].
  late BitmapDescriptor mapMarker;

  Location location = Location();
  late LocationData _currentPosition;
  LatLng _initialcameraposition = LatLng(0.5937, 0.9629);

  @override
  void initState() {
    super.initState();
    setCustomMarker();
  }

  /// Convert the [AssetImage] to [BitmapDescriptor]
  void setCustomMarker() async {
    mapMarker = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(),
      'image/marker.png',
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      /// Add the first [Marker] to the set.
      _markers.add(Marker(
        markerId: const MarkerId("Pot hole here"),
        icon: mapMarker,
        position: _center,
      ));
    });
    mapController = controller;

    LatLng current_pos;
    location.onLocationChanged.listen((l) {
      current_pos = LatLng(l.latitude!, l.longitude!);
      mapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: LatLng(l.latitude!, l.longitude!), zoom: 15),
        ),
      );
    });
  }

  /// The location of delhi
  final LatLng _center = const LatLng(
    28.65,
    77.23,
  );

  /// Puts a marker at the current map location
  ///
  /// Warning: Not on the physical current location
  void add_marker() async {
    LatLng _marker_pos = await mapController
        .getLatLng(ScreenCoordinate(
      x: 500,
      y: 1000,
    ))
        .then((value) => value);
    _markers.add(Marker(
      markerId: MarkerId("${_markers.length}"),
      icon: mapMarker,
      position: _marker_pos,
    ));
  }

  getLoc() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    /// Check if location is enabled
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    /// Check if location permission is given
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    /// Get current position on map
    _currentPosition = await location.getLocation();
    _initialcameraposition =
        LatLng(_currentPosition.latitude!, _currentPosition.longitude!);

    /// Update [_currentPosition] when changed
    location.onLocationChanged.listen((LocationData currentLocation) {
      print("${currentLocation.longitude} : ${currentLocation.longitude}");
      setState(() {
        _currentPosition = currentLocation;
        _initialcameraposition =
            LatLng(_currentPosition.latitude!, _currentPosition.longitude!);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 11.0,
          ),
          buildingsEnabled: true,
          markers: _markers,
        ),
      ],
    );
  }
}
class AddLocationUsecase {
  late final RepoImpl repoImpl;

  AddLocationUsecase() {
    repoImpl = RepoImpl(RemoteDataSourceImpl(WebServices()));
  }
  Future<void> addLocation(
      double lat, double long, String name, String des, double rate) async {
    await repoImpl.addLocation(lat, long, name, des, rate);
  }
}
class GetLocationUsecase {
  late final RepoImpl repoImpl;

  GetLocationUsecase() {
    repoImpl = RepoImpl(RemoteDataSourceImpl(WebServices()));
  }

  Future<List<Locations>> getLocationsData() async{
    final locationsResponse = await repoImpl.getLocationsData();
    return locationsResponse;
  }
}

const GOOGLE_API_KEY = googleApiKey;
class LocationHelper {
  static String generateLocationPreviewImage({
    double latitude,
    double longitude,
  }) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=$latitude,$longitude&zoom=16&size=600x300&maptype=roadmap&markers=color:red%7Clabel:C%7C$latitude,$longitude&key=$GOOGLE_API_KEY';
  }

  static Future<String> getPlaceAddress(double lat, double lng) async {
    final url =
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&key=$GOOGLE_API_KEY';
    final response = await http.get(url);
    return json.decode(response.body)['results'][0]['formatted_address'];
  }
}
class ImageSourceSheet extends StatelessWidget {
  final Function(File) onImageSelected;

  const ImageSourceSheet({Key? key, required this.onImageSelected}) : super(key: key);

  void imageSelected(File? image){
    if(image != null){
      onImageSelected(image);
    }
  }
  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      onClosing: () {},
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextButton(child: const Text("Câmera"), onPressed: () async {
            final ImagePicker _picker = ImagePicker();
            final File? image = await _picker.pickImage(source: ImageSource.camera);
            imageSelected(image);
          }),
          TextButton(child: const Text("Galeria"), onPressed: () async {
            final ImagePicker _picker = ImagePicker();
            final File? image = await _picker.pickImage(source: ImageSource.gallery);
            imageSelected(image);
          }),
        ],
      ),
    );
  }
}

class LocalNotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
  FlutterLocalNotificationsPlugin();

  static void initialize() {
    // initializationSettings  for Android
    const InitializationSettings initializationSettings =
    InitializationSettings(
      android: AndroidInitializationSettings("@mipmap/ic_launcher"),
    );

    _notificationsPlugin.initialize(
      initializationSettings,
      onSelectNotification: (String? id) async {
        print("onSelectNotification");
        if (id!.isNotEmpty) {
          print("Router Value1234 $id");

          // Navigator.of(context).push(
          //   MaterialPageRoute(
          //     builder: (context) => DemoScreen(
          //       id: id,
          //     ),
          //   ),
          // );

        }
      },
    );
  }

  static void createanddisplaynotification(RemoteMessage message) async {
    try {
      final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      const NotificationDetails notificationDetails = NotificationDetails(
        android: AndroidNotificationDetails(
          "prohealthnotification",
          "pushnotificationappchannel",
          importance: Importance.max,
          priority: Priority.high,
        ),
      );

      await _notificationsPlugin.show(
        id,
        message.notification!.title,
        message.notification!.body,
        notificationDetails,
        payload: message.data['_id'],
      );
    } on Exception catch (e) {
      print(e);
    }
  }
}
*/



