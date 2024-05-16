/*class SFirebaseauthException implements Exception {
  //Error code associaated with the exception
  final String code;
//Constructor that takes an error code
  SFirebaseauthException(this.code);
//Get curresponding error message based on the error code
  String get message {
    switch (code) {
      case 'email-already-in-use':
        return 'the email address is already registered. Please use a different email.';
      case 'invalid-email':
        return 'the email address provided is invalid. Please enter a valid email.';
      case 'weak-password':
        return 'The password is too weak,please choose a stronger password.';
      case 'user-disabled':
        return 'This user account has been disabled. Please contact support for assistance';
      case 'user-not-found':
        return 'Invalid login details. User not found';
      case 'wrong-password':
        return 'Incorrect password. Please check your password';
      case 'invalid-verification-code':
        return 'Invalid verification code. Please enter a valid code.';
      case 'invalid-verification-id':
        return 'Invalid verification ID. Please request a new verification ID';
      case 'quota-exceeded':
        return 'Quota exceeded . Please try again later.';
      case 'email-already-exists':
        return 'The Email address already exists. Please use a different email.';
      case 'provider-already-linked':
        return 'The account is already linked with another provider.';
      case 'requires-recent-login':
        return 'This operation is sensitive and requires recent authentication';
      case 'creddential-already-in-use':
        return 'This credential is already associated with adifferent user account.';
      case 'user-mismatch':
        return 'The supplied credentials do not currespond to the previously signed in user.';
    }
  }
}*/
