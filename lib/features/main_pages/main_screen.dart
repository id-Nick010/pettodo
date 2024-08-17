import 'package:flutter/material.dart';
import 'package:pettodo/features/main_pages/pages/dashboard_page.dart';
import 'package:pettodo/features/main_pages/pages/pets_page.dart';
import 'package:pettodo/features/main_pages/pages/pomo_page.dart';
import 'package:pettodo/features/main_pages/pages/profile_page.dart';
import 'package:pettodo/features/task_habit_manager.dart/pages/add_habit.dart';
import 'package:pettodo/features/task_habit_manager.dart/pages/add_task.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  bool _showAddButtons = true;

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
    if (index == 2) {
      setState(() {
        _showAddButtons = !_showAddButtons;
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
      body: Stack(
        children: [
          _screens[_selectedIndex],
          if (_showAddButtons)
            Positioned(
              bottom:
                  10, // Adjust this to position the buttons above the navbar
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  NavAddButton(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageRouteBuilder(
                                pageBuilder:
                                    (context, animation1, animation2) =>
                                        const AddTaskScreen(),
                                transitionDuration: Duration.zero,
                                reverseTransitionDuration: Duration.zero));
                      },
                      text: "Add Task",
                      colorButton: 0XFFAED6B8),
                  NavAddButton(
                      onTap: () {
                        //this is just temporary
                        Navigator.push(
                            context,
                            PageRouteBuilder(
                                pageBuilder:
                                    (context, animation1, animation2) =>
                                        const AddHabitScreen(),
                                transitionDuration: Duration.zero,
                                reverseTransitionDuration: Duration.zero));
                      },
                      text: "Add Habit",
                      colorButton: 0XFFAED6B8),
                ],
              ),
            ),
        ],
      ), // Display the selected screen
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

//Special Button Design for Navigation Add Task Habit Buttons
class NavAddButton extends StatelessWidget {
  final Function()? onTap;
  final String text;
  final int colorButton;

  const NavAddButton({
    super.key,
    required this.onTap,
    required this.text,
    required this.colorButton,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Color(colorButton),
          borderRadius: BorderRadius.circular(40),
          border: Border.all(color: const Color(0XFF2B2B2E), width: 1.8),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Color(0XFF2B2B2E),
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }
}
