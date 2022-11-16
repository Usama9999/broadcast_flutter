import 'package:broadcast_app/controllers/navbar_controllers.dart';
import 'package:broadcast_app/lower_part.dart';
import 'package:broadcast_app/upper_part.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    return GetBuilder<NavBarController>(
        init: NavBarController(),
        builder: (value) {
          return Scaffold(
            body: Center(
              child: IndexedStack(
                index: index,
                children: [
                  Visibility(
                    visible: index == 0,
                    maintainState: true,
                    child: const BroadCaster(),
                  ),
                  Visibility(
                    visible: index == 1,
                    maintainState: true,
                    child: const UpperPart(),
                  ),
                  Visibility(
                    visible: index == 2,
                    maintainState: true,
                    child: const LowerPart(),
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
                items: [
                  const BottomNavigationBarItem(
                      icon: Icon(Icons.send), label: 'Send'),
                  BottomNavigationBarItem(
                      icon: Container(
                        padding: const EdgeInsets.all(2),
                        height: 30,
                        width: 27,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(3)),
                        child: Column(
                          children: [
                            Expanded(
                              child: Container(
                                height: 30,
                                width: 25,
                                decoration: BoxDecoration(
                                    color: Colors.brown.shade200,
                                    borderRadius: BorderRadius.circular(3)),
                                child: Column(
                                  children: [],
                                ),
                              ),
                            ),
                            Expanded(child: Container())
                          ],
                        ),
                      ),
                      label: value.upper),
                  BottomNavigationBarItem(
                      icon: Container(
                        padding: const EdgeInsets.all(2),
                        height: 30,
                        width: 27,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(3)),
                        child: Column(
                          children: [
                            Expanded(child: Container()),
                            Expanded(
                              child: Container(
                                height: 30,
                                width: 25,
                                decoration: BoxDecoration(
                                    color: Colors.brown.shade200,
                                    borderRadius: BorderRadius.circular(3)),
                                child: Column(
                                  children: [],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      label: value.lower),
                ]),
          );
        });
  }
}
