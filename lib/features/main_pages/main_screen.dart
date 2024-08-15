import 'package:flutter/material.dart';
import 'package:pettodo/features/main_pages/pages/dashboard_page.dart';
import 'package:pettodo/features/main_pages/pages/pets_page.dart';
import 'package:pettodo/features/main_pages/pages/pomo_page.dart';
import 'package:pettodo/features/main_pages/pages/profile_page.dart';
import 'package:pettodo/features/task_habit_manager.dart/pages/add_task.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  // List of widgets representing different screens
  final List<Widget> _screens = [
    const DashboardPage(),
    const PetsPage(),
    const AddTaskScreen(),
    const PomoPage(),
    const ProfilePage(),
    // Add your screen widgets here
  ];

  void _onItemTapped(int index) {
    if (index != 2) {
      setState(() {
        _selectedIndex = index;
      });
    } else {
      //temporary function
      setState(() {
        _selectedIndex = index;
      });
      //pop up addtask & addhabit button (the return of this is the 0 or 1 screen index)
      //if taskbtn or habitbtn
      //change to another screen for addtask or addhabit
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex], // Display the selected screen
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Color(0xFF2B2B2E),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.pets,
              color: Color(0xFF2B2B2E),
            ),
            label: 'Pets',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_circle,
              color: Color(0xFF2B2B2E),
            ),
            label: 'Add Task',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.timer,
              color: Color(0xFF2B2B2E),
            ),
            label: 'Pomo',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: Color(0xFF2B2B2E),
            ),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
