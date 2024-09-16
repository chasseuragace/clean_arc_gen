import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../domain/entities/project_init/project.dart';
import '../../../domain/entities/project_init/project_defination.dart';
import '../../../domain/entities/project_init/schemas.dart';
import 'project_form.dart';
import 'schema_listing.dart';

class ProductListPage extends StatelessWidget {
  ProductListPage({super.key});
  final Project project =
      Project.fromJson(projectDefinition['project'] as Map<String, dynamic>);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Project Composer "),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                    flex: 5,
                    child: Column(
                      children: [
                        Text("${project.name}"),
                        Text("${project.description}"),
                        SizedBox(
                          height: 120,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: project.repositories!
                                .map((e) => FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: SizedBox(
                                        width: 220,
                                        child: ExpansionTile(
                                          title: Text("${e.name}"),
                                          children: [
                                            Text("${e.name}"),
                                          ],
                                        ),
                                      ),
                                    ))
                                .toList(),
                          ),
                        ),
                        Text("${project.configuration?.database?.type}"),
                        Text(
                            "${project.configuration?.database?.connectionString}"),
                      ],
                    )),
                Expanded(
                  child: ProjectForm(
                    onSave: (_) {},
                    project: project,
                  ),
                ),
                Expanded(child: SchemaListing()),
              ],
            ),
          )
        ],
      ),
    );
  }
}
