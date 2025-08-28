import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tut_app/features/auth/data/models/User.dart';
import 'package:tut_app/features/auth/domain/usecases/GetCurrentUserUseCase.dart';
import 'package:tut_app/features/auth/domain/usecases/LogOutUseCase.dart';
import 'package:tut_app/features/auth/domain/usecases/SignInUseCase.dart';
import 'package:tut_app/features/auth/domain/usecases/SignUpUseCase.dart';
import 'package:tut_app/features/auth/presentation/bloc/AuthEvent.dart';
import 'package:tut_app/features/auth/presentation/bloc/AuthState.dart';

@injectable
class AuthBloc extends HydratedBloc<AuthEvent, AuthState> {
  final SignInUseCase signInUseCase;
  final SignUpUseCase signUpUseCase;
  final LogOutUseCase logOutUseCase;
  final GetCurrentUserUseCase getCurrentUserUseCase;

  AuthBloc(
    this.signUpUseCase,
    this.signInUseCase,
    this.logOutUseCase,
    this.getCurrentUserUseCase,
  ) : super(AuthInitial()) {
    on<SignUpRequestedEvent>(_onSignUpRequested);
    on<SignInRequestedEvent>(_onSignInRequested);
    on<LogOutRequestedEvent>(_onLogOutRequested);
    on<AppStartedEvent>(_onAppStarted);
  }

  void _onAppStarted(AppStartedEvent event, Emitter<AuthState> emit) async {
    final user = getCurrentUserUseCase();
    if (user != null) {
      emit(Authenticated(user));
    } else {
      emit(Unauthenticated());
    }
  }

  Future<void> _onSignInRequested(
    SignInRequestedEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    try {
      final user = await signInUseCase(event.email, event.password);
      if (user != null) {
        emit(Authenticated(user));
      } else {
        emit(AuthError('Login failed'));
      }
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> _onSignUpRequested(
    SignUpRequestedEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      final user = await signUpUseCase(event.email, event.password, event.name);
      if (user != null) {
        emit(Authenticated(user));
      } else {
        emit(AuthError('Signup failed'));
      }
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> _onLogOutRequested(
    LogOutRequestedEvent event,
    Emitter<AuthState> emit,
  ) async {
    await logOutUseCase();

    emit(Unauthenticated());
  }

  @override
  //reads from cache
  AuthState? fromJson(Map<String, dynamic> json) {
    switch (json["type"]) {
      case "initial":
        return AuthInitial();
      case "loading":
        return AuthLoading();
      case "authenticated":
        return Authenticated(
          User(
            id: json["userId"],
            email: json["email"],
            username: json["username "],
          ),
        );
      case 'unauthenticated':
        return Unauthenticated();
      case 'error':
        return AuthError(json['message'] as String);
    }
    return null;
  }

  @override
  //writes to cache
  Map<String, dynamic>? toJson(AuthState state) {
    if (state is AuthInitial) {
      return {"type": "initial"};
    } else if (state is AuthLoading) {
      return {"type": "loading"};
    } else if (state is Authenticated) {
      return {
        "type": "authenticated",
        "userId": state.user.id,
        "email": state.user.email,
        "username": state.user.username ?? "",
      };
    } else if (state is Unauthenticated) {
      return {"type": "unauthenticated"};
    } else if (state is AuthError) {
      return {"type": "error", "message": state.message};
    }
    return null;
  }
}
