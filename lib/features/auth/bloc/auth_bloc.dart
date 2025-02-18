import 'package:ecommerce_shop/features/auth/domain/usecases/login.dart';
import 'package:ecommerce_shop/features/auth/domain/usecases/logout.dart';
import 'package:ecommerce_shop/features/auth/domain/usecases/resetpassword.dart';
import 'package:ecommerce_shop/features/auth/domain/usecases/signup.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final Signup signUp;
  final Login login;
  final Logout logout;
  final ResetPassword resetPassword;

  AuthBloc({
    required this.signUp,
    required this.login,
    required this.logout,
    required this.resetPassword,
  }) : super(AuthInitial());

  @override
    on<SignUpRequested>((SignUpRequested event, Emitter<AuthState>emit) async {
      emit(AuthLoading());
      final result = await registerUser(RegisterParams(
        name: event.name,
        email: event.email,
        password: event.password,
      ));
      result.fold(
        (failure) => emit(AuthError(failure.message)),
        (_) => emit(AuthSuccess()),
      );
    });

    // ✅ Handle Login
    on<LoginRequested>((event, emit) async {
      emit(AuthLoading());
      final result = await loginUser(LoginParams(
        email: event.email,
        password: event.password,
      ));
      result.fold(
        (failure) => emit(AuthError(failure.message)),
        (_) => emit(AuthSuccess()),
      );
    });

    // ✅ Handle Logout
    on<LogoutRequested>((event, emit) async {
      emit(AuthLoading());
      final result = await logoutUser(NoParams());
      result.fold(
        (failure) => emit(AuthError(failure.message)),
        (_) => emit(AuthInitial()), // Go back to initial state after logout
      );
    });

    // ✅ Handle Reset Password
    on<ResetPasswordRequested>((event, emit) async {
      emit(AuthLoading());
      final result = await resetPassword(ResetPasswordParams(email: event.email));
      result.fold(
        (failure) => emit(AuthError(failure.message)),
        (_) => emit(AuthSuccess()),
      );
    });
  }
}