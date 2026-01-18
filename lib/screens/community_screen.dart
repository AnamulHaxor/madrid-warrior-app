import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({Key? key}) : super(key: key);

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late WebViewController _pageController;
  late WebViewController _groupController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    
    _pageController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse('https://www.facebook.com/madridwarriorofficial'));

    _groupController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse('https://www.facebook.com/groups/251597709557232'));
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Community'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Facebook Page'),
            Tab(text: 'Facebook Group'),
            Tab(text: 'Rules'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Facebook Page
          WebViewWidget(controller: _pageController),
          
          // Facebook Group
          WebViewWidget(controller: _groupController),
          
          // Rules
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Community Rules',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  _buildRuleCard(
                    '1. Respect All Members',
                    'Treat every member with respect and courtesy. No harassment, bullying, or hate speech.',
                  ),
                  _buildRuleCard(
                    '2. No Spam or Promotion',
                    'Do not post spam, advertisements, or promotional content without moderator approval.',
                  ),
                  _buildRuleCard(
                    '3. Football Focus',
                    'Keep discussions related to Real Madrid and football. Off-topic posts may be removed.',
                  ),
                  _buildRuleCard(
                    '4. No Abuse',
                    'Abusive language, personal attacks, and discriminatory content are strictly prohibited.',
                  ),
                  _buildRuleCard(
                    '5. Verify Information',
                    'Share only verified news and information. Avoid spreading rumors or misinformation.',
                  ),
                  const SizedBox(height: 24),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Rules accepted!')),
                        );
                      },
                      child: const Text('Accept Rules'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRuleCard(String title, String description) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(description),
          ],
        ),
      ),
    );
  }
}
