import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class AuthenticationProvider with ChangeNotifier {
  final FirebaseAuth _firebaseAuth;

  AuthenticationProvider(this._firebaseAuth);
  String appleEmail = "";
  String displayName = "";
  bool appleLoading = false;
  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      print("====$e");
    }
  }

  /// Generates a cryptographically secure random nonce, to be included in a
  /// credential request.
  loadingStatus(bool state) {
    appleLoading = state;
    notifyListeners();
  }

  String generateNonce([int length = 32]) {
    final charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = Random.secure();
    return List.generate(length, (_) => charset[random.nextInt(charset.length)])
        .join();
  }

  /// Returns the sha256 hash of [input] in hex notation.
  String sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  Future<User?> signInWithApple() async {
    // To prevent replay attacks with the credential returned from Apple, we
    // include a nonce in the credential request. When signing in in with
    // Firebase, the nonce in the id token returned by Apple, is expected to
    // match the sha256 hash of `rawNonce`.
    final rawNonce = generateNonce();
    final nonce = sha256ofString(rawNonce);
    loadingStatus(true);

    try {
      // Request credential for the currently signed in Apple account.
      final appleCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
        nonce: nonce,
      );

      print(appleCredential.authorizationCode);

      // Create an `OAuthCredential` from the credential returned by Apple.
      final oauthCredential = OAuthProvider("apple.com").credential(
        idToken: appleCredential.identityToken,
        rawNonce: rawNonce,
      );

      final qwerty = decodeUserData(appleCredential.identityToken!);
      appleEmail = qwerty["email"];

      // Sign in the user with Firebase. If the nonce we generated earlier does
      // not match the nonce in `appleCredential.identityToken`, sign in will fail.

      final authResult =
          await _firebaseAuth.signInWithCredential(oauthCredential);

      displayName = appleCredential.givenName != null
          ? '${appleCredential.givenName ?? ""} ${appleCredential.familyName ?? ""}'
          : appleEmail.split("@").first;
      final userEmail = '${appleCredential.email ?? appleEmail}';

      final firebaseUser = authResult.user;
      print(displayName);
      if (userEmail.isNotEmpty) {
        await firebaseUser!.updateDisplayName(displayName);
        await firebaseUser.updateEmail(userEmail);
      }

      notifyListeners();
      return firebaseUser;
    } catch (exception) {
      print(exception);
    }
    notifyListeners();
  }

  @override
  void notifyListeners() {
    // TODO: implement notifyListeners
    super.notifyListeners();
  }
}

decodeUserData(String code) {
  String normalizedSource = base64Url.normalize(code.split(".")[1]);
  return jsonDecode(utf8.decode(base64Url.decode(normalizedSource)));
}
