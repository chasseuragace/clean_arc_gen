import '../../../domain/entities/project_init/project.dart';
import 'package:flutter/material.dart';

class ProjectForm extends StatefulWidget {
  final Project? project;
  final Function(Project) onSave;

  ProjectForm({this.project, required this.onSave});

  @override
  _ProjectFormState createState() => _ProjectFormState();
}

class _ProjectFormState extends State<ProjectForm> {
  final _formKey = GlobalKey<FormState>();
  late Project _project;

  @override
  void initState() {
    super.initState();
    _project = widget.project ?? Project();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Project Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              _buildTextField(
                  'Name', _project.name, (value) => _project.name = value),
              _buildTextField('Domain', _project.domain,
                  (value) => _project.domain = value),
              _buildTextField('Description', _project.description,
                  (value) => _project.description = value),
              // Add more fields for the rest of the properties...
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    widget.onSave(_project);
                  }
                },
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
      String label, String? initialValue, Function(String?) onSaved) {
    return TextFormField(
      initialValue: initialValue,
      decoration: InputDecoration(labelText: label),
      onSaved: onSaved,
      validator: (value) =>
          value!.isEmpty ? 'This field cannot be empty' : null,
    );
  }
}
