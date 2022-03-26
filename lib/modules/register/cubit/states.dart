abstract class RegisterStates{}
class RegisterInit extends RegisterStates{}
class ChangeSecure extends RegisterStates{}

class SocialCreateUserSuccess extends RegisterStates{
  final String uId;

  SocialCreateUserSuccess(this.uId);
}
class SocialCreateUserError extends RegisterStates{}

class WhatsRegisterLoading extends RegisterStates{}
class WhatsRegisterSuccess extends RegisterStates{}
class WhatsRegisterError extends RegisterStates{}