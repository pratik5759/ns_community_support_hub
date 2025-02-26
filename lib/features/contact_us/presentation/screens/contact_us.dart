// import 'package:flutter/material.dart';
// import 'package:ns_community_support_hub/core/app_theme/app_theme.dart';
// import 'package:ns_community_support_hub/core/common_widgets/custom_app_bar.dart';
// import 'package:ns_community_support_hub/core/common_widgets/hero_section_with_page_name.dart';
// import 'package:ns_community_support_hub/core/local/local_strings.dart';
// import '../../../../core/common_widgets/footer_bar.dart';
// import '../../../../core/local/app_constants.dart';
// import '../../../../core/local/local_asstes/local_assets.dart';
// import '../../../about_us/presentation/widgets/about_mission.dart';
// import '../widgets/conatct.dart';
// import '../widgets/contacts_review.dart';
// import '../widgets/why_choose.dart';
//
// class ContactScreen extends StatefulWidget {
//   const ContactScreen({super.key});
//
//   @override
//   State<ContactScreen> createState() => _ContactScreenState();
// }
//
// class _ContactScreenState extends State<ContactScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.white,
//         extendBodyBehindAppBar: true,
//         //backgroundColor: AppTheme.primaryColor,
//         appBar: CustomAppBar(height: 88),
//         body: SingleChildScrollView(
//             child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//
//                   HeroSectionWithPageName(pageName: LocalStrings.contactHeading,),
//               // LayoutBuilder(
//               //   builder: (context, constraints) {
//               //     double maxWidth = constraints.maxWidth;
//               //     bool isSmallScreen = maxWidth < 900;
//               //
//               //     return Container(
//               //       color: AppTheme.primaryColor,
//               //       width: isSmallScreen ? maxWidth : 1680,
//               //       // Adjust width
//               //       // height: 291,
//               //       height: 250,
//               //       // Fixed height
//               //
//               //       alignment: Alignment.center,
//               //       padding: EdgeInsets.symmetric(
//               //           horizontal: isSmallScreen ? 16 : 32),
//               //       // Responsive padding
//               //       child: Center(
//               //         child: Text(
//               //           LocalStrings.contactHeading,
//               //           style: TextStyle(
//               //             fontSize: isSmallScreen ? 24 : 32,
//               //             fontWeight: FontWeight.bold,
//               //             color: Colors.white,
//               //           ),
//               //           textAlign: TextAlign.center,
//               //         ),
//               //       ),
//               //     );
//               //   },
//               // ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 20,left: 20),
//                 child: ContactSection(),
//               ),
//
//
//                   LayoutBuilder(
//                     builder: (context, constraints) {
//                       double maxWidth = constraints.maxWidth;
//                       bool isSmallScreen = maxWidth < 900;
//
//                       return Padding(
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 24, vertical: 32),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             // Left: Image
//
//                             // Right: Heading & Paragraph
//                             Expanded(
//                               flex: 3,
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   SizedBox(height: 16),
//                                   Padding(
//                                     padding: EdgeInsets.symmetric(
//                                       horizontal:
//                                       AppConstants.fullPagePaddingHorizontal,
//                                     ),
//                                     child: ContactReview(),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             SizedBox(width: isSmallScreen ? 16 : 32), // Spacing
//
//                             Expanded(
//                               flex: isSmallScreen ? 1 : 2,
//                               child: Image.asset(
//                                 LocalAssets.coImage,
//                                 // width: isSmallScreen ? maxWidth * 0.8 : 400,
//                                 // height: isSmallScreen ? 200 : 300,
//                                 width: 550, // Fixed width
//                                 height: 300, // Fixed height
//                                 fit: BoxFit.fitHeight,
//                               ),
//                             ),
//                           ],
//                         ),
//                       );
//                     },
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(left: 20),
//                     child: WhyChoose(),
//                   ),
//
//
//
//
//                   SizedBox(height: 60),
//
//
//                   FooterBar()
//                 ]
//             )
//         )
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:ns_community_support_hub/core/common_widgets/custom_app_bar.dart';
import 'package:ns_community_support_hub/core/common_widgets/hero_section_with_page_name.dart';
import 'package:ns_community_support_hub/core/local/local_strings.dart';
import '../../../../core/common_widgets/footer_bar.dart';
import '../../../../core/local/app_constants.dart';
import '../../../../core/local/local_asstes/local_assets.dart';
import '../widgets/conatct.dart';
import '../widgets/contacts_review.dart';
import '../widgets/why_choose.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(height: 88,scaffoldKey: AppConstants.scaffoldKey,),
      body: LayoutBuilder(
        builder: (context, constraints) {
          double maxWidth = constraints.maxWidth;
          bool isSmallScreen = maxWidth < 900;

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeroSectionWithPageName(pageName: LocalStrings.contactHeading),
                SizedBox(height: 20),
                ContactSection(),
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: isSmallScreen ? 1 : 3,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: AppConstants.fullPagePaddingHorizontal),
                        child: ContactReview(),
                      ),
                    ),
                    SizedBox(width: isSmallScreen ? 16 : 32),
                    Expanded(
                      flex: isSmallScreen ? 1 : 2,
                      child: Image.asset(
                        LocalAssets.coImage,
                        width: isSmallScreen ? maxWidth * 0.8 : 550,
                        height: isSmallScreen ? 200 : 300,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 40),
                WhyChoose(),
                SizedBox(height: 60),
                FooterBar(),
              ],
            ),
          );
        },
      ),
    );
  }
}

