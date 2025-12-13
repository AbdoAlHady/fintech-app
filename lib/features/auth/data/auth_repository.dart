import 'package:firebase_auth/firebase_auth.dart';
import 'auth_service.dart';
import 'models/user_model.dart';

class AuthRepository {
  final AuthService _authService;

  AuthRepository({AuthService? authService})
    : _authService = authService ?? AuthService();
  // Register
  Future<AppUser> registerUser({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String phone,
  }) async {
    try {
      final credential = await _authService.registerWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = AppUser(
        uid: credential.user!.uid,
        firstName: firstName,
        lastName: lastName,
        email: email,
        phone: phone,
        photoUrl: null,
        createdAt: DateTime.now(),
      );

      await _authService.saveUserData(user);
      return user;
    } catch (e) {
      throw _handleException(e);
    }
  }

  // Login with Email
  Future<AppUser> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _authService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = await _authService.getUserData(credential.user!.uid);

      if (user == null) throw Exception('User data not found');
      return user;
    } catch (e) {
      throw _handleException(e);
    }
  }

  // Login with Google
  Future<AppUser> loginWithGoogle() async {
    try {
      final credential = await _authService.signInWithGoogle();
      final firebaseUser = credential.user!;

      final existingUser = await _authService.getUserData(firebaseUser.uid);

      if (existingUser != null) return existingUser;

      final nameParts = (firebaseUser.displayName ?? '').split(' ');

      final user = AppUser(
        uid: firebaseUser.uid,
        firstName: nameParts.isNotEmpty ? nameParts.first : '',
        lastName: nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
        email: firebaseUser.email ?? '',
        phone: null,
        photoUrl: firebaseUser.photoURL,
        createdAt: DateTime.now(),
      );

      await _authService.saveUserData(user);
      return user;
    } catch (e) {
      throw _handleException(e);
    }
  }

  // Login with Facebook
  Future<AppUser> loginWithFacebook() async {
    try {
      final credential = await _authService.signInWithFacebook();
      final firebaseUser = credential.user!;

      final existingUser = await _authService.getUserData(firebaseUser.uid);

      if (existingUser != null) return existingUser;

      final nameParts = (firebaseUser.displayName ?? '').split(' ');

      final user = AppUser(
        uid: firebaseUser.uid,
        firstName: nameParts.isNotEmpty ? nameParts.first : '',
        lastName: nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
        email: firebaseUser.email ?? '',
        phone: null,
        photoUrl: firebaseUser.photoURL,
        createdAt: DateTime.now(),
      );

      await _authService.saveUserData(user);
      return user;
    } catch (e) {
      throw _handleException(e);
    }
  }

  // Reset Password
  Future<void> resetPassword(String email) async {
    try {
      await _authService.resetPassword(email);
    } catch (e) {
      throw _handleException(e);
    }
  }

  // Logout
  Future<void> logout() async {
    await _authService.signOut();
  }

  // Error Handler
  String _handleException(Object e) {
    if (e is FirebaseAuthException) {
      switch (e.code) {
        case 'user-not-found':
          return 'User not found';
        case 'wrong-password':
          return 'Wrong password';
        case 'email-already-in-use':
          return 'Email already in use';
        case 'account-exists-with-different-credential':
          return 'Account exists with different provider';
        case 'ERROR_ABORTED_BY_USER':
          return 'Sign in cancelled';
        default:
          return e.message ?? 'Auth error';
      }
    }
    return e.toString();
  }
}
