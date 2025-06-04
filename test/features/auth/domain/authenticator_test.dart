// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:mockito/mockito.dart';
// import 'package:mockito/annotations.dart';
// import 'package:sign_learn/features/auth/domain/authenticator.dart';
// import 'package:sign_learn/features/auth/domain/providers/states/auth_state.dart';
// import 'package:sign_learn/features/features.dart';

// @GenerateMocks([FirebaseAuth, User, UserCredential])
// import 'authenticator_test.mocks.dart';

// void main() {
//   late MockFirebaseAuth mockFirebaseAuth;
//   late MockUser mockUser;
//   late MockUserCredential mockUserCredential;
//   late Authenticator authenticator;

//   setUp(() {
//     mockFirebaseAuth = MockFirebaseAuth();
//     mockUser = MockUser();
//     mockUserCredential = MockUserCredential();
//     final container = ProviderContainer(overrides: [
//       // You may need to override firebaseAuthProvider here if used in Authenticator
//       firebaseAuthProvider.overrideWithValue(mockFirebaseAuth),
//     ]);
//     authenticator = Authenticator(container);
//   });

//   group('Authenticator Signup Tests', () {
//     test('should create new user with correct ID', () async {
//       // Arrange
//       const testEmail = 'test@example.com';
//       const testPassword = 'password123';
//       const testUid = 'new-user-uid';

//       when(mockUser.uid).thenReturn(testUid);
//       when(mockUserCredential.user).thenReturn(mockUser);
//       when(mockFirebaseAuth.createUserWithEmailAndPassword(
//         email: testEmail,
//         password: testPassword,
//       )).thenAnswer((_) async => mockUserCredential);

//       // Act
//       final result = await authenticator.signUpWithCredential(
//         email: testEmail,
//         password: testPassword,
//       );

//       // Assert
//       expect(result, isA<AuthAccountCreated>());
//       expect(authenticator.userId, equals(testUid));
//     });
//   });
// }
