import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:signarabiclanguagee/firebase/firebase.dart';
import 'package:signarabiclanguagee/registrationPage/secondScreen.dart';
import 'package:signarabiclanguagee/registrationPage/widgets/ButtonOrignal.dart';

class AuthForm extends StatefulWidget {
  final AuthType authType;

  const AuthForm({Key key, @required this.authType}) : super(key: key);

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  String _email = '',
      _password = '',
      _username = '',
      _phone = '',
      _confirmpassword = '',
      _error;
  AuthBase authBase = AuthBase();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: <Widget>[
            if (widget.authType != AuthType.login) const SizedBox(height: 5),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) => _email = value,
              validator: (value) => (value.isEmpty || !value.contains('@'))
                  ? 'من فضلك يرجى ادخال بريد الكترونى صالح'
                  : null,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.email),
                hintText: 'ادخل الايميل الخاص بك',
              ),
            ),
            const SizedBox(height: 18),
            if (widget.authType != AuthType.login)
              TextFormField(
                key: const ValueKey('User Name'),
                validator: (value) => (value.isEmpty || value.length < 4)
                    ? 'من فضلك ادخل اسمك'
                    : null,
                onChanged: (value) => _username = value,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.account_circle),
                    hintText: 'اسم المستخدم'),
              ),
            const SizedBox(height: 18),
            if (widget.authType != AuthType.login)
              TextFormField(
                onChanged: (value) => _phone = value,
                validator: (value) => value.length < 11
                    ? 'من فضلك ادخل رقم الهاتف الخاص بك '
                    : null,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.phone),
                  hintText: 'رقم الهاتف ',
                ),
              ),
            if (widget.authType != AuthType.login) const SizedBox(height: 15),
            TextFormField(
              onChanged: (value) => _password = value,
              validator: (value) => value.length < 6
                  ? ' كلمة المرور ضعيفة ، يجب أن تكون كلمة المرور الخاصة بك قوية '
                  : null,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.password),
                hintText: 'ادخل كلمة المرور',
              ),
              obscureText: true,
            ),
            const SizedBox(height: 18),
            if (widget.authType != AuthType.login)
              TextFormField(
                onChanged: (value) => _confirmpassword = value,
                validator: (value) => ((value.contains(_confirmpassword) !=
                            value.contains(_password)) ||
                        (_confirmpassword.length != _password.length))
                    ? 'كلمة المرور هذه غير متطابقة. ، حاول مرة أخرى.'
                    : null,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.password),
                  hintText: 'تأكيد كلمة المرور',
                ),
                obscureText: true,
              ),
            widget.authType == AuthType.login
                ? const SizedBox(height: 2)
                : const SizedBox(height: 50),
            ButtonOrignal(
                textHome: widget.authType == AuthType.login
                    ? 'تسجيل الدخول'
                    : 'انشاء حساب ',
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    try {
                      if (widget.authType == AuthType.login) {
                        var result = await FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                                email: _email, password: _password);
                        Navigator.of(context).pushReplacementNamed('home');
                      } else {
                        await authBase.registerWithEmailAndPassword(
                            _email, _password);
                        Navigator.of(context).pushReplacementNamed('login');
                      }
                    } catch (e) {
                      print(e);
                    }

                    try {
                      if (widget.authType == AuthType.login) {
                        var result = await FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                                email: _email, password: _password)
                            .catchError((onError) {
                          FirebaseAuthException exception = onError;
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(exception.message)));
                        });
                      }
                    } catch (e) {
                      print(e);
                    }
                  }
                },
                bgColor: const Color(0xFF713094)),
            const SizedBox(height: 5),
            FlatButton(
              onPressed: () {
                if (widget.authType == AuthType.login) {
                  Navigator.of(context).pushReplacementNamed('register');
                } else {
                  Navigator.of(context).pushReplacementNamed('login');
                }
              },
              child: Text(
                widget.authType == AuthType.login
                    ? ' ليس لديك حساب ؟ '
                    : ' ! هل لديك حساب',
                style: const TextStyle(color: Colors.grey, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
