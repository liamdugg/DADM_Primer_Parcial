import 'package:go_router/go_router.dart';
import 'package:primer_parcial/presentation/screens/home_screen.dart';
import 'package:primer_parcial/presentation/screens/edit_screen.dart';
import 'package:primer_parcial/presentation/screens/login_screen.dart';
import 'package:primer_parcial/presentation/screens/details_screen.dart';
import 'package:primer_parcial/presentation/screens/profile_screen.dart';
import 'package:primer_parcial/presentation/screens/settings_screen.dart';
import 'package:primer_parcial/presentation/screens/add_album_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/home/add',
  routes: [
    
    GoRoute(
      path: '/login',
      builder:(context, state) => LoginScreen(),
    ),

    GoRoute(
      path: '/home',
      builder:(context, state) => const HomeScreen(),
    ),
    
    GoRoute(
      path: '/home/details/:id',
      builder:(context, state) {
        return DetailsScreen(albumId: int.tryParse(state.pathParameters['id']!) ?? 0);
      },
    ),
    
    GoRoute(
      path: '/settings',
      builder:(context, state) => const SettingsScreen(),
    ),
    
    // Album Edit Screen
    GoRoute(
      path: '/home/details/editor/:id',
      builder:(context, state) => const EditScreen(),
    ),

    // Profile Screen
    GoRoute(
      path: '/profile/:user',
      builder:(context, state) => const ProfileScreen(),
    ),

    GoRoute(
      path: '/home/add',
      builder: (context, state) => const AddAlbumScreen(),
    )
  ],
);