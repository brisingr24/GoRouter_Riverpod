import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SidebarScaffold extends StatelessWidget {
  final Widget child;
  const SidebarScaffold({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [const Menu(), Expanded(child: child)],
    );
  }
}

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: 300,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Card(
        child: Column(
          children: <Widget>[
            const SizedBox(height:40),
            const Text("Oh-To-Do",style: TextStyle(fontSize: 32,letterSpacing: 3,wordSpacing: 3),),
            SizedBox(height: MediaQuery.of(context).size.height/4,),
            ListTile(
              title: const Text("Screen A"),
              leading: const Icon(Icons.home),
              onTap: () {
                GoRouter.of(context).push('/a');
              },
            ),
            ListTile(
              title: const Text("Screen B"),
              leading: const Icon(Icons.explore),
              onTap: () {
                GoRouter.of(context).push('/b');
              },
            ),
            ListTile(
              title: const Text("Screen C"),
              leading: const Icon(Icons.settings),
              onTap: () {
                GoRouter.of(context).push('/c');
              },
            ),
          ],
        ),
      ),
    );
  }
}
