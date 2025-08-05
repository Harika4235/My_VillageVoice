import 'package:flutter/material.dart';

class ComplaintListPage extends StatelessWidget {
  final List<Map<String, String>> complaints = [
    {
      'title': 'Water Leakage',
      'description': 'Leakage near temple for 2 days',
      'location': 'Ward 3'
    },
    {
      'title': 'No Streetlights',
      'description': 'Dark streets after 6PM',
      'location': 'Main Road'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('View Complaints')),
      body: ListView.builder(
        padding: EdgeInsets.all(12),
        itemCount: complaints.length,
        itemBuilder: (ctx, index) {
          final complaint = complaints[index];
          return Card(
            child: ListTile(
              title: Text(complaint['title']!),
              subtitle: Text(
                '📍 ${complaint['location']}\n${complaint['description']}',
              ),
              isThreeLine: true,
            ),
          );
        },
      ),
    );
  }
}
