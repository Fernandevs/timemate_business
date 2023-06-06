import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget? leading;
  final Widget? trailing;
  final VoidCallback onTap;

  const Item({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.leading,
    this.trailing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: trailing,
        leading: leading,
        onTap: onTap,
      ),
    );
  }
}
