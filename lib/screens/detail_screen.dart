import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/note.dart';

class DetailScreen extends StatelessWidget {
  final Note note;
  const DetailScreen({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Detail Catatan")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              note.title,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(note.content),
            const SizedBox(height: 30),

            // FITUR INOVATIF 1: WHATSAPP
            ElevatedButton.icon(
              icon: const Icon(Icons.message),
              label: const Text("Kirim WhatsApp"),
              onPressed: () {
                launchUrl(Uri.parse("https://wa.me/628123456789"));
              },
            ),

            // FITUR INOVATIF 2: EMAIL
            ElevatedButton.icon(
              icon: const Icon(Icons.email),
              label: const Text("Kirim Email"),
              onPressed: () {
                launchUrl(Uri.parse("mailto:test@email.com"));
              },
            ),
          ],
        ),
      ),
    );
  }
}
