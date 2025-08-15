abstract class AuthEvent {}


class SignUpRequestedEvent extends AuthEvent {

  final String email;
  final String password;
  final String name;

  SignUpRequestedEvent(this.email, this.password, this.name);
  
 
}
class SignInRequestedEvent extends AuthEvent {
   final String email;
   final String password;
   SignInRequestedEvent(this.email, this.password);
}

class LogOutRequestedEvent extends AuthEvent {
  
}

