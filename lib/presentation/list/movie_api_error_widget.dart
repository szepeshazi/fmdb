import 'package:flutter/material.dart';

class MovieApiErrorWidget extends StatelessWidget {
  const MovieApiErrorWidget({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Icon(
            Icons.heart_broken_sharp,
            size: 32,
          ),
          const SizedBox(height: 24),
          Text('Ah, snap.', style: Theme.of(context).textTheme.headline5),
          const SizedBox(height: 24),
          Text('Seems like our Fake Movie API service is down at the moment.',
              style: Theme.of(context).textTheme.headline5),
          const SizedBox(height: 24),
          Text('Please check back later.', style: Theme.of(context).textTheme.headline5),
          const SizedBox(height: 24),
          Text('More info: $message', style: Theme.of(context).textTheme.bodyText1),
        ],
      ),
    );
  }
}
