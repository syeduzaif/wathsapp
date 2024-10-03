import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wathsapp_ui_2/call.dart';
import 'package:wathsapp_ui_2/chat.dart';
import 'package:wathsapp_ui_2/comunnity.dart';
import 'package:wathsapp_ui_2/status.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.system; // Manage the current theme mode

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: _themeMode, // Use the selected theme mode
      home: MyHomePage(
        title: 'WhatsApp',
        toggleTheme: toggleTheme, // Pass the updated toggleTheme function
      ),
    );
  }

  // Update the toggleTheme function to accept ThemeMode
  void toggleTheme(ThemeMode themeMode) {
    setState(() {
      _themeMode = themeMode;
    });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title, required this.toggleTheme});

  final String title;
  final Function(ThemeMode) toggleTheme;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ImagePicker imagePicker = ImagePicker();

  Future<void> getImage() async {
    final pickedImage = await imagePicker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      setState(() {}); // Handle the image
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DefaultTabController(
      initialIndex: 1,
      length: 4, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'WhatsApp',
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
          backgroundColor: theme.appBarTheme.backgroundColor,
          actions: [
            IconButton(
              color: Colors.white,
              icon: const Icon(Icons.camera_alt),
              onPressed: getImage,
            ),
            PopupMenuButton<String>(
              onSelected: (value) {
                if (value == 'light') {
                  widget.toggleTheme(ThemeMode.light); // Toggle to light theme
                } else if (value == 'dark') {
                  widget.toggleTheme(ThemeMode.dark); // Toggle to dark theme
                } else if (value == 'system') {
                  widget.toggleTheme(
                      ThemeMode.system); // Toggle to system default theme
                }
              },
              itemBuilder: (BuildContext context) {
                return [
                  const PopupMenuItem(
                    child: Text('New group'),
                  ),
                  const PopupMenuItem(
                    child: Text('New broadcast'),
                  ),
                  const PopupMenuItem(
                    child: Text('Linked devices'),
                  ),
                  const PopupMenuItem(
                    child: Text('Starred messages'),
                  ),
                  const PopupMenuItem(
                    child: Text('Settings'),
                  ),
                  const PopupMenuDivider(), // Divider between menu sections
                  const PopupMenuItem(
                    child: Text('Light Theme'),
                    value: 'light', // Set light theme
                  ),
                  const PopupMenuItem(
                    child: Text('Dark Theme'),
                    value: 'dark', // Set dark theme
                  ),
                  const PopupMenuItem(
                    child: Text('System Default Theme'),
                    value: 'system', // Use system default theme
                  ),
                ];
              },
            ),
          ],
          bottom: const TabBar(
            labelColor: Colors.red,
            indicatorColor: Colors.white,
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: [
              Tab(icon: Icon(Icons.groups_2, color: Colors.white)),
              Tab(child: Text('Chats', style: TextStyle(color: Colors.white))),
              Tab(
                  child:
                      Text('Updates', style: TextStyle(color: Colors.white))),
              Tab(child: Text('Calls', style: TextStyle(color: Colors.white))),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Community(),
            ChatPage(),
            StatusPage(),
            CallPage(),
          ],
        ),
      ),
    );
  }
}

final ThemeData lightTheme = ThemeData(
  primaryColor: const Color(0xFF075E54), // WhatsApp green
  cardColor: const Color.fromARGB(255, 241, 241, 241),
  scaffoldBackgroundColor: Color.fromARGB(255, 248, 248, 248),
  appBarTheme: const AppBarTheme(
    color: Color(0xFF075E54), // AppBar background color
    iconTheme: IconThemeData(color: Colors.white), // AppBar icons color
    titleTextStyle: TextStyle(color: Colors.white, fontSize: 24), // Title style
  ),

  tabBarTheme: const TabBarTheme(
    labelColor: Colors.red, // Color for selected tab label
    unselectedLabelColor: Colors.white, // Color for unselected tab label
    indicatorColor: Colors.white, // Indicator color below the tab
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Color(0xFF25D366), // WhatsApp green for FAB
  ),
  textTheme: const TextTheme(
    displaySmall: TextStyle(
      color: Colors.greenAccent
    ),
    displayLarge: TextStyle(
      color: Colors.white,
    ),
    displayMedium: TextStyle(
      color: Colors.white,
    ),
    bodyMedium: TextStyle(color: Colors.grey), // Default body text color
    bodyLarge: TextStyle(color: Colors.black), // Secondary body text color
  ),
  iconTheme: const IconThemeData(
    color: Color(0xFF075E54), // Default icon color in light mode
  ),
);

final ThemeData darkTheme = ThemeData(
  primaryColor: const Color(0xFF075E54),
  cardColor: const Color.fromARGB(255, 25, 38, 46),
  scaffoldBackgroundColor: const Color.fromARGB(255, 24, 42, 46),
  appBarTheme: const AppBarTheme(
    color: Color.fromARGB(255, 18, 31, 34),
    iconTheme:
        IconThemeData(color: Colors.grey), // AppBar icon color in dark mode
    titleTextStyle: TextStyle(color: Colors.white, fontSize: 24), // Title style
  ),
  tabBarTheme: const TabBarTheme(
    labelColor: Color(0xFF00A884), // Accent color for selected tab label
    unselectedLabelColor: Colors.grey, // Color for unselected tab labels
    indicatorColor: Color(0xFF00A884), // Indicator color below selected tab
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Color(0xFF00A884), // Accent color for FAB in dark mode
  ),
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      color: Color.fromARGB(255, 31, 60, 58),
    ),
    displayMedium: TextStyle(
      color: Color.fromARGB(255, 35, 68, 65),
    ),
      displaySmall: TextStyle(
          color:Color.fromARGB(255, 35, 68, 65),),
    bodyLarge: TextStyle(
        color: Color.fromARGB(
            255, 250, 250, 250)), // Primary text color in dark mode
    bodyMedium: TextStyle(
        color: Color(0xFF8696A0)), // Secondary text color in dark mode
  ),
  iconTheme: const IconThemeData(
    color: Colors.white, // Default icon color in dark mode
  ),
);
