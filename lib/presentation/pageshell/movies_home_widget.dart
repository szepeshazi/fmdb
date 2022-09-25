import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'page_header_widget.dart';

class MoviesHomeWidget extends ConsumerWidget {
  const MoviesHomeWidget({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: PageHeaderWidget(),
      ),
      body: child,
    );
  }
}

