import 'package:flutter/material.dart';

class NavbarAvatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        child: Image.asset('no-avatar.png'),
        width: 30,
        height: 30,
      ),
    );
  }
}
