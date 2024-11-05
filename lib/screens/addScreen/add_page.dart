import 'package:flutter/material.dart';
import 'package:todo_app/constants/app_lists.dart';

class AddPageList extends StatefulWidget {
  const AddPageList({Key? key}) : super(key: key);

  @override
  State<AddPageList> createState() => _AddPageListState();
}

class _AddPageListState extends State<AddPageList> {
  TextEditingController titleController = TextEditingController();
  TextEditingController discriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Add Todo")),
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
                  AppList.titleLists.add(title);
                  AppList.discriptionLists.add(description);

                  titleController.clear();
                  discriptionController.clear();

                  Navigator.of(context).pop({
                    'title': title,
                    'description': description,
                  });
                }
              });
            },
            child: const Text("Submit"),
          ),
        ],
      ),
    );
  }
}
