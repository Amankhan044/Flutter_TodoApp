import 'package:flutter/material.dart';
import 'package:todo_app/constants/app_lists.dart';
import 'package:todo_app/screens/addScreen/add_page.dart';
import 'package:todo_app/screens/editScreen/edit_page.dart'; // Import the edit page

class TodoListPagState extends StatefulWidget {
  const TodoListPagState({Key? key}) : super(key: key);

  @override
  State<TodoListPagState> createState() => _TodoListPagStateState();
}

class _TodoListPagStateState extends State<TodoListPagState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Todo List")),
      ),
      body: ListView.builder(
        itemCount: AppList.titleLists.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              child: Text("${index + 1}"),
            ),
            title: Text(AppList.titleLists[index]),
            subtitle: Text(AppList.discriptionLists[index]),
            trailing: PopupMenuButton(
              onSelected: (value) {
                if (value == "Edit") {
                  navigateToEditPage(index);
                } else {
                  setState(() {
                    AppList.titleLists.removeAt(index);
                    AppList.discriptionLists.removeAt(index);
                  });
                }
              },
              itemBuilder: (context) {
                return [
                  const PopupMenuItem(
                    value: "Edit",
                    child: Text("Edit"),
                  ),
                  const PopupMenuItem(
                    value: "Delete",
                    child: Text("Delete"),
                  )
                ];
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: navigateToAddPage,
        label: const Center(child: Text("Add todo")),
      ),
    );
  }

 void navigateToAddPage() async {
  final result = await Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => AddPageList(),
    ),
  );

  if (result != null && result is Map<String, dynamic>) {
    String? title = result['title'];
    String? description = result['description'];

    if (title != null && description != null) {
      setState(() {
        if (!AppList.titleLists.contains(title)) {
          // Check if the task with the same title already exists
          AppList.titleLists.add(title);
          AppList.discriptionLists.add(description);
        }
      });
    }
  }
}
 void navigateToEditPage(int index) async {
  final result = await Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => EditPageList(
        index: index,
      ),
    ),
  );

  if (result != null && result is Map<String, dynamic>) {
    String? title = result['title'];
    String? description = result['description'];

    if (title != null && description != null) {
      setState(() {
        AppList.titleLists[index] = title;
        AppList.discriptionLists[index] = description;
      });
    }
  }
}
}
