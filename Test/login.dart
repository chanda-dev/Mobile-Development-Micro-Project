import 'signup.dart';
class Login{
  Signup sl;
  final String? _lEmail;
  final String? _lPassword;
  Login(this._lEmail,this._lPassword,this.sl);
  String? get lEmail => this._lEmail; 
  String? get lPassword => this._lPassword;
  
}

void main(List<String> args) {
  Signup s1 = Signup('sounsok626@gmail.com', 'da', '123');
  Login l = Login('da', '123',s1);
  print(l._lEmail);
}