import 'package:flutter/material.dart';

class PageHeaderWidget extends StatelessWidget {
  const PageHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 24, 0, 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.movie_creation_outlined, size: 48, color: Theme.of(context).colorScheme.primary,),
          const SizedBox(width: 24),
          Flexible(child: Text('The Fake Movie Database', style: Theme.of(context).textTheme.headline6)),
        ],
      ),
    );
  }
}
