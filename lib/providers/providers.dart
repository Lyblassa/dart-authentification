// lib/providers/providers.dart

import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../repositories/auth_repository.dart';
// Plus tard tu peux ajouter :
// import '../repositories/progress_repository.dart';
// import '../repositories/leaderboard_repository.dart';

/// Liste de tous tes Providers globaux
List<SingleChildWidget> appProviders = [
  Provider<AuthRepository>(create: (_) => AuthRepository()),

  // Ajoute d'autres ici
  // Provider<ProgressRepository>(create: (_) => ProgressRepository()),
  // Provider<LeaderboardRepository>(create: (_) => LeaderboardRepository()),
];
