import 'package:flutter/material.dart';

void main() {
  runApp(FlutterTips());
}

final GlobalKey<NavigatorState> rootNavigationkey =
    new GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> homeNavigationkey =
    new GlobalKey<NavigatorState>();

class FlutterTips extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: router,
      initialRoute: '/',
      navigatorKey: rootNavigationkey,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            title: Text('progress'),
          ),
        ],
        currentIndex: _tabIndex,
        onTap: (index) {
          setState(() {
            _tabIndex = index;
          });
        },
      ),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Offstage(
            offstage: _tabIndex != 0,
            child: HomeNavigator(),
          ),
          Offstage(
            offstage: _tabIndex != 1,
            child: ProgressMenu(),
          ),
        ],
      ),
    );
  }
}

class HomeNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: '/homeTab/menu',
      onGenerateRoute: (RouteSettings settings) {
        print(settings);
        WidgetBuilder builder;
        switch (settings.name) {
          case '/homeTab/submenu':
            builder = (BuildContext _) => HomeSubMenu();
            break;
          case '/homeTab/menu':
            builder = (BuildContext _) => HomeMenu();
            break;
          default:
            builder = (BuildContext _) => HomeMenu();
        }
        return MaterialPageRoute(builder: builder, settings: settings);
      },
      key: homeNavigationkey,
    );
    // return MaterialApp(
    //   routes: homeRouter,
    //   initialRoute: '/homeTab/menu',
    //   navigatorKey: homeNavigationkey,
    // );
  }
}

class HomeMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('homemenu')),
      body: Column(
        children: [
          RaisedButton(
            onPressed: () => rootNavigationkey.currentState.pushNamed('/login'),
            child: Text('go to login'),
          ),
          RaisedButton(
            onPressed: () =>
                homeNavigationkey.currentState.pushNamed('/homeTab/submenu'),
            child: Text('go to submenu'),
          ),
        ],
      ),
    );
  }
}

class HomeSubMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('homesubmenu')),
      body: Center(
        child: Text('homeSubmenu'),
      ),
    );
  }
}

class ProgressMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('ProgressMenu'),
    );
  }
}

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Text('Login'),
      ),
    );
  }
}

// routing
Map<String, WidgetBuilder> router = {
  '/': (BuildContext context) => MyHomePage(title: '/'),
  '/login': (BuildContext context) => Login(),
};

Map<String, WidgetBuilder> homeRouter = {
  '/homeTab/menu': (BuildContext context) => HomeMenu(),
  '/homeTab/submenu': (BuildContext context) => HomeSubMenu(),
};
