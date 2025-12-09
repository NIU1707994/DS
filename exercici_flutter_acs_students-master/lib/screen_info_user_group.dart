import 'package:exercise_flutter_acs/data.dart';
import 'package:flutter/material.dart';

class ScreenInfoUserGroup extends StatefulWidget {
  UserGroup userGroup;
  ScreenInfoUserGroup({super.key, required this.userGroup});

  @override
  State<ScreenInfoUserGroup> createState() => _ScreenInfoUserGroupState();
}

class _ScreenInfoUserGroupState extends State<ScreenInfoUserGroup> {
  late UserGroup userGroup;
  // This key makes possible the unique identification of the form
  // Also, the change of variables by the content of the text fields.
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    userGroup = widget.userGroup;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        title: Text("Info ${userGroup!.name}"),
        leading: IconButton(onPressed: () {
          Navigator.pop(context, userGroup);
        }, icon: const Icon(Icons.arrow_back)),
      ),
      body: Form(
        key: _formKey,
        child: Center(
          child: SizedBox(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Name Group'),
                  initialValue: "${userGroup!.name}",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    userGroup.name = value ?? ''; // '' Will never happen,
                    // because we are validating.
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Description'), maxLines: 5,
                  initialValue: "${userGroup!.description}",
                  onSaved: (value) {
                    userGroup.description = value ?? ''; // '' Will never happen,
                    // because we are validating.
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                TextButton(
                  onPressed: () {
                    submitFunction();
                  },
                  child: const Text("Submit"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void submitFunction() {
    setState(() {
      if (_formKey.currentState!.validate()){
        _formKey.currentState!.save();
        ScaffoldMessenger.of(context)
            .showSnackBar(
          const SnackBar(content: Text('Saved')),
        );
      }
    });
  }
}
