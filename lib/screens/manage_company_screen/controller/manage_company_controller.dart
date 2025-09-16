import 'package:get/get.dart';

class ManageCompanyController extends GetxController {
  final RxList<Map<String, dynamic>> allUsers = <Map<String, dynamic>>[
    {
      "name": "John Deo",
      "id": "COM-123124",
      "email": "arroragaur@gmail.com",
      "abnId": "+33757005467",
      "subType": "Free",
    },
    {
      "name": "Alice Smith",
      "id": "COM-123125",
      "email": "alice@example.com",
      "abnId": "+33757005468",
      "subType": "Pro",
    },
    {
      "name": "Bob Johnson",
      "id": "COM-123126",
      "email": "bob@example.com",
      "abnId": "+33757005469",
      "subType": "Basic",
    },
    {
      "name": "Clara Williams",
      "id": "COM-123127",
      "email": "clara@example.com",
      "abnId": "+33757005470",
      "subType": "Free",
    },
    {
      "name": "Daniel Brown",
      "id": "COM-123128",
      "email": "daniel@example.com",
      "abnId": "+33757005471",
      "subType": "Pro",
    },
    {
      "name": "Emily Davis",
      "id": "COM-123129",
      "email": "emily@example.com",
      "abnId": "+33757005472",
      "subType": "Basic",
    },
    {
      "name": "Frank Moore",
      "id": "COM-123130",
      "email": "frank@example.com",
      "abnId": "+33757005473",
      "subType": "Free",
    },
    {
      "name": "Grace Taylor",
      "id": "COM-123131",
      "email": "grace@example.com",
      "abnId": "+33757005474",
      "subType": "Pro",
    },
    {
      "name": "Henry Anderson",
      "id": "COM-123132",
      "email": "henry@example.com",
      "abnId": "+33757005475",
      "subType": "Basic",
    },
    {
      "name": "Isla Thomas",
      "id": "COM-123133",
      "email": "isla@example.com",
      "abnId": "+33757005476",
      "subType": "Free",
    },
    {
      "name": "Jack Jackson",
      "id": "COM-123134",
      "email": "jack@example.com",
      "abnId": "+33757005477",
      "subType": "Pro",
    },
    {
      "name": "Karen White",
      "id": "COM-123135",
      "email": "karen@example.com",
      "abnId": "+33757005478",
      "subType": "Basic",
    },
    {
      "name": "Leo Harris",
      "id": "COM-123136",
      "email": "leo@example.com",
      "abnId": "+33757005479",
      "subType": "Free",
    },
    {
      "name": "Mia Martin",
      "id": "COM-123137",
      "email": "mia@example.com",
      "abnId": "+33757005480",
      "subType": "Pro",
    },
    {
      "name": "Noah Lee",
      "id": "COM-123138",
      "email": "noah@example.com",
      "abnId": "+33757005481",
      "subType": "Basic",
    },
    {
      "name": "Olivia Perez",
      "id": "COM-123139",
      "email": "olivia@example.com",
      "abnId": "+33757005482",
      "subType": "Free",
    },
    {
      "name": "Paul Young",
      "id": "COM-123140",
      "email": "paul@example.com",
      "abnId": "+33757005483",
      "subType": "Pro",
    },
    {
      "name": "Quinn King",
      "id": "COM-123141",
      "email": "quinn@example.com",
      "abnId": "+33757005484",
      "subType": "Basic",
    },
    {
      "name": "Ruby Scott",
      "id": "COM-123142",
      "email": "ruby@example.com",
      "abnId": "+33757005485",
      "subType": "Free",
    },
    {
      "name": "Sam Green",
      "id": "COM-123143",
      "email": "sam@example.com",
      "abnId": "+33757005486",
      "subType": "Pro",
    },
  ].obs;


  var selectedStatus = ''.obs;
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