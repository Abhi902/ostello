import 'dart:developer';

class CoachingInstitute {
  final String name;
  final double rating;
  final String distance; // Distance in kilometers
  final List<String> subjects;
  final String location;
  final double discount;
  final bool colleagues;

  CoachingInstitute(
      {required this.name,
      required this.rating,
      required this.distance,
      required this.subjects,
      required this.location,
      required this.discount,
      required this.colleagues});
}

class CoachingInstituteDataSet {
  final List<CoachingInstitute> institutes = [
    CoachingInstitute(
      name: 'Institute A',
      rating: 4.5,
      distance: '5 kms',
      subjects: ['Math', 'Science', 'English', 'History'],
      location: 'City A',
      discount: 10,
      colleagues: false,
    ),
    CoachingInstitute(
      name: 'Institute B',
      rating: 4.8,
      distance: '3.5 kms',
      subjects: ['Math', 'Science', 'Computer Science', 'Physics'],
      location: 'City B',
      discount: 15,
      colleagues: true,
    ),
    CoachingInstitute(
      name: 'Institute C',
      rating: 4.2,
      distance: '8 kms',
      subjects: ['Math', 'Science', 'History', 'Geography'],
      location: 'City A',
      discount: 12,
      colleagues: false,
    ),
    CoachingInstitute(
      name: 'Institute D',
      rating: 4.9,
      distance: '2 kms',
      subjects: ['Math', 'Science', 'Chemistry', 'Biology'],
      location: 'City C',
      discount: 20,
      colleagues: true,
    ),
    CoachingInstitute(
      name: 'Institute E',
      rating: 4.4,
      distance: '6 kms',
      subjects: ['Math', 'Science', 'English', 'Geography'],
      location: 'City B',
      discount: 18,
      colleagues: false,
    ),
    CoachingInstitute(
      name: 'Institute F',
      rating: 4.7,
      distance: '4 kms',
      subjects: ['Math', 'Science', 'History', 'Chemistry'],
      location: 'City A',
      discount: 14,
      colleagues: false,
    ),
    CoachingInstitute(
      name: 'Institute G',
      rating: 4.0,
      distance: '9 kms',
      subjects: ['Math', 'Science', 'Computer Science', 'English'],
      location: 'City C',
      discount: 10,
      colleagues: true,
    ),
    CoachingInstitute(
      name: 'Institute H',
      rating: 4.3,
      distance: '7.5 kms',
      subjects: ['Math', 'Science', 'Physics', 'Biology'],
      location: 'City B',
      discount: 16,
      colleagues: false,
    ),
    CoachingInstitute(
      name: 'Institute I',
      rating: 4.6,
      distance: '3 kms',
      subjects: ['Math', 'Science', 'History', 'English'],
      location: 'City A',
      discount: 22,
      colleagues: false,
    ),
    CoachingInstitute(
      name: 'Institute J',
      rating: 4.1,
      distance: '1 kms',
      subjects: ['Math', 'Science', 'Chemistry', 'Physics'],
      location: 'City C',
      discount: 12,
      colleagues: true,
    ),
  ];

  List<CoachingInstitute> getHostelsWithin2Km() {
    log(institutes
        .where((institute) {
          final distanceStr = institute.distance.replaceAll(' kms', '');
          final distance = double.tryParse(distanceStr);
          return distance != null && distance <= 2;
        })
        .toList()
        .toString());

    return institutes.where((institute) {
      final distanceStr = institute.distance.replaceAll(' kms', '');
      final distance = double.tryParse(distanceStr);
      return distance != null && distance <= 2;
    }).toList();
  }

  List<CoachingInstitute> sortByDistanceAscending() {
    // Sort institutes by distance in ascending order
    institutes.sort((a, b) => a.distance.compareTo(b.distance));
    return institutes;
  }

  List<CoachingInstitute> sortByRatingAscending() {
    // Sort institutes by rating in ascending order
    institutes.sort((a, b) => a.rating.compareTo(b.rating));
    return institutes;
  }

  List<CoachingInstitute> sortByPriceAscending() {
    // Sort institutes by price in ascending order
    institutes.sort((a, b) => a.discount.compareTo(b.discount));
    return institutes;
  }
}
