import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_project/screens/post-free.dart';
import 'package:my_project/screens/post-sale.dart';
import 'package:my_project/src/colors.dart';
import '../bloc/navigation_bloc.dart';
import '../bloc/navigation_state.dart';
import '../bloc/navigation_event.dart';
import '../src/animation.dart';
import 'chat_page.dart';
import 'home_page.dart';
import 'favorite_page.dart';
import 'menu_page.dart';
import 'notification_page.dart';

class MainScreen extends StatefulWidget {
  final String username; // Add username parameter
  const MainScreen({Key? key, required this.username}) : super(key: key);
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late String
      username; // Change String? to String since you're passing it from the constructor
  int _selectedIndex = 0; // Assuming 0 corresponds to the 'Home' icon initially
  bool _isMenuDrawerOpen = false; // Track the state of the menu drawer
  NavigationEvent _currentPageEvent =
      HomeEvent(); // Store the current page event

  @override
  void initState() {
    super.initState();
    username = widget
        .username; // Initialize username from the widget's username parameter
    print(
        'Username: $username'); // Print the username when the widget is initialized
  }

  @override
  Widget build(BuildContext context) {
    print('MainScreen: Building the screen'); // Track MainScreen build

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80, // Set
        leading: Padding(
          padding: const EdgeInsets.only(left: 25.0),
          child: IconButton(
            color: AppColors.lightgreen,
            icon: Icon(Icons.menu), // Menu icon on the left side
            onPressed: () {
              setState(() {
                _isMenuDrawerOpen =
                    !_isMenuDrawerOpen; // Toggle the menu drawer state
                if (_isMenuDrawerOpen) {
                  // Redirect to the menu page if the menu drawer is opened
                  BlocProvider.of<NavigationBloc>(context).add(MenuEvent());
                } else {
                  // Remove redirection if the menu drawer is closed
                  BlocProvider.of<NavigationBloc>(context)
                      .add(_currentPageEvent);
                }
              });
            },
          ),
        ),
        title: Center(
          child: Container(
            margin: EdgeInsets.only(right: 60),
            child: Image.asset(
              'assets/logo.png', // Your image asset path
              height: 50, // Adjust height as needed
            ),
          ),
        ),
      ),
      body: BlocBuilder<NavigationBloc, NavigationState>(
        builder: (context, state) {
          print('The state is $state');
          // Optimized content switching
          return AnimatedSwitcher(
            duration: Duration(milliseconds: 500),
            child: _buildPage(state, username),
            transitionBuilder: (Widget child, Animation<double> animation) {
              StateChecker stateChecker =
                  StateChecker(); // Create an instance of StateChecker
              return stateChecker.checkState(
                  state, animation, child); // Call the checkState method
            },
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        color: AppColors.semidarkgrey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                color: _selectedIndex == 0 ? AppColors.lightgreen : null,
                icon: Icon(Icons.home),
                onPressed: () => {
                  setState(() {
                    _selectedIndex =
                        0; // Set the index to 0 when 'Home' icon is pressed
                    _currentPageEvent =
                        HomeEvent(); // Update current page event
                    BlocProvider.of<NavigationBloc>(context)
                        .add(_currentPageEvent);
                  })
                },
              ),
              IconButton(
                color: _selectedIndex == 1 ? AppColors.lightgreen : null,
                icon: Icon(Icons.favorite),
                onPressed: () => {
                  setState(() {
                    _selectedIndex =
                        1; // Set the index to 0 when 'Home' icon is pressed
                    _currentPageEvent =
                        FavoriteEvent(); // Update current page event
                    BlocProvider.of<NavigationBloc>(context)
                        .add(_currentPageEvent);
                  })
                },
              ),
              IconButton(
                color: _selectedIndex == 2 ? AppColors.lightgreen : null,
                icon: Icon(Icons.notifications),
                onPressed: () => {
                  setState(() {
                    _selectedIndex =
                        2; // Set the index to 0 when 'Home' icon is pressed
                    _currentPageEvent =
                        NotificationEvent(); // Update current page event
                    BlocProvider.of<NavigationBloc>(context)
                        .add(_currentPageEvent);
                  })
                },
              ),
              IconButton(
                color: _selectedIndex == 3 ? AppColors.lightgreen : null,
                icon: Icon(Icons.chat),
                onPressed: () => {
                  setState(() {
                    _selectedIndex =
                        3; // Set the index to 0 when 'Home' icon is pressed
                    _currentPageEvent =
                        ChatsEvent(); // Update current page event
                    BlocProvider.of<NavigationBloc>(context)
                        .add(_currentPageEvent);
                  })
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        elevation: 10,
        shape: CircleBorder(),
        backgroundColor: AppColors.lightgreen,
        foregroundColor: AppColors.darkgrey,
        onPressed: () =>
            BlocProvider.of<NavigationBloc>(context).add(PostEvent()),
        child: Icon(Icons.add),
      ),
    );
  }
}

Widget _buildPage(NavigationState state, String username) {
  print('BUILDPAGE: $username');
  if (state is HomeState) {
    return HomePage(
      homeusername: username,
    );
  } else if (state is FavoriteState) {
    return FavoritePage();
  } else if (state is NotificationState) {
    return NotificationPage();
  } else if (state is ChatState) {
    return ChatPage();
  } else if (state is PostState) {
    return PostFreePage();
  } else if (state is MenuState) {
    return MenuPage();
  } else if (state is AboutState) {
    return HomePage();
  } else if (state is PostFreeState) {
    return PostSalePage();
  } else if (state is PostSaleState) {
    return PostFreePage();
  } else if (state is LogoutState) {
    return HomePage();
  } else {
    return Container();
  }
}
