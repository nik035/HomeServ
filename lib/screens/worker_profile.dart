import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class EmployeeProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Employee Profile'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage('data:image/jpeg;base64,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'),
            ),
          ),
          Text(
            'Rajni Kasotiya',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          Text(
            'Plumber',
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey[600],
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'About',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Install, repair, and maintain pipes, valves, fittings, drainage systems, and fixtures in commercial and residential structures.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Contact',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(
                      Icons.email,
                      color: Colors.grey[600],
                    ),
                    SizedBox(width: 8),
                    Text(
                      'rajni.kasotiya@gmail.com',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(
                      Icons.phone,
                      color: Colors.grey[600],
                    ),
                    SizedBox(width: 8),
                    Text(
                      '+91 8561896308',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
