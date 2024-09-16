import 'dart:convert';

class Project {
  String? name;
  String? domain;
  String? description;
  Schema? schema;
  List<UseCase>? useCases;
  List<Repository>? repositories;
  List<Microservice>? microservices;
  Configuration? configuration;
  Documentation? documentation;
  Validation? validation;
  String? apiVersioning;
  String? dataRetention;
  Logging? logging;
  ErrorHandling? errorHandling;
  RateLimiting? rateLimiting;
  Caching? caching;
  Deployment? deployment;
  Localization? localization;
  NotificationSettings? notificationSettings;
  Security? security;

  Project({
    this.name,
    this.domain,
    this.description,
    this.schema,
    this.useCases,
    this.repositories,
    this.microservices,
    this.configuration,
    this.documentation,
    this.validation,
    this.apiVersioning,
    this.dataRetention,
    this.logging,
    this.errorHandling,
    this.rateLimiting,
    this.caching,
    this.deployment,
    this.localization,
    this.notificationSettings,
    this.security,
  });

  Project copyWith({
    String? name,
    String? domain,
    String? description,
    Schema? schema,
    List<UseCase>? useCases,
    List<Repository>? repositories,
    List<Microservice>? microservices,
    Configuration? configuration,
    Documentation? documentation,
    Validation? validation,
    String? apiVersioning,
    String? dataRetention,
    Logging? logging,
    ErrorHandling? errorHandling,
    RateLimiting? rateLimiting,
    Caching? caching,
    Deployment? deployment,
    Localization? localization,
    NotificationSettings? notificationSettings,
    Security? security,
  }) =>
      Project(
        name: name ?? this.name,
        domain: domain ?? this.domain,
        description: description ?? this.description,
        schema: schema ?? this.schema,
        useCases: useCases ?? this.useCases,
        repositories: repositories ?? this.repositories,
        microservices: microservices ?? this.microservices,
        configuration: configuration ?? this.configuration,
        documentation: documentation ?? this.documentation,
        validation: validation ?? this.validation,
        apiVersioning: apiVersioning ?? this.apiVersioning,
        dataRetention: dataRetention ?? this.dataRetention,
        logging: logging ?? this.logging,
        errorHandling: errorHandling ?? this.errorHandling,
        rateLimiting: rateLimiting ?? this.rateLimiting,
        caching: caching ?? this.caching,
        deployment: deployment ?? this.deployment,
        localization: localization ?? this.localization,
        notificationSettings: notificationSettings ?? this.notificationSettings,
        security: security ?? this.security,
      );

