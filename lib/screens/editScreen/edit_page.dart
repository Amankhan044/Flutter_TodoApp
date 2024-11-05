import 'package:flutter/material.dart';
import 'package:todo_app/constants/app_lists.dart';

class EditPageList extends StatefulWidget {
  final int index;

  EditPageList({Key? key, required this.index}) : super(key: key);

  @override
  State<EditPageList> createState() => _EditPageListState();
}

class _EditPageListState extends State<EditPageList> {
  TextEditingController titleController = TextEditingController();
  TextEditingController discriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    titleController.text = AppList.titleLists[widget.index];
    discriptionController.text = AppList.discriptionLists[widget.index];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Edit Todo")),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          TextField(
            controller: titleController,
            decoration: const InputDecoration(hintText: "Title"),
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            controller: discriptionController,
            decoration: const InputDecoration(hintText: "Description"),
            keyboardType: TextInputType.multiline,
            minLines: 5,
            maxLines: 8,
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                String title = titleController.text;
                String description = discriptionController.text;

                if (title.isNotEmpty && description.isNotEmpty) {
                  AppList.titleLists[widget.index] = title;
                  AppList.discriptionLists[widget.index] = description;

                  Navigator.of(context).pop({
                    'title': title,
                    'description': description,
                  });
                }
              });
            },
            child: const Text("Update"),
          ),
        ],
      ),
    );
  }
}
