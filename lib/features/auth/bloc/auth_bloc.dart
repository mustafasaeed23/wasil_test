import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:store_app/features/auth/bloc/auth_event.dart';
import 'package:store_app/features/auth/bloc/auth_state.dart';
import 'package:store_app/features/auth/data/auth_repository.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  AuthBloc(this.authRepository) : super(AuthInitial()) {
    on<SignUpEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        final user = await authRepository.signUp(
          firstName: event.firstName,
          lastName: event.lastName,
          email: event.email,
          password: event.password,
        );
        emit(AuthSuccess(user!));
      } catch (e) {
        emit(AuthFailure(e.toString()));
      }
    });

    on<SignInEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        final user = await authRepository.signIn(
          email: event.email,
          password: event.password,
        );
        emit(AuthSuccess(user!));
      } catch (e) {
        emit(AuthFailure(e.toString()));
      }
    });

    on<SignOutEvent>((event, emit) async {
      await authRepository.signOut();
      emit(AuthInitial());
    });

    on<GuestLoginEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        final user = await authRepository.signInAnonymously();
        emit(AuthSuccess(user!, isGuest: true));
      } catch (e) {
        emit(AuthFailure("Failed to login as guest: ${e.toString()}"));
      }
    });
  }
}
