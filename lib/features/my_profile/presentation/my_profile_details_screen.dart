import 'package:flutter/material.dart';

class MyProfileDetailsScreen extends StatefulWidget {
  MyProfileDetailsScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyProfileDetailsScreenState createState() => _MyProfileDetailsScreenState();
}

class _MyProfileDetailsScreenState extends State<MyProfileDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.grey[300],
              child: Icon(Icons.person, size: 50, color: Colors.grey[600]),
            ),
            SizedBox(height: 20),
            Text(
              'Shivraj Ahirekar',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'shivrajahhirekar97@gmail.com',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 30),
            _buildInfoCard('Name', 'Shivraj Ahirekar'),
            SizedBox(height: 20),
            _buildInfoCard('Email', 'shivrajahhirekar97@gmail.com'),
            SizedBox(height: 20),
            _buildInfoCard('Phone', '98798 74561'),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(String label, String value) {
    return Container(
      padding: EdgeInsets.all(16), decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 2,
          blurRadius: 5,
          offset: Offset(0, 3),
        ),
      ],
    ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            label,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          Text(
            value,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}