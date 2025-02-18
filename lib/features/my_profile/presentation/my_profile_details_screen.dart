// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:ns_community_support_hub/core/services/auth_service.dart';
// import 'package:ns_community_support_hub/core/services/models/user_model.dart';
//
// class MyProfileDetailsScreen extends StatefulWidget {
//   MyProfileDetailsScreen({Key? key, required this.title}) : super(key: key);
//
//   final String title;
//
//   @override
//   _MyProfileDetailsScreenState createState() => _MyProfileDetailsScreenState();
// }
//
// class _MyProfileDetailsScreenState extends State<MyProfileDetailsScreen> {
//
//   UserModel? user;
//
//   Future<void> getUser() async {
//     user = await AuthService().getStoredUser();
//   }
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     getUser();
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             CircleAvatar(
//               radius: 50,
//               backgroundColor: Colors.grey[300],
//               child: user?.photoUrl != null && user!.photoUrl!.isNotEmpty
//                   ? ClipRRect(
//                 borderRadius: BorderRadius.circular(50), // Keeps the circular shape
//                 child: CachedNetworkImage(
//                   imageUrl: user!.photoUrl,
//                   fit: BoxFit.cover,
//                   errorWidget: (context, url, error) => Icon(
//                     Icons.person,
//                     size: 50,
//                     color: Colors.grey[600],
//                   ),
//                 ),
//               )
//                   : Icon(Icons.person, size: 50, color: Colors.grey[600]),
//             ),
//             SizedBox(height: 20),
//             Text(
//               user?.name ?? '',
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 10),
//             Text(
//               user?.email ?? '',
//               style: TextStyle(fontSize: 16),
//             ),
//             SizedBox(height: 30),
//             _buildInfoCard('Name', user?.name ?? ''),
//             SizedBox(height: 20),
//             _buildInfoCard('Email', user?.email ?? ''),
//             SizedBox(height: 20),
//             /*_buildInfoCard('Phone', user?. ?? ''),*/
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildInfoCard(String label, String value) {
//     return Container(
//       padding: EdgeInsets.all(16), decoration: BoxDecoration(
//       color: Colors.white,
//       borderRadius: BorderRadius.circular(8),
//       boxShadow: [
//         BoxShadow(
//           color: Colors.grey.withOpacity(0.2),
//           spreadRadius: 2,
//           blurRadius: 5,
//           offset: Offset(0, 3),
//         ),
//       ],
//     ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: <Widget>[
//           Text(
//             label,
//             style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
//           ),
//           Text(
//             value,
//             style: TextStyle(fontSize: 16),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ns_community_support_hub/core/common_widgets/custom_app_bar.dart';
import 'package:ns_community_support_hub/features/my_profile/my_screen_provider.dart';
import 'package:provider/provider.dart';
import 'package:ns_community_support_hub/core/services/models/user_model.dart';

class MyProfileDetailsScreen extends StatefulWidget {
  const MyProfileDetailsScreen({Key? key}) : super(key: key);


  @override
  _MyProfileDetailsScreenState createState() => _MyProfileDetailsScreenState();
}

class _MyProfileDetailsScreenState extends State<MyProfileDetailsScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<MyScreenProvider>(context, listen: false).fetchUser());
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MyScreenProvider>(
      builder: (context, provider, child) {
        final UserModel? user = provider.user;

        // if (user == null) {
        //   return const Center(child: CircularProgressIndicator()); // Loading state
        // }

        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: CustomAppBar(),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.grey[300],
                  child: user?.photoUrl != null && user!.photoUrl.isNotEmpty
                      ? ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: CachedNetworkImage(
                      imageUrl: user.photoUrl!,
                      fit: BoxFit.cover,
                      errorWidget: (context, url, error) => Icon(
                        Icons.person,
                        size: 50,
                        color: Colors.grey[600],
                      ),
                    ),
                  )
                      : Icon(Icons.person, size: 50, color: Colors.grey[600]),
                ),
                const SizedBox(height: 20),
                Text(
                  user?.name ?? 'Unknown User',
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text(
                  user?.email ?? 'No Email',
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 30),
                _buildInfoCard('Name', user?.name ?? ''),
                const SizedBox(height: 20),
                _buildInfoCard('Email', user?.email ?? ''),
                const SizedBox(height: 20),
                //
                // // Logout Button
                // const Spacer(), // Pushes button to bottom
                Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton.icon(
                    onPressed: () => provider.logOut(),
                    icon: const Icon(Icons.logout),
                    label: const Text("Logout"),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                      textStyle: const TextStyle(fontSize: 16),
                      backgroundColor: Colors.redAccent,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildInfoCard(String label, String value) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            label,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}

