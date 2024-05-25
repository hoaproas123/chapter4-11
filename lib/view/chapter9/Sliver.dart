import 'package:flutter/material.dart';
import 'package:sumary/view/chapter9/SliverAppBarWidget.dart';
import 'package:sumary/view/chapter9/SliverGridWidget.dart';
import 'package:sumary/view/chapter9/SliverListWidget.dart';
class Sliver extends StatefulWidget {
  const Sliver({super.key});

  @override
  State<Sliver> createState() => _SliverState();
}

class _SliverState extends State<Sliver> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        const SliverAppBarWidget(),
        const SliverListWidget(),
        const SliverGridWidget(),
      ],
    );
  }
}
