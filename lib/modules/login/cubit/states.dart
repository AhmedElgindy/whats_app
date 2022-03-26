abstract class LoginStates{}
class LoginInit extends LoginStates{}
class ChangeSecure extends LoginStates{}


class WhatsLoginLoading extends LoginStates{}
class WhatsLoginSuccess extends LoginStates{
  final String uId;

  WhatsLoginSuccess(this.uId);
}
class WhatsLoginError extends LoginStates{
  final error;

  WhatsLoginError(this.error);
}