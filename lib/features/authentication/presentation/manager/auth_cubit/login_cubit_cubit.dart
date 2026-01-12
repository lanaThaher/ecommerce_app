import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/authentication/data/repo/auth_repo.dart';
import 'package:ecommerce_app/features/authentication/presentation/manager/auth_cubit/login_cubit_state.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo repository;

  AuthCubit({required this.repository}) : super(AuthInitial());

  Future<void> register({
    required String email,
    required String password,
  }) async {
    emit(AuthLoading());
    try {
      final user = await repository.register(email: email, password: password);
      if (user != null) {
        emit(AuthSuccess(user));
      } else {
        emit(AuthError("Register failed"));
      }
    } on FirebaseAuthException catch (e) {
      emit(AuthError(e.message ?? 'Register failed'));
    }
  }

  Future<void> login(String email, String password) async {
    emit(AuthLoading());
    try {
      final user = await repository.login(email: email, password: password);
      if (user != null) {
        emit(AuthSuccess(user));
      } else {
        emit(AuthError("Login failed"));
      }
    } on FirebaseAuthException catch (e) {
      emit(AuthError(e.message ?? 'Login failed'));
    }
  }
}