//
// import 'package:flutter/material.dart';
// import 'package:ns_community_support_hub/core/local/local_strings.dart';
// import '../../../../core/services/firestore_service.dart';
// import '../../model/conatct_model.dart';
//
//
// class ContactSection extends StatefulWidget {
//
//   @override
//   _ContactSectionState createState() => _ContactSectionState();
// }
//
// class _ContactSectionState extends State<ContactSection> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _messageController = TextEditingController();
//   final ContactFormService _firestoreService = ContactFormService();
//
//   void _submitForm() async {
//     if (_formKey.currentState!.validate()) {
//       ContactForm contact = ContactForm(
//         name: _nameController.text.trim(),
//         email: _emailController.text.trim(),
//         message: _messageController.text.trim(),
//         timestamp: DateTime.now(),
//       );
//
//       //await _firestoreService.submitContactForm(contact);
//
//       // Show success message
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Message Sent Successfully!')),
//       );
//
//       // Clear the form
//       _nameController.clear();
//       _emailController.clear();
//       _messageController.clear();
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.all(16.0),
//       child: Form(
//         key: _formKey,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(LocalStrings.contactHeading, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
//             SizedBox(height: 20),
//             TextFormField(
//               controller: _nameController,
//               decoration: InputDecoration(labelText: 'Name'),
//               validator: (value) => value!.isEmpty ? 'Please enter your name' : null,
//             ),
//             SizedBox(height: 10),
//             TextFormField(
//               controller: _emailController,
//               decoration: InputDecoration(labelText: 'Email'),
//               validator: (value) => value!.contains('@') ? null : 'Enter a valid email',
//             ),
//             SizedBox(height: 10),
//             TextFormField(
//               controller: _messageController,
//               decoration: InputDecoration(labelText: 'Message'),
//               maxLines: 4,
//               validator: (value) => value!.isEmpty ? 'Please enter a message' : null,
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _submitForm,
//               child: Text('Submit'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
//
// import 'package:flutter/material.dart';
//
// import '../../../../core/services/firestore_service.dart';
//
// class ContactScreen extends StatefulWidget {
//   const ContactScreen({super.key});
//
//   @override
//   State<ContactScreen> createState() => _ContactScreenState();
// }
//
// class _ContactScreenState extends State<ContactScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final _nameController = TextEditingController();
//   final _emailController = TextEditingController();
//   final _messageController = TextEditingController();
//   final ContactFormService contactFormService = ContactFormService();
//
//   void _submitForm() {
//     if (_formKey.currentState!.validate()) {
//       contactFormService.submitContactForm(
//         _nameController.text,
//         _emailController.text,
//         _messageController.text,
//       ).then((_) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text("Form submitted successfully!")),
//         );
//         _nameController.clear();
//         _emailController.clear();
//         _messageController.clear();
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Contact Us")),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               TextFormField(
//                 controller: _nameController,
//                 decoration: InputDecoration(labelText: "Name"),
//                 validator: (value) => value!.isEmpty ? "Enter your name" : null,
//               ),
//               TextFormField(
//                 controller: _emailController,
//                 decoration: InputDecoration(labelText: "Email"),
//                 validator: (value) =>
//                 value!.isEmpty || !value.contains("@") ? "Enter a valid email" : null,
//               ),
//               TextFormField(
//                 controller: _messageController,
//                 decoration: InputDecoration(labelText: "Message"),
//                 maxLines: 3,
//                 validator: (value) => value!.isEmpty ? "Enter your message" : null,
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: _submitForm,
//                 child: Text("Submit"),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//


// import 'package:flutter/material.dart';
// import '../../../../core/services/firestore_service.dart';
//
// class ContactScreen extends StatefulWidget {
//   const ContactScreen({super.key});
//
//   @override
//   State<ContactScreen> createState() => _ContactScreenState();
// }
//
// class _ContactScreenState extends State<ContactScreen> {
//   final ContactFormService contactFormService = ContactFormService();
//   List<Map<String, dynamic>> contactMessages = [];
//
//   @override
//   void initState() {
//     super.initState();
//     _fetchContacts(); // Call the function when the screen loads
//   }
//
//   Future<void> _fetchContacts() async {
//     List<Map<String, dynamic>> contacts = await contactFormService.getContactForms();
//     setState(() {
//       contactMessages = contacts;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Contact Us")),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               itemCount: contactMessages.length,
//               itemBuilder: (context, index) {
//                 final contact = contactMessages[index];
//                 return ListTile(
//                   title: Text(contact['name']),
//                   subtitle: Text(contact['message']),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
