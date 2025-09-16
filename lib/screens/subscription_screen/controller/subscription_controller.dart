import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SubscriptionController extends GetxController {
  final RxList<Map<String, dynamic>> allUsers = <Map<String, dynamic>>[
    {
      "id": "COM-123124",
      "name": "John Deo",
      "subType": "Free",
      "date": "19 Dec, 2025",
    },
    {
      "id": "COM-123125",
      "name": "Alice Smith",
      "subType": "Pro",
      "date": "18 Dec, 2025",
    },
    {
      "id": "COM-123126",
      "name": "Bob Johnson",
      "subType": "Basic",
      "date": "17 Dec, 2025",
    },
    {
      "id": "COM-123127",
      "name": "Clara Wilson",
      "subType": "Free",
      "date": "16 Dec, 2025",
    },
    {
      "id": "COM-123128",
      "name": "David Brown",
      "subType": "Pro",
      "date": "15 Dec, 2025",
    },
    {
      "id": "COM-123129",
      "name": "Emily Davis",
      "subType": "Basic",
      "date": "14 Dec, 2025",
    },
    {
      "id": "COM-123130",
      "name": "Frank Harris",
      "subType": "Free",
      "date": "13 Dec, 2025",
    },
    {
      "id": "COM-123131",
      "name": "Grace Martin",
      "subType": "Pro",
      "date": "12 Dec, 2025",
    },
    {
      "id": "COM-123132",
      "name": "Henry Clark",
      "subType": "Basic",
      "date": "11 Dec, 2025",
    },
    {
      "id": "COM-123133",
      "name": "Ivy Lewis",
      "subType": "Free",
      "date": "10 Dec, 2025",
    },
    {
      "id": "COM-123134",
      "name": "Jack Walker",
      "subType": "Pro",
      "date": "09 Dec, 2025",
    },
    {
      "id": "COM-123135",
      "name": "Karen Young",
      "subType": "Basic",
      "date": "08 Dec, 2025",
    },
    {
      "id": "COM-123136",
      "name": "Leo King",
      "subType": "Free",
      "date": "07 Dec, 2025",
    },
    {
      "id": "COM-123137",
      "name": "Mia Wright",
      "subType": "Pro",
      "date": "06 Dec, 2025",
    },
    {
      "id": "COM-123138",
      "name": "Noah Hall",
      "subType": "Basic",
      "date": "05 Dec, 2025",
    },
    {
      "id": "COM-123139",
      "name": "Olivia Allen",
      "subType": "Free",
      "date": "04 Dec, 2025",
    },
    {
      "id": "COM-123140",
      "name": "Paul Scott",
      "subType": "Pro",
      "date": "03 Dec, 2025",
    },
    {
      "id": "COM-123141",
      "name": "Quinn Adams",
      "subType": "Basic",
      "date": "02 Dec, 2025",
    },
    {
      "id": "COM-123142",
      "name": "Ruby Baker",
      "subType": "Free",
      "date": "01 Dec, 2025",
    },
    {
      "id": "COM-123143",
      "name": "Sam Nelson",
      "subType": "Pro",
      "date": "30 Nov, 2025",
    },
  ].obs;

  var packageController = TextEditingController();
  var updatePackageController = TextEditingController();
  var priceController = TextEditingController();
  var descController = TextEditingController();
  var selectedStatus = ''.obs;
  var selectedPackage = ''.obs;
  var currentPage2 = 1.obs;
  final int itemsPerPage = 6;
  final int pagesPerGroup = 5;

  int get totalPages => (allUsers.length / itemsPerPage).ceil();

  List get pagedUsers {
    int start = (currentPage2.value - 1) * itemsPerPage;
    int end = start + itemsPerPage;
    return allUsers.sublist(
      start,
      end > allUsers.length ? allUsers.length : end,
    );
  }

  int get currentGroup => ((currentPage2.value - 1) / pagesPerGroup).floor();

  List<int> get visiblePageNumbers {
    int startPage = currentGroup * pagesPerGroup + 1;
    int endPage = (startPage + pagesPerGroup - 1).clamp(1, totalPages);
    return List.generate(endPage - startPage + 1, (index) => startPage + index);
  }

  void goToPage(int page) {
    if (page >= 1 && page <= totalPages) currentPage2.value = page;
  }

  void goToNextPage() {
    if (currentPage2.value < totalPages) {
      currentPage2.value++;
    }
  }

  void goToPreviousPage() {
    if (currentPage2.value > 1) {
      currentPage2.value--;
    }
  }
}