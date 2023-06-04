import 'package:eliteware/features/home/viewmodel/home_viewmodel.dart';
import 'package:eliteware/features/stopwatch/views/stop_watch_screen.dart';
import 'package:eliteware/features/timer/views/timer_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeViewmodel>(
      create: (context) => HomeViewmodel(),
      child: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final homeVm = context.watch<HomeViewmodel>();
    return Scaffold(
      appBar: AppBar(),
      body: homeVm.currentIndex == 0
          ? const StopwatchScreen()
          : const TimerScreen(),
      bottomNavigationBar: BottomNavigationBar(
          iconSize: 20,
          selectedItemColor: Colors.purple,
          unselectedItemColor: Colors.grey,
          backgroundColor: Colors.white,
          currentIndex: homeVm.currentIndex,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          elevation: 5,
          type: BottomNavigationBarType.fixed,
          onTap: (index) => homeVm.changeIndexBottomtab(index),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.watch_rounded),
              label: "Stop Watch",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.timer),
              label: "Timer",
            ),
          ]),
    );
  }
}
