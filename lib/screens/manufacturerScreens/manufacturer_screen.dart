import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:zanaatapp/components/rounded_button.dart';
import 'package:zanaatapp/constants/constants.dart';
import 'package:zanaatapp/screens/manufacturerScreens/manufacturer_processes_screen.dart';

class ManufacturerScreen extends StatefulWidget {
  static final id = 'manufacturer_screen';

  @override
  _ManufacturerScreenState createState() => _ManufacturerScreenState();
}

class _ManufacturerScreenState extends State<ManufacturerScreen> {
  final _auth = FirebaseAuth.instance;
  FirebaseUser loggedInUser;

  bool showSpinner = false;
  bool formValidation = false;

  String nameSurname;
  String address;
  String companyName;
  String telephoneNumber;

  showValidateFormAlert(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            title: Text('Uyarı'),
            content: Text('Sözleymeyi Onaylamadınız.'),
          );
        });
  }

  void updateUserProfile() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        UserUpdateInfo userUpdateInfo = UserUpdateInfo();
        userUpdateInfo.displayName = nameSurname;
        userUpdateInfo.photoUrl = companyName;
        user.updateProfile(userUpdateInfo);
        loggedInUser = user;

        print(loggedInUser.email);
        print({loggedInUser.displayName, loggedInUser.photoUrl});
//        Navigator.pushNamed(context, ManufacturerProcessesScreen.id);

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return ManufacturerProcessesScreen(
              nameSurname: nameSurname,
              companyName: companyName,
            );
          }),
        );
      }

      setState(() {
        showSpinner = false;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                FlatButton(
                  onPressed: () {
                    print({nameSurname, companyName});
                  },
                  child: Text(
                    'Üretici Bilgileri',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 21.0,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(112, 112, 112, 1),
                    ),
                  ),
                ),
                Divider(
                  thickness: 2.0,
                ),
                SizedBox(height: 70.0),
                TextField(
                  textAlign: TextAlign.left,
                  onChanged: (value) {
                    nameSurname = value;
                    //Do something with the user input.
                  },
                  decoration: kTextFieldDecoration.copyWith(
                    hintText: '* Ad Soyad',
                  ),
                ),
                SizedBox(height: 20.0),
                TextField(
                  textAlign: TextAlign.left,
                  onChanged: (value) {
                    address = value;
                    //Do something with the user input.
                  },
                  decoration: kTextFieldDecoration.copyWith(
                    hintText: '* Adres',
                  ),
                ),
                SizedBox(height: 20.0),
                TextField(
                  textAlign: TextAlign.left,
                  keyboardType: TextInputType.number,
                  inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                  onChanged: (value) {
                    telephoneNumber = value.toString();
                    //Do something with the user input.
                  },
                  decoration: kTextFieldDecoration.copyWith(
                    hintText: '* Telefon',
                  ),
                ),
                SizedBox(height: 20.0),
                TextField(
                  textAlign: TextAlign.left,
                  onChanged: (value) {
                    companyName = value;
                    //Do something with the user input.
                  },
                  decoration: kTextFieldDecoration.copyWith(
                    hintText: '* Firma Adı',
                  ),
                ),
                SizedBox(height: 20.0),
                CheckboxListTile(
                  title: Text("Satış Sözleşmesini Onaylıyorum"),
                  subtitle: Text(
                    '* Doldurulması zorunlu alanlar',
                    style: TextStyle(fontSize: 12),
                  ),
                  value: formValidation,
                  activeColor: Colors.black,
                  controlAffinity:
                      ListTileControlAffinity.leading, //  <-- leading Checkbox
                  onChanged: (value) {
                    setState(() {
                      formValidation = !formValidation;
                    });
                  },
                ),
                SizedBox(height: 20.0),
                RoundedButton(
                  title: 'Kaydet',
                  color: Colors.blueGrey,
                  textColor: Colors.white,
                  onPressed: () {
                    setState(() {
                      showSpinner = true;
                    });

                    if (formValidation) {
                      updateUserProfile();
                      showSpinner = false;
                    } else {
                      print(formValidation);
                      showValidateFormAlert(context);
                    }

                    //Go o registration screen.
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
