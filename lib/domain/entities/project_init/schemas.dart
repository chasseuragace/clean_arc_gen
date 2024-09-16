final userSchema = {
  "name": "User",
  "description": "Schema for managing users",
  "properties": [
    {
      "name": "id",
      "type": "string",
      "description": "Unique identifier for the user",
      "format": "uuid"
    },
    {
      "name": "username",
      "type": "string",
      "description": "Username of the user",
      "maxLength": 50
    },
    {
      "name": "email",
      "type": "string",
      "description": "Email address of the user",
      "format": "email"
    },
    {
      "name": "password_hash",
      "type": "string",
      "description": "Hashed password of the user",
      "format": "password"
    },
    {
      "name": "created_at",
      "type": "string",
      "format": "date-time",
      "description": "Timestamp when the user was created"
    },
    {
      "name": "updated_at",
      "type": "string",
      "format": "date-time",
      "description": "Timestamp when the user was last updated"
    }
  ]
};
final todoSchema = {
  "name": "Todo",
  "description": "Schema for managing to-dos",
  "properties": [
    {
      "name": "id",
      "type": "string",
      "description": "Unique identifier for the todo item",
      "format": "uuid"
    },
    {
      "name": "user_id",
      "type": "string",
      "description": "Identifier of the user who created the todo item",
      "format": "uuid"
    },
    {
      "name": "title",
      "type": "string",
      "description": "Title of the todo item",
      "maxLength": 255
    },
    {
      "name": "description",
      "type": "string",
      "description": "Description of the todo item",
      "maxLength": 1000
    },
    {
      "name": "completed",
      "type": "boolean",
      "description": "Indicates whether the todo item is completed"
    },
    {
      "name": "created_at",
      "type": "string",
      "format": "date-time",
      "description": "Timestamp when the todo item was created"
    },
    {
      "name": "updated_at",
      "type": "string",
      "format": "date-time",
      "description": "Timestamp when the todo item was last updated"
    }
  ]
};
final productSchema = {
  "name": "Product",
  "description": "Schema for managing products",
  "properties": [
    {
      "name": "id",
      "type": "string",
      "description": "Unique identifier for the product",
      "format": "uuid"
    },
    {
      "name": "name",
      "type": "string",
      "description": "Name of the product",
      "maxLength": 100
    },
    {
      "name": "description",
      "type": "string",
      "description": "Description of the product",
      "maxLength": 1000
    },
    {
      "name": "price",
      "type": "number",
      "description": "Price of the product",
      "format": "float"
    },
    {
      "name": "stock_quantity",
      "type": "integer",
      "description": "Quantity of the product in stock"
    },
    {
      "name": "created_at",
      "type": "string",
      "format": "date-time",
      "description": "Timestamp when the product was created"
    },
    {
      "name": "updated_at",
      "type": "string",
      "format": "date-time",
      "description": "Timestamp when the product was last updated"
    }
  ]
};
final orderSchema = {
  "name": "Order",
  "description": "Schema for managing orders",
  "properties": [
    {
      "name": "id",
      "type": "string",
      "description": "Unique identifier for the order",
      "format": "uuid"
    },
    {
      "name": "user_id",
      "type": "string",
      "description": "Identifier of the user who placed the order",
      "format": "uuid"
    },
    {
      "name": "product_ids",
      "type": "array",
      "description": "List of product identifiers in the order",
      "items": {"type": "string", "format": "uuid"}
    },
    {
      "name": "total_amount",
      "type": "number",
      "description": "Total amount of the order",
      "format": "float"
    },
    {
      "name": "status",
      "type": "string",
      "description": "Status of the order (e.g., pending, shipped, completed)",
      "enum": ["pending", "shipped", "completed", "canceled"]
    },
    {
      "name": "created_at",
      "type": "string",
      "format": "date-time",
      "description": "Timestamp when the order was created"
    },
    {
      "name": "updated_at",
      "type": "string",
      "format": "date-time",
      "description": "Timestamp when the order was last updated"
    }
  ]
};
final eventSchema = {
  "name": "Event",
  "description": "Schema for managing events",
  "properties": [
    {
      "name": "id",
      "type": "string",
      "description": "Unique identifier for the event",
      "format": "uuid"
    },
    {
      "name": "title",
      "type": "string",
      "description": "Title of the event",
      "maxLength": 100
    },
    {
      "name": "description",
      "type": "string",
      "description": "Description of the event",
      "maxLength": 1000
    },
    {
      "name": "start_time",
      "type": "string",
      "format": "date-time",
      "description": "Start time of the event"
    },
    {
      "name": "end_time",
      "type": "string",
      "format": "date-time",
      "description": "End time of the event"
    },
    {
      "name": "location",
      "type": "string",
      "description": "Location where the event takes place",
      "maxLength": 255
    },
    {
      "name": "created_at",
      "type": "string",
      "format": "date-time",
      "description": "Timestamp when the event was created"
    },
    {
      "name": "updated_at",
      "type": "string",
      "format": "date-time",
      "description": "Timestamp when the event was last updated"
    }
  ]
};
final commentSchema = {
  "name": "Comment",
  "description": "Schema for managing comments",
  "properties": [
    {
      "name": "id",
      "type": "string",
      "description": "Unique identifier for the comment",
      "format": "uuid"
    },
    {
      "name": "user_id",
      "type": "string",
      "description": "Identifier of the user who made the comment",
      "format": "uuid"
    },
    {
      "name": "content",
      "type": "string",
      "description": "Content of the comment",
      "maxLength": 1000
    },
    {
      "name": "timestamp",
      "type": "string",
      "format": "date-time",
      "description": "Timestamp when the comment was made"
    },
    {
      "name": "post_id",
      "type": "string",
      "description": "Identifier of the post or item the comment is related to",
      "format": "uuid"
    }
  ]
};
final addressSchema = {
  "name": "Address",
  "description": "Schema for managing addresses",
  "properties": [
    {
      "name": "id",
      "type": "string",
      "description": "Unique identifier for the address",
      "format": "uuid"
    },
    {
      "name": "street",
      "type": "string",
      "description": "Street address",
      "maxLength": 255
    },
    {"name": "city", "type": "string", "description": "City", "maxLength": 100},
    {
      "name": "state",
      "type": "string",
      "description": "State or region",
      "maxLength": 100
    },
    {
      "name": "postal_code",
      "type": "string",
      "description": "Postal or ZIP code",
      "maxLength": 20
    },
    {
      "name": "country",
      "type": "string",
      "description": "Country",
      "maxLength": 100
    }
  ]
};
final categorySchema = {
  "name": "Category",
  "description": "Schema for managing categories",
  "properties": [
    {
      "name": "id",
      "type": "string",
      "description": "Unique identifier for the category",
      "format": "uuid"
    },
    {
      "name": "name",
      "type": "string",
      "description": "Name of the category",
      "maxLength": 100
    },
    {
      "name": "description",
      "type": "string",
      "description": "Description of the category",
      "maxLength": 1000
    },
    {
      "name": "created_at",
      "type": "string",
      "format": "date-time",
      "description": "Timestamp when the category was created"
    },
    {
      "name": "updated_at",
      "type": "string",
      "format": "date-time",
      "description": "Timestamp when the category was last updated"
    }
  ]
};
final reviewSchema = {
  "name": "Review",
  "description": "Schema for managing reviews",
  "properties": [
    {
      "name": "id",
      "type": "string",
      "description": "Unique identifier for the review",
      "format": "uuid"
    },
    {
      "name": "user_id",
      "type": "string",
      "description": "Identifier of the user who wrote the review",
      "format": "uuid"
    },
    {
      "name": "product_id",
      "type": "string",
      "description": "Identifier of the product being reviewed",
      "format": "uuid"
    },
    {
      "name": "rating",
      "type": "integer",
      "description": "Rating given in the review (1 to 5)",
      "minimum": 1,
      "maximum": 5
    },
    {
      "name": "comment",
      "type": "string",
      "description": "Comment or text of the review",
      "maxLength": 1000
    },
    {
      "name": "created_at",
      "type": "string",
      "format": "date-time",
      "description": "Timestamp when the review was created"
    }
  ]
};
final invoiceSchema = {
  "name": "Invoice",
  "description": "Schema for managing invoices",
  "properties": [
    {
      "name": "id",
      "type": "string",
      "description": "Unique identifier for the invoice",
      "format": "uuid"
    },
    {
      "name": "user_id",
      "type": "string",
      "description": "Identifier of the user the invoice is issued to",
      "format": "uuid"
    },
    {
      "name": "amount",
      "type": "number",
      "description": "Total amount of the invoice",
      "format": "float"
    },
    {
      "name": "status",
      "type": "string",
      "description": "Status of the invoice (e.g., unpaid, paid)",
      "enum": ["unpaid", "paid", "overdue"]
    },
    {
      "name": "due_date",
      "type": "string",
      "format": "date-time",
      "description": "Due date of the invoice"
    },
    {
      "name": "created_at",
      "type": "string",
      "format": "date-time",
      "description": "Timestamp when the invoice was created"
    }
  ]
};
final messageSchema = {
  "name": "Message",
  "description": "Schema for managing messages",
  "properties": [
    {
      "name": "id",
      "type": "string",
      "description": "Unique identifier for the message",
      "format": "uuid"
    },
    {
      "name": "sender_id",
      "type": "string",
      "description": "Identifier of the user who sent the message",
      "format": "uuid"
    },
    {
      "name": "receiver_id",
      "type": "string",
      "description": "Identifier of the user who received the message",
      "format": "uuid"
    },
    {
      "name": "content",
      "type": "string",
      "description": "Content of the message",
      "maxLength": 1000
    },
    {
      "name": "timestamp",
      "type": "string",
      "format": "date-time",
      "description": "Timestamp when the message was sent"
    }
  ]
};
final subscriptionSchema = {
  "name": "Subscription",
  "description": "Schema for managing subscriptions",
  "properties": [
    {
      "name": "id",
      "type": "string",
      "description": "Unique identifier for the subscription",
      "format": "uuid"
    },
    {
      "name": "user_id",
      "type": "string",
      "description": "Identifier of the user with the subscription",
      "format": "uuid"
    },
    {
      "name": "plan_id",
      "type": "string",
      "description": "Identifier of the subscription plan",
      "format": "uuid"
    },
    {
      "name": "start_date",
      "type": "string",
      "format": "date-time",
      "description": "Start date of the subscription"
    },
    {
      "name": "end_date",
      "type": "string",
      "format": "date-time",
      "description": "End date of the subscription"
    },
    {
      "name": "status",
      "type": "string",
      "description":
          "Status of the subscription (e.g., active, expired, canceled)",
      "enum": ["active", "expired", "canceled"]
    }
  ]
};

List<Map<String, dynamic>> get allSchema => [
      userSchema,
      todoSchema,
      productSchema,
      orderSchema,
      eventSchema,
      commentSchema,
      addressSchema,
      categorySchema,
      reviewSchema,
      invoiceSchema,
      messageSchema,
      subscriptionSchema
    ];


//todo : each has String id 