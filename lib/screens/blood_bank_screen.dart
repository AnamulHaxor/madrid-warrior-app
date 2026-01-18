import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/models.dart';

class BloodBankScreen extends StatefulWidget {
  const BloodBankScreen({Key? key}) : super(key: key);

  @override
  State<BloodBankScreen> createState() => _BloodBankScreenState();
}

class _BloodBankScreenState extends State<BloodBankScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<BloodDonor> donors = [
    BloodDonor(
      id: '1',
      name: 'Ahmed Hassan',
      bloodGroup: 'O+',
      district: 'Dhaka',
      phoneNumber: '+8801700000001',
      registeredDate: DateTime.now(),
    ),
    BloodDonor(
      id: '2',
      name: 'Fatima Khan',
      bloodGroup: 'B+',
      district: 'Chittagong',
      phoneNumber: '+8801700000002',
      registeredDate: DateTime.now(),
    ),
  ];

  String? selectedBloodGroup;
  String? selectedDistrict;

  final List<String> bloodGroups = ['A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-'];
  final List<String> districts = ['Dhaka', 'Chittagong', 'Sylhet', 'Khulna', 'Rajshahi'];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _makeCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  Future<void> _sendWhatsApp(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'https',
      host: 'wa.me',
      path: phoneNumber,
    );
    await launchUrl(launchUri, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Warrior Blood Bank'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Find Donor'),
            Tab(text: 'Emergency Request'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Find Donor Tab
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Warrior Blood Bank',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    'A humanitarian wing of Madrid Warrior™ Community',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  const SizedBox(height: 24),
                  const Text('Filter by Blood Group:'),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    children: bloodGroups.map((group) {
                      return FilterChip(
                        label: Text(group),
                        selected: selectedBloodGroup == group,
                        onSelected: (selected) {
                          setState(() => selectedBloodGroup = selected ? group : null);
                        },
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 24),
                  const Text('Filter by District:'),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    children: districts.map((district) {
                      return FilterChip(
                        label: Text(district),
                        selected: selectedDistrict == district,
                        onSelected: (selected) {
                          setState(() => selectedDistrict = selected ? district : null);
                        },
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 24),
                  const Text('Available Donors:'),
                  const SizedBox(height: 12),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: donors.length,
                    itemBuilder: (context, index) {
                      final donor = donors[index];
                      return Card(
                        margin: const EdgeInsets.only(bottom: 12),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    donor.name,
                                    style: const TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Chip(label: Text(donor.bloodGroup)),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Text('Location: ${donor.district}'),
                              const SizedBox(height: 12),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  ElevatedButton.icon(
                                    onPressed: () => _makeCall(donor.phoneNumber),
                                    icon: const Icon(Icons.call),
                                    label: const Text('Call'),
                                  ),
                                  ElevatedButton.icon(
                                    onPressed: () => _sendWhatsApp(donor.phoneNumber),
                                    icon: const Icon(Icons.message),
                                    label: const Text('WhatsApp'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),

          // Emergency Request Tab
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Emergency Blood Request',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 24),
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'Patient Name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 12),
                  DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      labelText: 'Blood Group Needed',
                      border: OutlineInputBorder(),
                    ),
                    items: bloodGroups
                        .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                        .toList(),
                    onChanged: (value) {},
                  ),
                  const SizedBox(height: 12),
                  DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      labelText: 'District',
                      border: OutlineInputBorder(),
                    ),
                    items: districts
                        .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                        .toList(),
                    onChanged: (value) {},
                  ),
                  const SizedBox(height: 12),
                  DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      labelText: 'Urgency Level',
                      border: OutlineInputBorder(),
                    ),
                    items: ['Critical', 'High', 'Normal']
                        .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                        .toList(),
                    onChanged: (value) {},
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'Contact Phone',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'Description',
                      border: OutlineInputBorder(),
                    ),
                    maxLines: 3,
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Emergency request posted!')),
                        );
                      },
                      child: const Text('Post Emergency Request'),
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
}
