// // Token Manager Provider
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import '../storage/local_storage.dart';
// import '../../modules/auth/repo/user/user.dart';
// import '../../modules/auth/provider/provider.dart';
//
// final tokenServiceProvider = ChangeNotifierProvider<TokenManager>((ref) {
//   return TokenManager(ref.read(localStorageProvider));
// });
//
// /// TokenManager is responsible for managing the authentication token
// /// and storing it in SharedPreferences for persistent storage.
// class TokenManager extends ChangeNotifier {
//   /// Key for storing authToken in SharedPreferences.
//   final String _authTokenKey = 'authToken';
//   final String _userDataKey = 'userData';
//
//   /// Stores the authentication token.
//   String? _authToken;
//   User? _authUser;
//
//   /// SharedPreferences instance for storing data.
//   final StorageService _storage;
//
//   /// Constructor for TokenManager.
//   TokenManager(this._storage) {
//     _init(); // Initialize the TokenManager when created
//   }
//
//   /// Initialize the TokenManager and load the authToken from SharedPreferences.
//   Future<void> _init() async {
//     // Initialize SharedPreferences
//     _authToken = _storage.getString(_authTokenKey);
//     if (authToken != null) {
//       _authUser =
//           User.fromJson(jsonDecode((_storage.getString(_userDataKey)!)));
//     }
//
//     // Load authToken from SharedPreferences
//     notifyListeners(); // Notify listeners (typically UI components) of changes
//   }
//
//   /// Getter for authToken.
//   /// Returns the current authentication token if available, or null if not authenticated.
//   String? get authToken => _authToken;
//   User? get authUser => _authUser;
//
//   /// Function to set authToken and save it in SharedPreferences.
//   /// [token] - The authentication token to be set.
//   void setAuthData(String token, {User? user}) {
//     _authToken = token; // Set the authToken
//     _storage.setString(
//         _authTokenKey, token); // Save authToken to SharedPreferences
//     if (user != null) {
//       _storage.setString(_userDataKey,
//           jsonEncode(user.toJson())); // Save authToken to SharedPreferences
//       _authUser = user;
//     }
//     notifyListeners();
//   }
//
//   /// Function to clear authToken from SharedPreferences.
//   void clearAuthToken() {
//     _authToken = null; // Clear the authToken
//     _storage.remove(_authTokenKey); // Remove authToken from SharedPreferences
//     notifyListeners(); // Notify listeners of changes
//   }
// }