  factory Project.fromRawJson(String str) => Project.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Project.fromJson(Map<String, dynamic> json) => Project(
        name: json["name"],
        domain: json["domain"],
        description: json["description"],
        schema: json["schema"] == null ? null : Schema.fromJson(json["schema"]),
        useCases: json["use_cases"] == null
            ? []
            : List<UseCase>.from(
                json["use_cases"]!.map((x) => UseCase.fromJson(x))),
        repositories: json["repositories"] == null
            ? []
            : List<Repository>.from(
                json["repositories"]!.map((x) => Repository.fromJson(x))),
        microservices: json["microservices"] == null
            ? []
            : List<Microservice>.from(
                json["microservices"]!.map((x) => Microservice.fromJson(x))),
        configuration: json["configuration"] == null
            ? null
            : Configuration.fromJson(json["configuration"]),
        documentation: json["documentation"] == null
            ? null
            : Documentation.fromJson(json["documentation"]),
        validation: json["validation"] == null
            ? null
            : Validation.fromJson(json["validation"]),
        apiVersioning: json["api_versioning"],
        dataRetention: json["data_retention"],
        logging:
            json["logging"] == null ? null : Logging.fromJson(json["logging"]),
        errorHandling: json["error_handling"] == null
            ? null
            : ErrorHandling.fromJson(json["error_handling"]),
        rateLimiting: json["rate_limiting"] == null
            ? null
            : RateLimiting.fromJson(json["rate_limiting"]),
        caching:
            json["caching"] == null ? null : Caching.fromJson(json["caching"]),
        deployment: json["deployment"] == null
            ? null
            : Deployment.fromJson(json["deployment"]),
        localization: json["localization"] == null
            ? null
            : Localization.fromJson(json["localization"]),
        notificationSettings: json["notification_settings"] == null
            ? null
            : NotificationSettings.fromJson(json["notification_settings"]),
        security: json["security"] == null
            ? null
            : Security.fromJson(json["security"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "domain": domain,
        "description": description,
        "schema": schema?.toJson(),
        "use_cases": useCases == null
            ? []
            : List<dynamic>.from(useCases!.map((x) => x.toJson())),
        "repositories": repositories == null
            ? []
            : List<dynamic>.from(repositories!.map((x) => x)),
        "microservices": microservices == null
            ? []
            : List<dynamic>.from(microservices!.map((x) => x.toJson())),
        "configuration": configuration?.toJson(),
        "documentation": documentation?.toJson(),
        "validation": validation?.toJson(),
        "api_versioning": apiVersioning,
        "data_retention": dataRetention,
        "logging": logging?.toJson(),
        "error_handling": errorHandling?.toJson(),
        "rate_limiting": rateLimiting?.toJson(),
        "caching": caching?.toJson(),
        "deployment": deployment?.toJson(),
        "localization": localization?.toJson(),
        "notification_settings": notificationSettings?.toJson(),
        "security": security?.toJson(),
      };
}

class Caching {
  bool? enabled;
  String? strategy;
  String? expirationTime;

  Caching({
    this.enabled,
    this.strategy,
    this.expirationTime,
  });

  Caching copyWith({
    bool? enabled,
    String? strategy,
    String? expirationTime,
  }) =>
      Caching(
        enabled: enabled ?? this.enabled,
        strategy: strategy ?? this.strategy,
        expirationTime: expirationTime ?? this.expirationTime,
      );

  factory Caching.fromRawJson(String str) => Caching.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Caching.fromJson(Map<String, dynamic> json) => Caching(
        enabled: json["enabled"],
        strategy: json["strategy"],
        expirationTime: json["expiration_time"],
      );

  Map<String, dynamic> toJson() => {
        "enabled": enabled,
        "strategy": strategy,
        "expiration_time": expirationTime,
      };
}

class Configuration {
  Database? database;
  Environment? environment;

  Configuration({
    this.database,
    this.environment,
  });

  Configuration copyWith({
    Database? database,
    Environment? environment,
  }) =>
      Configuration(
        database: database ?? this.database,
        environment: environment ?? this.environment,
      );

  factory Configuration.fromRawJson(String str) =>
      Configuration.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Configuration.fromJson(Map<String, dynamic> json) => Configuration(
        database: json["database"] == null
            ? null
            : Database.fromJson(json["database"]),
        environment: json["environment"] == null
            ? null
            : Environment.fromJson(json["environment"]),
      );

  Map<String, dynamic> toJson() => {
        "database": database?.toJson(),
        "environment": environment?.toJson(),
      };
}

class Database {
  String? type;
  String? connectionString;

  Database({
    this.type,
    this.connectionString,
  });

  Database copyWith({
    String? type,
    String? connectionString,
  }) =>
      Database(
        type: type ?? this.type,
        connectionString: connectionString ?? this.connectionString,
      );

  factory Database.fromRawJson(String str) =>
      Database.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Database.fromJson(Map<String, dynamic> json) => Database(
        type: json["type"],
        connectionString: json["connection_string"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "connection_string": connectionString,
      };
}

class Environment {
  List<Variable>? variables;

  Environment({
    this.variables,
  });

  Environment copyWith({
    List<Variable>? variables,
  }) =>
      Environment(
        variables: variables ?? this.variables,
      );

  factory Environment.fromRawJson(String str) =>
      Environment.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Environment.fromJson(Map<String, dynamic> json) => Environment(
        variables: json["variables"] == null
            ? []
            : List<Variable>.from(
                json["variables"]!.map((x) => Variable.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "variables": variables == null
            ? []
            : List<dynamic>.from(variables!.map((x) => x.toJson())),
      };
}

class Variable {
  String? name;
  String? value;

  Variable({
    this.name,
    this.value,
  });

  Variable copyWith({
    String? name,
    String? value,
  }) =>
      Variable(
        name: name ?? this.name,
        value: value ?? this.value,
      );

  factory Variable.fromRawJson(String str) =>
      Variable.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Variable.fromJson(Map<String, dynamic> json) => Variable(
        name: json["name"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "value": value,
      };
}

class Deployment {
  String? platform;
  String? orchestration;
  String? deployScript;

  Deployment({
    this.platform,
    this.orchestration,
    this.deployScript,
  });

  Deployment copyWith({
    String? platform,
    String? orchestration,
    String? deployScript,
  }) =>
      Deployment(
        platform: platform ?? this.platform,
        orchestration: orchestration ?? this.orchestration,
        deployScript: deployScript ?? this.deployScript,
      );

  factory Deployment.fromRawJson(String str) =>
      Deployment.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Deployment.fromJson(Map<String, dynamic> json) => Deployment(
        platform: json["platform"],
        orchestration: json["orchestration"],
        deployScript: json["deploy_script"],
      );

  Map<String, dynamic> toJson() => {
        "platform": platform,
        "orchestration": orchestration,
        "deploy_script": deployScript,
      };
}

class Documentation {
  String? apiDocs;
  String? userManuals;
  String? setupGuide;

  Documentation({
    this.apiDocs,
    this.userManuals,
    this.setupGuide,
  });

  Documentation copyWith({
    String? apiDocs,
    String? userManuals,
    String? setupGuide,
  }) =>
      Documentation(
        apiDocs: apiDocs ?? this.apiDocs,
        userManuals: userManuals ?? this.userManuals,
        setupGuide: setupGuide ?? this.setupGuide,
      );

  factory Documentation.fromRawJson(String str) =>
      Documentation.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Documentation.fromJson(Map<String, dynamic> json) => Documentation(
        apiDocs: json["api_docs"],
        userManuals: json["user_manuals"],
        setupGuide: json["setup_guide"],
      );

  Map<String, dynamic> toJson() => {
        "api_docs": apiDocs,
        "user_manuals": userManuals,
        "setup_guide": setupGuide,
      };
}

class ErrorHandling {
  String? strategy;
  String? details;

  ErrorHandling({
    this.strategy,
    this.details,
  });

  ErrorHandling copyWith({
    String? strategy,
    String? details,
  }) =>
      ErrorHandling(
        strategy: strategy ?? this.strategy,
        details: details ?? this.details,
      );

  factory ErrorHandling.fromRawJson(String str) =>
      ErrorHandling.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ErrorHandling.fromJson(Map<String, dynamic> json) => ErrorHandling(
        strategy: json["strategy"],
        details: json["details"],
      );

  Map<String, dynamic> toJson() => {
        "strategy": strategy,
        "details": details,
      };
}

class Localization {
  List<String>? supportedLanguages;
  String? defaultLanguage;

  Localization({
    this.supportedLanguages,
    this.defaultLanguage,
  });

  Localization copyWith({
    List<String>? supportedLanguages,
    String? defaultLanguage,
  }) =>
      Localization(
        supportedLanguages: supportedLanguages ?? this.supportedLanguages,
        defaultLanguage: defaultLanguage ?? this.defaultLanguage,
      );

  factory Localization.fromRawJson(String str) =>
      Localization.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Localization.fromJson(Map<String, dynamic> json) => Localization(
        supportedLanguages: json["supported_languages"] == null
            ? []
            : List<String>.from(json["supported_languages"]!.map((x) => x)),
        defaultLanguage: json["default_language"],
      );

  Map<String, dynamic> toJson() => {
        "supported_languages": supportedLanguages == null
            ? []
            : List<dynamic>.from(supportedLanguages!.map((x) => x)),
        "default_language": defaultLanguage,
      };
}

class Logging {
  String? level;
  String? destination;
  String? path;

  Logging({
    this.level,
    this.destination,
    this.path,
  });

  Logging copyWith({
    String? level,
    String? destination,
    String? path,
  }) =>
      Logging(
        level: level ?? this.level,
        destination: destination ?? this.destination,
        path: path ?? this.path,
      );

  factory Logging.fromRawJson(String str) => Logging.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Logging.fromJson(Map<String, dynamic> json) => Logging(
        level: json["level"],
        destination: json["destination"],
        path: json["path"],
      );

  Map<String, dynamic> toJson() => {
        "level": level,
        "destination": destination,
        "path": path,
      };
}

class Microservice {
  String? name;
  String? description;
  String? repository;
  List<String>? apiEndpoints;

  Microservice({
    this.name,
    this.description,
    this.repository,
    this.apiEndpoints,
  });

  Microservice copyWith({
    String? name,
    String? description,
    String? repository,
    List<String>? apiEndpoints,
  }) =>
      Microservice(
        name: name ?? this.name,
        description: description ?? this.description,
        repository: repository ?? this.repository,
        apiEndpoints: apiEndpoints ?? this.apiEndpoints,
      );

  factory Microservice.fromRawJson(String str) =>
      Microservice.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Microservice.fromJson(Map<String, dynamic> json) => Microservice(
        name: json["name"],
        description: json["description"],
        repository: json["repository"],
        apiEndpoints: json["api_endpoints"] == null
            ? []
            : List<String>.from(json["api_endpoints"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "repository": repository,
        "api_endpoints": apiEndpoints == null
            ? []
            : List<dynamic>.from(apiEndpoints!.map((x) => x)),
      };
}

class NotificationSettings {
  Email? email;
  Sms? sms;

  NotificationSettings({
    this.email,
    this.sms,
  });

  NotificationSettings copyWith({
    Email? email,
    Sms? sms,
  }) =>
      NotificationSettings(
        email: email ?? this.email,
        sms: sms ?? this.sms,
      );

  factory NotificationSettings.fromRawJson(String str) =>
      NotificationSettings.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory NotificationSettings.fromJson(Map<String, dynamic> json) =>
      NotificationSettings(
        email: json["email"] == null ? null : Email.fromJson(json["email"]),
        sms: json["sms"] == null ? null : Sms.fromJson(json["sms"]),
      );

  Map<String, dynamic> toJson() => {
        "email": email?.toJson(),
        "sms": sms?.toJson(),
      };
}

class Email {
  bool? enabled;
  String? template;

  Email({
    this.enabled,
    this.template,
  });

  Email copyWith({
    bool? enabled,
    String? template,
  }) =>
      Email(
        enabled: enabled ?? this.enabled,
        template: template ?? this.template,
      );

  factory Email.fromRawJson(String str) => Email.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Email.fromJson(Map<String, dynamic> json) => Email(
        enabled: json["enabled"],
        template: json["template"],
      );

  Map<String, dynamic> toJson() => {
        "enabled": enabled,
        "template": template,
      };
}

class Sms {
  bool? enabled;

  Sms({
    this.enabled,
  });

  Sms copyWith({
    bool? enabled,
  }) =>
      Sms(
        enabled: enabled ?? this.enabled,
      );

  factory Sms.fromRawJson(String str) => Sms.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Sms.fromJson(Map<String, dynamic> json) => Sms(
        enabled: json["enabled"],
      );

  Map<String, dynamic> toJson() => {
        "enabled": enabled,
      };
}

class RateLimiting {
  int? requestsPerMinute;
  int? burstLimit;

  RateLimiting({
    this.requestsPerMinute,
    this.burstLimit,
  });

  RateLimiting copyWith({
    int? requestsPerMinute,
    int? burstLimit,
  }) =>
      RateLimiting(
        requestsPerMinute: requestsPerMinute ?? this.requestsPerMinute,
        burstLimit: burstLimit ?? this.burstLimit,
      );

  factory RateLimiting.fromRawJson(String str) =>
      RateLimiting.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RateLimiting.fromJson(Map<String, dynamic> json) => RateLimiting(
        requestsPerMinute: json["requests_per_minute"],
        burstLimit: json["burst_limit"],
      );

  Map<String, dynamic> toJson() => {
        "requests_per_minute": requestsPerMinute,
        "burst_limit": burstLimit,
      };
}

class Schema {
  String? id;
  String? name;
  String? description;
  List<Property>? properties;

  Schema({
    this.name,
    this.description,
    this.properties,
  });

  Schema copyWith({
    String? name,
    String? description,
    List<Property>? properties,
  }) =>
      Schema(
        name: name ?? this.name,
        description: description ?? this.description,
        properties: properties ?? this.properties,
      );

  factory Schema.fromRawJson(String str) => Schema.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Schema.fromJson(Map<String, dynamic> json) => Schema(
        name: json["name"],
        description: json["description"],
        properties: json["properties"] == null
            ? []
            : List<Property>.from(
                json["properties"]!.map((x) => Property.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "properties": properties == null
            ? []
            : List<dynamic>.from(properties!.map((x) => x.toJson())),
      };
}

class Property {
  String? name;
  String? type;
  String? description;
  String? format;
  int? maxLength;

  Property({
    this.name,
    this.type,
    this.description,
    this.format,
    this.maxLength,
  });

  Property copyWith({
    String? name,
    String? type,
    String? description,
    String? format,
    int? maxLength,
  }) =>
      Property(
        name: name ?? this.name,
        type: type ?? this.type,
        description: description ?? this.description,
        format: format ?? this.format,
        maxLength: maxLength ?? this.maxLength,
      );

  factory Property.fromRawJson(String str) =>
      Property.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Property.fromJson(Map<String, dynamic> json) => Property(
        name: json["name"],
        type: json["type"],
        description: json["description"],
        format: json["format"],
        maxLength: json["maxLength"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "type": type,
        "description": description,
        "format": format,
        "maxLength": maxLength,
      };
}

class Definition {
  String? name;
  String? description;
  List<Property>? properties;

  Definition({
    this.name,
    this.description,
    this.properties,
  });

  Definition copyWith({
    String? name,
    String? description,
    List<Property>? properties,
  }) =>
      Definition(
        name: name ?? this.name,
        description: description ?? this.description,
        properties: properties ?? this.properties,
      );

  factory Definition.fromRawJson(String str) =>
      Definition.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Definition.fromJson(Map<String, dynamic> json) => Definition(
        name: json["name"],
        description: json["description"],
        properties: json["properties"] == null
            ? []
            : List<Property>.from(
                json["properties"]!.map((x) => Property.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "properties": properties == null
            ? []
            : List<dynamic>.from(properties!.map((x) => x.toJson())),
      };
}

enum Type { BOOLEAN, STRING }

final typeValues = EnumValues({"boolean": Type.BOOLEAN, "string": Type.STRING});

class Security {
  String? encryption;
  String? apiKey;
  bool? ssl;

  Security({
    this.encryption,
    this.apiKey,
    this.ssl,
  });

  Security copyWith({
    String? encryption,
    String? apiKey,
    bool? ssl,
  }) =>
      Security(
        encryption: encryption ?? this.encryption,
        apiKey: apiKey ?? this.apiKey,
        ssl: ssl ?? this.ssl,
      );

  factory Security.fromRawJson(String str) =>
      Security.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Security.fromJson(Map<String, dynamic> json) => Security(
        encryption: json["encryption"],
        apiKey: json["api_key"],
        ssl: json["ssl"],
      );

  Map<String, dynamic> toJson() => {
        "encryption": encryption,
        "api_key": apiKey,
        "ssl": ssl,
      };
}

class UseCase {
  String? name;
  String? type;
  String? description;
  Details? details;

  UseCase({
    this.name,
    this.type,
    this.description,
    this.details,
  });

  UseCase copyWith({
    String? name,
    String? type,
    String? description,
    Details? details,
  }) =>
      UseCase(
        name: name ?? this.name,
        type: type ?? this.type,
        description: description ?? this.description,
        details: details ?? this.details,
      );

  factory UseCase.fromRawJson(String str) => UseCase.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UseCase.fromJson(Map<String, dynamic> json) => UseCase(
        name: json["name"],
        type: json["type"],
        description: json["description"],
        details:
            json["details"] == null ? null : Details.fromJson(json["details"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "type": type,
        "description": description,
        "details": details?.toJson(),
      };
}

class Details {
  List<Endpoint>? endpoints;
  String? requestFormat;
  String? responseFormat;
  List<ValidationRule>? validationRules;
  String? linkFormat;
  String? security;
  String? linkExpiry;
  List<String>? permissionsRequired;

  Details({
    this.endpoints,
    this.requestFormat,
    this.responseFormat,
    this.validationRules,
    this.linkFormat,
    this.security,
    this.linkExpiry,
    this.permissionsRequired,
  });

  Details copyWith({
    List<Endpoint>? endpoints,
    String? requestFormat,
    String? responseFormat,
    List<ValidationRule>? validationRules,
    String? linkFormat,
    String? security,
    String? linkExpiry,
    List<String>? permissionsRequired,
  }) =>
      Details(
        endpoints: endpoints ?? this.endpoints,
        requestFormat: requestFormat ?? this.requestFormat,
        responseFormat: responseFormat ?? this.responseFormat,
        validationRules: validationRules ?? this.validationRules,
        linkFormat: linkFormat ?? this.linkFormat,
        security: security ?? this.security,
        linkExpiry: linkExpiry ?? this.linkExpiry,
        permissionsRequired: permissionsRequired ?? this.permissionsRequired,
      );

  factory Details.fromRawJson(String str) => Details.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Details.fromJson(Map<String, dynamic> json) => Details(
        endpoints: json["endpoints"] == null
            ? []
            : List<Endpoint>.from(
                json["endpoints"]!.map((x) => Endpoint.fromJson(x))),
        requestFormat: json["request_format"],
        responseFormat: json["response_format"],
        validationRules: json["validation_rules"] == null
            ? []
            : List<ValidationRule>.from(json["validation_rules"]!
                .map((x) => ValidationRule.fromJson(x))),
        linkFormat: json["link_format"],
        security: json["security"],
        linkExpiry: json["link_expiry"],
        permissionsRequired: json["permissions_required"] == null
            ? []
            : List<String>.from(json["permissions_required"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "endpoints": endpoints == null
            ? []
            : List<dynamic>.from(endpoints!.map((x) => x.toJson())),
        "request_format": requestFormat,
        "response_format": responseFormat,
        "validation_rules": validationRules == null
            ? []
            : List<dynamic>.from(validationRules!.map((x) => x.toJson())),
        "link_format": linkFormat,
        "security": security,
        "link_expiry": linkExpiry,
        "permissions_required": permissionsRequired == null
            ? []
            : List<dynamic>.from(permissionsRequired!.map((x) => x)),
      };
}

class Endpoint {
  String? path;
  List<String>? methods;

  Endpoint({
    this.path,
    this.methods,
  });

  Endpoint copyWith({
    String? path,
    List<String>? methods,
  }) =>
      Endpoint(
        path: path ?? this.path,
        methods: methods ?? this.methods,
      );

  factory Endpoint.fromRawJson(String str) =>
      Endpoint.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Endpoint.fromJson(Map<String, dynamic> json) => Endpoint(
        path: json["path"],
        methods: json["methods"] == null
            ? []
            : List<String>.from(json["methods"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "path": path,
        "methods":
            methods == null ? [] : List<dynamic>.from(methods!.map((x) => x)),
      };
}

class ValidationRule {
  String? field;
  bool? required;
  int? maxLength;

  ValidationRule({
    this.field,
    this.required,
    this.maxLength,
  });

  ValidationRule copyWith({
    String? field,
    bool? required,
    int? maxLength,
  }) =>
      ValidationRule(
        field: field ?? this.field,
        required: required ?? this.required,
        maxLength: maxLength ?? this.maxLength,
      );

  factory ValidationRule.fromRawJson(String str) =>
      ValidationRule.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ValidationRule.fromJson(Map<String, dynamic> json) => ValidationRule(
        field: json["field"],
        required: json["required"],
        maxLength: json["max_length"],
      );

  Map<String, dynamic> toJson() => {
        "field": field,
        "required": required,
        "max_length": maxLength,
      };
}

class Validation {
  String? schemaValidation;
  String? integrationTesting;

  Validation({
    this.schemaValidation,
    this.integrationTesting,
  });

  Validation copyWith({
    String? schemaValidation,
    String? integrationTesting,
  }) =>
      Validation(
        schemaValidation: schemaValidation ?? this.schemaValidation,
        integrationTesting: integrationTesting ?? this.integrationTesting,
      );

  factory Validation.fromRawJson(String str) =>
      Validation.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Validation.fromJson(Map<String, dynamic> json) => Validation(
        schemaValidation: json["schema_validation"],
        integrationTesting: json["integration_testing"],
      );

  Map<String, dynamic> toJson() => {
        "schema_validation": schemaValidation,
        "integration_testing": integrationTesting,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

class Repository {
  String? name;
  String? description;
  String? entity;
  List<Method>? methods;
  RepoConfiguration? configuration;

  Repository({
    this.name,
    this.description,
    this.entity,
    this.methods,
    this.configuration,
  });

  Repository copyWith({
    String? name,
    String? description,
    String? entity,
    List<Method>? methods,
    RepoConfiguration? configuration,
  }) =>
      Repository(
        name: name ?? this.name,
        description: description ?? this.description,
        entity: entity ?? this.entity,
        methods: methods ?? this.methods,
        configuration: configuration ?? this.configuration,
      );

  factory Repository.fromRawJson(String str) =>
      Repository.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Repository.fromJson(Map<String, dynamic> json) => Repository(
        name: json["name"],
        description: json["description"],
        entity: json["entity"],
        methods: json["methods"] == null
            ? []
            : List<Method>.from(
                json["methods"]!.map((x) => Method.fromJson(x))),
        configuration: json["configuration"] == null
            ? null
            : RepoConfiguration.fromJson(json["configuration"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "entity": entity,
        "methods": methods?.map((e) => e.toJson()).toList(),
        "configuration": configuration?.toJson(),
      };
}

class RepoConfiguration {
  String? database;
  String? tableName;

  RepoConfiguration({
    this.database,
    this.tableName,
  });

  RepoConfiguration copyWith({
    String? database,
    String? tableName,
  }) =>
      RepoConfiguration(
        database: database ?? this.database,
        tableName: tableName ?? this.tableName,
      );

  factory RepoConfiguration.fromRawJson(String str) =>
      RepoConfiguration.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RepoConfiguration.fromJson(Map<String, dynamic> json) =>
      RepoConfiguration(
        database: json["database"],
        tableName: json["table_name"],
      );

  Map<String, dynamic> toJson() => {
        "database": database,
        "table_name": tableName,
      };
}

class Method {
  String? type;
  List<Instance>? instances;

  Method({
    this.type,
    this.instances,
  });

  Method copyWith({
    String? type,
    List<Instance>? instances,
  }) =>
      Method(
        type: type ?? this.type,
        instances: instances ?? this.instances,
      );

  factory Method.fromRawJson(String str) => Method.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Method.fromJson(Map<String, dynamic> json) => Method(
        type: json["type"],
        instances: json["instances"] == null
            ? []
            : List<Instance>.from(
                json["instances"]!.map((x) => Instance.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "instances": instances == null
            ? []
            : List<dynamic>.from(instances!.map((x) => x.toJson())),
      };
}

class Instance {
  String? name;
  String? description;
  List<InputParam>? inputParams;
  String? outputType;
  String? outputDescription;

  Instance({
    this.name,
    this.description,
    this.inputParams,
    this.outputType,
    this.outputDescription,
  });

  Instance copyWith({
    String? name,
    String? description,
    List<InputParam>? inputParams,
    String? outputType,
    String? outputDescription,
  }) =>
      Instance(
        name: name ?? this.name,
        description: description ?? this.description,
        inputParams: inputParams ?? this.inputParams,
        outputType: outputType ?? this.outputType,
        outputDescription: outputDescription ?? this.outputDescription,
      );

  factory Instance.fromRawJson(String str) =>
      Instance.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Instance.fromJson(Map<String, dynamic> json) => Instance(
        name: json["name"],
        description: json["description"],
        inputParams: json["input_params"] == null
            ? []
            : List<InputParam>.from(
                json["input_params"]!.map((x) => InputParam.fromJson(x))),
        outputType: json["output_type"],
        outputDescription: json["output_description"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "input_params": inputParams == null
            ? []
            : List<dynamic>.from(inputParams!.map((x) => x.toJson())),
        "output_type": outputType,
        "output_description": outputDescription,
      };
}

class InputParam {
  String? name;
  String? type;
  String? description;

  InputParam({
    this.name,
    this.type,
    this.description,
  });

  InputParam copyWith({
    String? name,
    String? type,
    String? description,
  }) =>
      InputParam(
        name: name ?? this.name,
        type: type ?? this.type,
        description: description ?? this.description,
      );

  factory InputParam.fromRawJson(String str) =>
      InputParam.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory InputParam.fromJson(Map<String, dynamic> json) => InputParam(
        name: json["name"],
        type: json["type"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "type": type,
        "description": description,
      };
}
