import 'package:flutter/material.dart';

class News extends StatelessWidget {
  final List<Map<String, String>> newsArticles = [
    {
      'title': 'Smart Bins Revolutionizing Waste Management',
      'subtitle':
          'AI-powered bins are making waste sorting easier and more efficient, reducing landfill use.',
      'image': 'assets/images/news/smart_bins.jpg',
    },
    {
      'title': 'The Rise of Smart Recycling in Cities',
      'subtitle':
          'How smart bins are helping cities manage waste sustainably with real-time tracking.',
      'image': 'assets/images/news/recycling_bins.webp',
    },
  ];

  News({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
      itemCount: newsArticles.length,
      itemBuilder: (context, index) {
        final article = newsArticles[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 16),
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                child: Image.asset(
                  article['image']!,
                  height: 180, // Fixed height for the image
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      article['title']!,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      article['subtitle']!,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    ));
  }
}
