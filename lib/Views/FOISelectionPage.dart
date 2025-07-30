import 'package:flutter/material.dart';
import 'package:nampy_frontend/Components/NPButton.dart';
import 'package:nampy_frontend/Views/Global/Theme.dart';
import 'package:searchfield/searchfield.dart';

class FOISelectionPage extends StatefulWidget {
  const FOISelectionPage({super.key});

  @override
  State<FOISelectionPage> createState() => _FOISelectionPageState();
}

class _FOISelectionPageState extends State<FOISelectionPage> {
  final List<String> _allFields = [
    'Computer Science',
    'Data Science',
    'Machine Learning',
    'Artificial Intelligence',
  ];

  List<String> _availableFields = [];
  List<String> _selectedFields = [];

  @override
  void initState() {
    super.initState();
    _availableFields = List.from(_allFields); // clone original list
  }

  void _onFieldSelected(String value) {
    if (_availableFields.contains(value)) {
      setState(() {
        _selectedFields.add(value);
        _availableFields.remove(value);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 60),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              Text(
                'Field of Interest',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 10),
              Text(
                'Last Step ! please select your interest so that we can provide you with the best experience',
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text("Select a Field of Interest"),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 16),
                      child: Theme(
                        data: Theme.of(context).copyWith(
                          inputDecorationTheme: InputDecorationTheme(
                            hintStyle: const TextStyle(color: Colors.grey),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 14),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: AppColors.primary),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColors.secondary, width: 2),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        child: SearchField<String>(
                          hint: 'Search Field of Interest',
                          suggestions: _availableFields
                              .map(
                                  (field) => SearchFieldListItem<String>(field))
                              .toList(),
                          onSuggestionTap: (SearchFieldListItem<String> item) {
                            _onFieldSelected(item.searchKey);
                          },
                        ),
                      ),
                    ),

                    // Display selected fields below the dropdown
                    if (_selectedFields.isNotEmpty)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding:
                                EdgeInsets.only(top: 20, bottom: 8, left: 4),
                            child: Text(
                              "Selected Fields:",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          ),
                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: _selectedFields
                                .map(
                                  (field) => Chip(
                                    label: Text(field),
                                    backgroundColor: AppColors.primary,
                                    deleteIcon: const Icon(Icons.close,
                                        color: Colors.white, size: 18),
                                    onDeleted: () {
                                      setState(() {
                                        _selectedFields.remove(field);
                                        _availableFields.add(field);
                                      });
                                    },
                                    labelStyle:
                                        const TextStyle(color: Colors.white),
                                  ),
                                )
                                .toList(),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              NPButton(label: 'Continue', onPressed: () {})
            ],
          ),
        ),
      ),
    );
  }
}
