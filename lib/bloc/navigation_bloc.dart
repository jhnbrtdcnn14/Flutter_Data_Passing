import 'package:flutter_bloc/flutter_bloc.dart';
import 'navigation_event.dart';
import 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(HomeState()) {
    print('NavigationBloc: Initialized'); // Track BLoC creation
    // Initial state is Home

    // Handles incoming navigation events
    on<HomeEvent>((event, emit) {
      emit(HomeState());
    });

    on<FavoriteEvent>((event, emit) {
      emit(FavoriteState());
    });

    on<NotificationEvent>((event, emit) {
      emit(NotificationState());
    });

    on<ChatsEvent>((event, emit) {
      emit(ChatState());
    });

    on<PostEvent>((event, emit) {
      emit(PostState());
    });

    on<MenuEvent>((event, emit) {
      emit(MenuState());
    });

    on<AboutEvent>((event, emit) {
      emit(AboutState());
    });

    on<PostFreeEvent>((event, emit) {
      emit(PostFreeState());
    });

    on<PostSaleEvent>((event, emit) {
      emit(PostSaleState());
    });

    on<LogoutEvent>((event, emit) {
      emit(LogoutState());
    });
  }
}
