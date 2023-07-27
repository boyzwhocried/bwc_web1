import 'package:bwc_web1/provider/dark_mode_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
          Consumer<DarkModeProvider>(
            builder: (context, darkModeProvider, child) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () {
                            darkModeProvider.toggleDarkMode();
                          },
                          icon: Icon(
                            darkModeProvider.isDarkMode
                                ? Icons.light_mode_outlined
                                : Icons.dark_mode_outlined,
                            size: 36,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
