import 'package:flutter/material.dart';

class PrivacyPoliciesPage extends StatelessWidget {
  const PrivacyPoliciesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Policies'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Row(
              children: const [
                Icon(Icons.lock, color: Colors.blue),
                SizedBox(width: 8),
                Text(
                  'Project Privacy Policies:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 12),
            const Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: '1. Project classification (special vs. general):\n',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text:
                        'Private projects: The independent is not allowed to share or post project details on GitHub or any other platform. It should be delivered only via the platform\'s platform. Public enterprises: The independent is allowed to participate in the project after completion, both in his personal exhibition and on other platforms, subject to the employer\'s consent.\n\n',
                  ),
                  TextSpan(
                    text: '2. Project File Protection:\n',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text:
                        'All uploaded files pass through an encryption and protection system to ensure they are not leaked. Project files can only be uploaded by the authorized employer and freelancer. Private enterprises can be downloaded only after the employer\'s consent, and may be protected by a password if necessary.\n',
                  ),
                ],
              ),
              textAlign: TextAlign.start,
            ),
            const SizedBox(height: 24),
            Row(
              children: const [
                Icon(Icons.privacy_tip, color: Colors.blue),
                SizedBox(width: 8),
                Text(
                  'Personal Data Privacy Policies:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 12),
            const Text(
              '3. Hide External Communication Data:\nEmployers cannot share phone numbers or emails within their profiles to prevent communication outside the platform.',
              textAlign: TextAlign.start,
            ),
          ],
        ),
      ),
    );
  }
}
