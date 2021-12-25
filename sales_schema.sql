
DROP TABLE IF EXISTS "customer";
CREATE TABLE "customer" (
    "customer_id" INT   NOT NULL,
    "first_name" VARCHAR(40)   NOT NULL,
    "middle_name" VARCHAR(40),
    "last_name" VARCHAR(40)   NOT NULL,
    "segment" VARCHAR(25),
    "order_id" INT   NOT NULL,
    CONSTRAINT "pk_customer" PRIMARY KEY (
        "customer_id"
     )
);

DROP TABLE IF EXISTS "orders";
CREATE TABLE "orders" (
    "order_id" INT   NOT NULL,
    "order_date" DATE   NOT NULL,
    "product_id" INT   NOT NULL,
    CONSTRAINT "pk_order" PRIMARY KEY (
        "order_id"
     )
);

DROP TABLE IF EXISTS "shipping";
CREATE TABLE "shipping" (
    "ship_id" INT   NOT NULL,
    "ship_date" DATE   NOT NULL,
    "ship_mode" VARCHAR(25),
    "zip_code" INT   NOT NULL,
    CONSTRAINT "pk_shipping" PRIMARY KEY (
        "ship_id"
     )
);

DROP TABLE IF EXISTS "address";
CREATE TABLE "address" (
    "postal_code" INT   NOT NULL,
    "city" VARCHAR(60)   NOT NULL,
    "state" VARCHAR(60)   NOT NULL,
    "country" VARCHAR(60)   NOT NULL,
    "region" VARCHAR(60)   NOT NULL,
    "customer_id" INT   NOT NULL,
    CONSTRAINT "pk_address" PRIMARY KEY (
        "postal_code"
     )
);

DROP TABLE IF EXISTS "product";
CREATE TABLE "product" (
    "product_id" INT   NOT NULL,
    "product_name" VARCHAR(80)   NOT NULL,
    "category" VARCHAR(50)   NOT NULL,
    "sub_category" VARCHAR(50)   NOT NULL,
    "sales_id" INT   NOT NULL,
    CONSTRAINT "pk_product" PRIMARY KEY (
        "product_id"
     )
);

DROP TABLE IF EXISTS "sales";
CREATE TABLE "sales" (
    "sales_id" INT   NOT NULL,
    "sale_price" FLOAT   NOT NULL,
    "quantity" INT   NOT NULL,
    "discount" FLOAT   NOT NULL,
    "profit" FLOAT   NOT NULL,
    "ship_id" INT   NOT NULL,
    CONSTRAINT "pk_sales" PRIMARY KEY (
        "sales_id"
     )
);

ALTER TABLE "customer" ADD CONSTRAINT "fk_customer_customer_id" FOREIGN KEY("customer_id")
REFERENCES "address" ("customer_id");

ALTER TABLE "customer" ADD CONSTRAINT "fk_customer_order_id" FOREIGN KEY("order_id")
REFERENCES "orders" ("order_id");

ALTER TABLE "address" ADD CONSTRAINT "fk_address_postal_code" FOREIGN KEY("postal_code")
REFERENCES "shipping" ("zip_code");

ALTER TABLE "product" ADD CONSTRAINT "fk_product_product_id" FOREIGN KEY("product_id")
REFERENCES "orders" ("product_id");

ALTER TABLE "product" ADD CONSTRAINT "fk_product_sales_id" FOREIGN KEY("sales_id")
REFERENCES "sales" ("sales_id");

ALTER TABLE "sales" ADD CONSTRAINT "fk_sales_ship_id" FOREIGN KEY("ship_id")
REFERENCES "shipping" ("ship_id");

