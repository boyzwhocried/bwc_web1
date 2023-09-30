import 'package:flutter/material.dart';

class SideDrawer extends StatelessWidget {
  // Constructor for the SideDrawer widget.
  const SideDrawer({
    Key? key,
    required this.updateCallback,
  }) : super(key: key);

  // Callback function to update the selected item.
  final Function(int) updateCallback;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: [
          // Close button in the top-right corner.
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
                    // List item for exploring.
                    ListTile(
                      onTap: () {
                        Navigator.pop(context);
                        updateCallback(1);
                      },
                      title: const Text(
                        'Explore',
                        style: TextStyle(fontSize: 24),
                        textAlign: TextAlign.right,
                      ),
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 30),
                    ),
                    // List item for about.
                    ListTile(
                      onTap: () {
                        Navigator.pop(context);
                        updateCallback(2);
                      },
                      title: const Text(
                        'About',
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
