import 'package:flutter/material.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({
    super.key,
    required this.updateCallback,
  });

  final Function(int) updateCallback;

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
                      onTap: () {
                        Navigator.pop(context);
                        updateCallback(1);
                      },
                      title: const Text(
                        'explore',
                        style: TextStyle(fontSize: 24),
                        textAlign: TextAlign.right,
                      ),
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 30),
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.pop(context);
                        updateCallback(2);
                      },
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
