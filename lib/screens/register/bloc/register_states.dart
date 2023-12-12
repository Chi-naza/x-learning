class RegisterState {
  final String email;
  final String username;
  final String password;
  final String rePassword;

  RegisterState({
    this.email = "",
    this.username = "",
    this.password = "",
    this.rePassword = "",
  });

  RegisterState copyWWith(
      {String? email, String? username, String? password, String? rePassword}) {
    return RegisterState(
      email: email ?? this.email,
      username: username ?? this.username,
      password: password ?? this.password,
      rePassword: rePassword ?? this.rePassword,
    );
  }
}
