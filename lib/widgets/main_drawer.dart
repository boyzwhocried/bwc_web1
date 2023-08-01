import 'package:flutter/material.dart';

class MainDrawer extends StatefulWidget {
  const MainDrawer({super.key});

  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        length: 2,
        vsync: this); // Replace '3' with the number of actions you have
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

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
                        _tabController.animateTo(
                            0); // Replace '0' with the index of the action you want to show
                        setState(() {});
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
                        _tabController.animateTo(
                            1); // Replace '1' with the index of the action you want to show
                        setState(() {});
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
