import 'package:broadcast_app/broadcast_reciever.dart';
import 'package:flutter/material.dart';

import 'broadcaster.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: IndexedStack(
          index: index,
          children: [
            Visibility(
              child: BroadCaster(),
              visible: index == 0,
              maintainState: true,
            ),
            Visibility(
              visible: index == 1,
              maintainState: true,
              child: BroadcastReciver(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black,
          selectedItemColor: Colors.amber,
          unselectedItemColor: Colors.white,
          onTap: (value) {
            setState(() {
              index = value;
            });
          },
          currentIndex: index,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.send), label: 'Send'),
            BottomNavigationBarItem(
                icon: Icon(Icons.broadcast_on_home_outlined), label: 'Recieve'),
          ]),
    );
  }
}
