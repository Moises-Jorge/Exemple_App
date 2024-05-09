import 'package:exemplo/pages/pageViews/one_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController();

  int indexBottomNavBar = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AppBar'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text('Moises Jorge'),
              accountEmail: Text('moisesjorge30@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.purpleAccent,
                child: Text('MJ'),
              ),
            ),
            ListTile(
              title: const Text('Item 1'),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                _pageController.jumpToPage(0);
                Navigator.pop(context);
                setState(() {
                  indexBottomNavBar = 0;
                });
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                _pageController.jumpToPage(1);
                Navigator.pop(context);
                setState(() {
                  indexBottomNavBar = 1;
                });
              },
            ),
            ListTile(
              title: const Text('Item 3'),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                _pageController.jumpToPage(2);
                Navigator.pop(context);
                setState(() {
                  indexBottomNavBar = 2;
                });
              },
            ),
          ],
        ),
      ),
      body: PageView(
        controller: _pageController,
        children: [
          const OnePage(),
          Container(
            color: Colors.red,
          ),
          Container(
            color: Colors.yellow,
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indexBottomNavBar,
        onTap: (int indexPage) {
          setState(() {
            indexBottomNavBar = indexPage;
          });
          _pageController.animateToPage(
            indexPage,
            duration: const Duration(milliseconds: 300),
            curve: Curves.ease,
          );
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.local_laundry_service_sharp),
            label: 'Item 1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_laundry_service_sharp),
            label: 'Item 2',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_laundry_service_sharp),
            label: 'Item 3',
          ),
        ],
      ),
    );
  }
}
