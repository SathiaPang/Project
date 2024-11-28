import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  // Observable list to store the search results
  var searchResults = <String>[].obs;

  // Function to filter data based on the search query
  void search(String query) {
    // Your search logic here...
    // For this example, let's use a simple list of items
    List<String> data = [
      'Apple',
      'Banana',
      'Cherry',
      'Date',
      'Grapes',
      'Kiwi',
      'Mango',
      'Orange',
      'Peach',
      'Pear',
    ];

    // Filter data based on the search query
    searchResults.assignAll(data
        .where((item) => item.toLowerCase().contains(query.toLowerCase()))
        .toList());
  }
}

class SearchPage extends StatelessWidget {
  final SearchController searchController = Get.put(SearchController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Column(
          children: [
            // Search TextField
            TextField(
              onChanged: (value) {
                // Call the search function on every text change
                searchController.search(value);
              },
              decoration: InputDecoration(
                labelText: 'Search',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            // Display search results using a ListView
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: searchController.searchResults.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        searchController.searchResults[index],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
