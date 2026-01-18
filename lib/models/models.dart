class NewsPost {
  final String id;
  final String headline;
  final String banglaText;
  final String? imageUrl;
  final String category; // Breaking, Transfers, Match Updates, Statements
  final DateTime timestamp;
  final bool isApproved;
  final String? declineReason;
  final bool isPinned;

  NewsPost({
    required this.id,
    required this.headline,
    required this.banglaText,
    this.imageUrl,
    required this.category,
    required this.timestamp,
    this.isApproved = false,
    this.declineReason,
    this.isPinned = false,
  });
}

class BloodDonor {
  final String id;
  final String name;
  final String bloodGroup; // A+, A-, B+, B-, AB+, AB-, O+, O-
  final String district;
  final String phoneNumber;
  final bool isAvailable;
  final DateTime registeredDate;

  BloodDonor({
    required this.id,
    required this.name,
    required this.bloodGroup,
    required this.district,
    required this.phoneNumber,
    this.isAvailable = true,
    required this.registeredDate,
  });
}

class BloodRequest {
  final String id;
  final String bloodGroup;
  final String district;
  final String patientName;
  final String urgency; // critical, high, normal
  final String description;
  final String contactPhone;
  final DateTime createdDate;
  final bool isResolved;

  BloodRequest({
    required this.id,
    required this.bloodGroup,
    required this.district,
    required this.patientName,
    required this.urgency,
    required this.description,
    required this.contactPhone,
    required this.createdDate,
    this.isResolved = false,
  });
}

class User {
  final String id;
  final String name;
  final String email;
  final String location;
  final String role; // Member, Moderator, Admin
  final List<String> savedPostIds;
  final DateTime registeredDate;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.location,
    required this.role,
    this.savedPostIds = const [],
    required this.registeredDate,
  });
}
