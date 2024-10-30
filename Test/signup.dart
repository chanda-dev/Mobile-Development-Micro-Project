import 'dart:io';

class Signup {
  final String? _email;

  final String? _userName;

  final String? _password;

  List<Map<String,String>> user = [
    {
      'email':'sokda106@gmail.com',
      'username':'Livinda',
      'password':'@#dAloy123'
    }
  ];

  Signup(this._email,this._userName,this._password);

  String? get email =>this._email;
  String? get username => this._userName;
  String? get password => this._password;

  void addUser(){
    Map<String,String> newUser = {
      'email':'$email',
      'username':'$username',
      'password':'$password'
    };
    for(var i =0; i<user.length;i++){
        if(newUser['email'] == user[i]['email'] && newUser['username'] == user[i]['username']){
          throw Exception('This username and Email already sign Up');
        } else if(newUser['email'] == user[i]['email']){
          throw Exception('This Email already sign Up');
        } else if(newUser['username'] == user[i]['username']){
          throw Exception('This username already Sign UP');
        }
        
      
    }
    user.add(newUser);
    print('Sign up successfull');
  }

  String toString(){
    return 'username: $username, password: $password ';
  }

  

}

void main(List<String> args) {
  // print('input your email');
  // String? email = stdin.readLineSync();
  // print('input your username');
  // String? username = stdin.readLineSync();
  // print('input your password');
  // String? password = stdin.readLineSync();
  Signup s1 = Signup('sounsok626@gmail.com', 'da', '123');
  try{
    s1.addUser();
  } catch(e){
    print(e);
  }
  
  print(s1.user);
}

