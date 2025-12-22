import 'package:exercise_flutter_acs/requests.dart';
import 'package:exercise_flutter_acs/tree.dart';
import 'package:flutter/material.dart';

class AppbarPers extends StatefulWidget implements PreferredSizeWidget {
  final String id;
  final VoidCallback onStateChanged;
  const AppbarPers({super.key, required this.id, required this.onStateChanged});

  @override
  State<AppbarPers> createState() => _AppbarPersState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _AppbarPersState extends State<AppbarPers> {
  late IconData favouriteIcon = Icons.favorite_border;
  late IconData lockedAreaIcon = Icons.lock_outline;
  late Future<Tree> futureTree;
  Area? root;
  late String state;

  @override
  void initState() {
    super.initState();

    futureTree = getTree(widget.id);
    state = 'lock';
  }

  void _addFavourites() {
    root!.favourite = !root!.favourite;

    setState(() {
      favouriteIcon = root!.favourite ? Icons.favorite : Icons.favorite_border;
    });
  }

  void _lockUnlockArea() {
    setState(() {
      if (state == 'lock') {
        lockedAreaIcon = Icons.lock_open;
        state = 'unlock';
        unlockArea(root!);
      } else {
        lockedAreaIcon = Icons.lock_outline;
        state = 'lock';
        lockArea(root!);
      }

      widget.onStateChanged();
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Tree>(
      future: futureTree,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          // QUAN LES DADES ARRIBEN:
          root = snapshot.data!.root;

          return AppBar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            foregroundColor: Theme.of(context).colorScheme.onPrimary,
            automaticallyImplyLeading: !(root!.id == "building"),
            title: Text(root!.id),
            centerTitle: true,
            actions: [
              IconButton(onPressed: _addFavourites, icon: Icon(favouriteIcon)),
              IconButton(
                  onPressed: _lockUnlockArea, icon: Icon(lockedAreaIcon)),
            ],
          );
        } else if (snapshot.hasError) {
          return Scaffold(
              body: Center(child: Text("Error: ${snapshot.error}")));
        }
        // MENTRE ESPEREM: Mostrem la rodeta de càrrega
        return const Scaffold(body: Center(child: CircularProgressIndicator()));
      },
    );
  }
}
