import 'package:flutter/material.dart';

import '../../../domain/entities/project_init/project.dart';
import '../../../domain/entities/project_init/schemas.dart';

class SchemaListing extends StatelessWidget {
  const SchemaListing({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final achemas = allSchema
        .map((e) => Schema.fromJson(e as Map<String, dynamic>))
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: Text("Schema Collection"),
      ),
      body: ListView.builder(
          itemCount: achemas.length,
          itemBuilder: (c, i) {
            final item = achemas[i];
            return ListTile(
              title: Text(item.name ?? ""),
              subtitle: Text(
                  "${item.properties?.map((e) => e.name).toList().join(',')}"
                      .toString()),
            );
          }),
    );
  }
}
