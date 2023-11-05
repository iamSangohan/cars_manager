import 'package:cars_manager/app_screens/accueil.dart';
import 'package:cars_manager/app_screens/parametre.dart';
import 'package:flutter/material.dart';

class NavigationDrawer extends StatefulWidget {
  const NavigationDrawer({super.key});

  @override
  State<NavigationDrawer> createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  final padding = const EdgeInsets.symmetric(horizontal: 20);

  
  @override
  Widget build(BuildContext context) {
    const name = 'MENSAH Luc';
    const email = 'jforcelucg@gmail.com';
    const urlImage = 'https://avatars.githubusercontent.com/u/55942632?v=4';

    return Drawer(
      child: Material(
        color: Colors.blue,
        child: ListView(
          // padding: padding,
          children: <Widget>[
            const SizedBox(height: 15),
            buildHeader(
              urlImage: urlImage,
              name: name,
              email: email,
            ),
            const Divider(color: Colors.white70, height: 40, thickness: 0.5),
            Container(
              padding: padding,
              child: Column(
                children: [
                  buildMenuItem(
                    text: 'Accueil',
                    icon: Icons.home,
                    onClicked: () => selectedItem(context, 0),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Parametre',
                    icon: Icons.settings,
                    onClicked: () => selectedItem(context, 1),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Deconnexion',
                    icon: Icons.logout,
                    onClicked: () => selectedItem(context, 2),
                  ),
                ],
              )
            )
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem({required String text, required IconData icon, VoidCallback? onClicked}) {
    const color = Colors.white;
    const hoverColor = Colors.white70;
    
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: const TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();

    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const AccueilScreen(),
        ));
        
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const ParametreScreen(),
        ));
        break;
      case 2:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const ParametreScreen(),
        ));
        break;
    }
  }
  
  Widget buildHeader({required String urlImage, required String name, required String email}) {
    return InkWell(
      child: Container(
        padding: padding.add(const EdgeInsets.symmetric(vertical: 15)),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30, 
              backgroundImage: NetworkImage(urlImage)
            ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                ),
                const SizedBox(height: 4),
                Text(
                  email,
                  style: const TextStyle(fontSize: 14, color: Colors.white),
                ),
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}