import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ns_community_support_hub/core/app_routes/route_names.dart';
// class AnimatedPopupMenu extends StatefulWidget {
//
//   final VoidCallback onDismiss;
//
//   const AnimatedPopupMenu({Key? key, required this.onDismiss}) : super(key: key);
//
//   @override
//   _AnimatedPopupMenuState createState() => _AnimatedPopupMenuState();
// }
//
// class _AnimatedPopupMenuState extends State<AnimatedPopupMenu>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<Offset> _offsetAnimation;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       duration: Duration(milliseconds: 300),
//       vsync: this,
//     );
//     _offsetAnimation = Tween<Offset>(
//       begin: Offset(1.5, -1.5), // Start from the top-right corner
//       end: Offset(0, 0), // Move to normal position
//     ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
//
//     _controller.forward();
//   }
//
//   void _closeMenu() {
//     _controller.reverse().then((_) {
//       widget.onDismiss();
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         // Background to dismiss the menu on tap
//         Positioned.fill(
//           child: GestureDetector(
//             onTap: _closeMenu,
//             child: Container(color: Colors.transparent),
//           ),
//         ),
//         Positioned(
//           top: 60, // Adjust this based on AppBar height
//           right: 10,
//           child: SlideTransition(
//             position: _offsetAnimation,
//             child: Material(
//               color: Colors.white,
//               elevation: 4,
//               borderRadius: BorderRadius.circular(12),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   _menuItem("Home", Icons.home, WebRouteNames.home),
//                   _menuItem("Profile", Icons.person, WebRouteNames.profileDetails),
//                   //_menuItem("Settings", Icons.settings, WebRouteNames.settings),
//                   _menuItem("Logout", Icons.logout, ""),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _menuItem(String title, IconData icon, String route) {
//     return ListTile(
//       leading: Icon(icon, color: Colors.black),
//       title: Text(title),
//       onTap: () {
//         _closeMenu();
//         if (route.isNotEmpty) {
//           context.go(route);
//         }
//       },
//     );
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
// }


class AnimatedPopupMenu extends StatefulWidget {
  final VoidCallback onDismiss;

  const AnimatedPopupMenu({Key? key, required this.onDismiss}) : super(key: key);

  @override
  _AnimatedPopupMenuState createState() => _AnimatedPopupMenuState();
}

class _AnimatedPopupMenuState extends State<AnimatedPopupMenu>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(1.5, -1.5), // Start from top-right
      end: Offset.zero, // Move to normal position
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) _controller.forward();
    });
  }

  void _closeMenu() {
    _controller.reverse().then((_) {
      if (mounted) widget.onDismiss();
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 600;

    // Responsive width & height
    final double popupWidth = isMobile ? size.width * 0.8 : 250;
    final double popupHeight = isMobile ? size.height * 0.6 : 300;

    return Stack(
      children: [
        // Tap outside to close the menu
        Positioned.fill(
          child: GestureDetector(
            onTap: _closeMenu,
            child: Container(color: Colors.transparent),
          ),
        ),
        Positioned(
          top: isMobile ? size.height * 0.2 : 80, // Adjust position for mobile
          right: isMobile ? size.width * 0.1 : 20, // Centering for mobile
          child: SlideTransition(
            position: _offsetAnimation,
            child: Material(
              color: Colors.white,
              elevation: 4,
              borderRadius: BorderRadius.circular(12),
              child: Container(
                width: popupWidth,
                height: popupHeight,
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _menuItem("Home", Icons.home, "/home"),
                    _menuItem("Profile", Icons.person, "/profile"),
                    _menuItem("Settings", Icons.settings, "/settings"),
                    _menuItem("Logout", Icons.logout, ""),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _menuItem(String title, IconData icon, String route) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(title),
      onTap: () {
        _closeMenu();
        if (route.isNotEmpty) {
          context.go(route);
        }
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}


