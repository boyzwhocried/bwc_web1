import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.close,
                    size: 36,
                  ),
                  padding: const EdgeInsets.all(7),
                ),
              ],
            ),
          ),
          Column(
            children: [
              const Spacer(),
              SizedBox(
                child: Column(
                  children: [
                    ListTile(
                      onTap: () {},
                      title: const Text(
                        'explore',
                        style: TextStyle(fontSize: 24),
                        textAlign: TextAlign.right,
                      ),
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 30),
                    ),
                    ListTile(
                      onTap: () {},
                      title: const Text(
                        'about',
                        style: TextStyle(fontSize: 24),
                        textAlign: TextAlign.right,
                      ),
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 30),
                    ),
                  ],
                ),
              ),
              const Spacer(),
            ],
          ),
        ],
      ),
    );
  }
}
