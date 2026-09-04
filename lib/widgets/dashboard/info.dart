import 'package:flutter/material.dart';

class Info extends StatefulWidget {
  final String text;
  const Info({super.key, required this.text});

  @override
  State<Info> createState() => _Info();
}

class _Info extends State<Info> {
  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.amber, child: Text(widget.text));
  }
}
