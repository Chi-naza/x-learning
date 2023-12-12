abstract class RegisterEvents {
  const RegisterEvents();
}

class EmailEvent extends RegisterEvents {
  final String email;
  const EmailEvent(this.email);
}

class UserNameEvent extends RegisterEvents {
  final String username;
  const UserNameEvent(this.username);
}

class PasswordEvent extends RegisterEvents {
  final String password;
  const PasswordEvent(this.password);
}

class RePasswordEvent extends RegisterEvents {
  final String rePassword;
  const RePasswordEvent(this.rePassword);
}
