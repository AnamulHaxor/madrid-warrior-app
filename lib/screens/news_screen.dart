import 'package:flutter/material.dart';
import '../models/models.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  int _selectedTab = 0;
  final List<String> tabs = ['All News', 'Breaking', 'Transfers', 'Match Updates', 'Statements'];

  final List<NewsPost> newsPosts = [
    NewsPost(
      id: '1',
      headline: 'Real Madrid wins 3-1 against Barcelona',
      banglaText: 'রিয়েল মাড্রিড বার্সেলোনার বিপক্ষে ৩-১ গোলে জয়লাভ করেছে।',
      category: 'Match Updates',
      timestamp: DateTime.now(),
      isApproved: true,
      isPinned: true,
    ),
    NewsPost(
      id: '2',
      headline: 'Transfer News: Vini Jr signs extension',
      banglaText: 'ভিনিসিয়াস জুনিয়র নতুন চুক্তিতে স্বাক্ষর করেছেন।',
      category: 'Transfers',
      timestamp: DateTime.now().subtract(const Duration(hours: 2)),
      isApproved: false,
    ),
  ];

  bool _isAdmin = true; // For demo

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News'),
        actions: _isAdmin
            ? [
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: _showAddNewsDialog,
                ),
              ]
            : null,
      ),
      body: Column(
        children: [
          // Tabs
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(tabs.length, (index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FilterChip(
                    label: Text(tabs[index]),
                    selected: _selectedTab == index,
                    onSelected: (selected) {
                      setState(() => _selectedTab = index);
                    },
                  ),
                );
              }),
            ),
          ),
          // News List
          Expanded(
            child: ListView.builder(
              itemCount: newsPosts.length,
              itemBuilder: (context, index) {
                final post = newsPosts[index];
                return Card(
                  margin: const EdgeInsets.all(8),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Chip(label: Text(post.category)),
                            if (post.isPinned)
                              const Icon(Icons.push_pin, color: Colors.red),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          post.headline,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(post.banglaText),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              post.isApproved ? '✓ Approved' : '⏳ Pending',
                              style: TextStyle(
                                color: post.isApproved
                                    ? Colors.green
                                    : Colors.orange,
                              ),
                            ),
                            if (_isAdmin && !post.isApproved)
                              Row(
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        newsPosts[index] = NewsPost(
                                          id: post.id,
                                          headline: post.headline,
                                          banglaText: post.banglaText,
                                          category: post.category,
                                          timestamp: post.timestamp,
                                          isApproved: true,
                                        );
                                      });
                                    },
                                    child: const Text('Approve'),
                                  ),
                                  const SizedBox(width: 8),
                                  ElevatedButton(
                                    onPressed: () => _showDeclineDialog(index),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.red,
                                    ),
                                    child: const Text('Decline'),
                                  ),
                                ],
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showAddNewsDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add News Post'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Headline'),
            ),
            const SizedBox(height: 12),
            TextField(
              decoration: const InputDecoration(labelText: 'Bangla Text'),
            ),
            const SizedBox(height: 12),
            DropdownButton<String>(
              items: ['Breaking', 'Transfers', 'Match Updates', 'Statements']
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: (value) {},
              hint: const Text('Select Category'),
            ),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
          ElevatedButton(onPressed: () => Navigator.pop(context), child: const Text('Add')),
        ],
      ),
    );
  }

  void _showDeclineDialog(int index) {
    final reasonController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Decline Post'),
        content: TextField(
          controller: reasonController,
          decoration: const InputDecoration(labelText: 'Decline Reason (Required)'),
          maxLines: 3,
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
          ElevatedButton(
            onPressed: reasonController.text.isEmpty
                ? null
                : () {
                    setState(() {
                      final post = newsPosts[index];
                      newsPosts[index] = NewsPost(
                        id: post.id,
                        headline: post.headline,
                        banglaText: post.banglaText,
                        category: post.category,
                        timestamp: post.timestamp,
                        declineReason: reasonController.text,
                      );
                    });
                    Navigator.pop(context);
                  },
            child: const Text('Decline'),
          ),
        ],
      ),
    );
  }
}
