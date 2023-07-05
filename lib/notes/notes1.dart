import 'package:flutter/material.dart';
import 'package:notes_app/style/NotesTheme.dart';

class Notes1 extends StatefulWidget {
  const Notes1({Key? key}) : super(key: key);

  @override
  _NotesState createState() => _NotesState();
}

class _NotesState extends State<Notes1> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _toggleDrawer() {
    if (_scaffoldKey.currentState?.isDrawerOpen ?? false) {
      Navigator.of(context).pop();
    } else {
      _scaffoldKey.currentState?.openDrawer();
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: NotesTheme.backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false, // Disable back button
        backgroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.white,
              ),
              onPressed: () {
                _toggleDrawer(); // Toggle drawer on menu icon press
              },
            ),
            Text(
              'MAMS',
              style: TextStyle(
                color: NotesTheme.highlightColor,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.logout,
                color: Colors.white,
              ),
              onPressed: () {
                // Handle logout icon press
              },
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Payments'),
              onTap: () {
                // Handle Payments item press
              },
            ),
            ListTile(
              title: Text('Recharge'),
              onTap: () {
                // Handle Recharge item press
              },
            ),
            ListTile(
              title: Text('Profile'),
              onTap: () {
                // Handle Profile item press
              },
            ),
          ],
        ),
      ),
      body: Container(
          // Add your body content here
          ),
    );
  }
}
