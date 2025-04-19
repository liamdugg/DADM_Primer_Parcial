import 'package:go_router/go_router.dart';
import 'package:primer_parcial/presentation/screens/home_screen.dart';
import 'package:primer_parcial/presentation/screens/edit_screen.dart';
import 'package:primer_parcial/presentation/screens/login_screen.dart';
import 'package:primer_parcial/presentation/screens/details_screen.dart';
import 'package:primer_parcial/presentation/screens/profile_screen.dart';
import 'package:primer_parcial/presentation/screens/settings_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(
      path: '/login',
      builder:(context, state) => const LoginScreen(),
    ),

    GoRoute(
      path: '/home/:id',
      builder:(context, state) => HomeScreen(
        userName: state.pathParameters['id']!.toString(),
      ),
    ),
    
    GoRoute(
      path: '/home/:id',
      builder:(context, state) => const DetailsScreen(),
    ),
    
    GoRoute(
      path: '/settings',
      builder:(context, state) => const SettingsScreen(),
    ),
    
    GoRoute(
      path: '/home/editor/:id',
      builder:(context, state) => const EditScreen(),
    ),

    GoRoute(
      path: '/profile/:id',
      builder:(context, state) => const ProfileScreen(),
    ),
  ],
);