-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/jfGWhC
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "card_holder" (
    "holder_id" int   NOT NULL,
    "holder_name" varchar(50)   NOT NULL,
    CONSTRAINT "pk_card_holder" PRIMARY KEY (
        "holder_id"
     )
);

CREATE TABLE "credit_card" (
    "card_number" varchar(20)   NOT NULL,
    "holder_id" int   NOT NULL,
    CONSTRAINT "pk_credit_card" PRIMARY KEY (
        "card_number"
     )
);

CREATE TABLE "merchant_category" (
    "cat_id" int   NOT NULL,
    "category" varchar(20)   NOT NULL,
    CONSTRAINT "pk_merchant_category" PRIMARY KEY (
        "cat_id"
     )
);

CREATE TABLE "merchant" (
    "merch_id" int   NOT NULL,
    "merchant_name" varchar(50)   NOT NULL,
    "cat_id" int   NOT NULL,
    CONSTRAINT "pk_merchant" PRIMARY KEY (
        "merch_id"
     )
);

CREATE TABLE "transactions" (
    "id" int   NOT NULL,
    "date" timestamp   NOT NULL,
    "amount" decimal(2)   NOT NULL,
    "card_number" varchar(20)   NOT NULL,
    "merch_id" int   NOT NULL,
    CONSTRAINT "pk_transactions" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "credit_card" ADD CONSTRAINT "fk_credit_card_holder_id" FOREIGN KEY("holder_id")
REFERENCES "card_holder" ("holder_id");

ALTER TABLE "merchant" ADD CONSTRAINT "fk_merchant_cat_id" FOREIGN KEY("cat_id")
REFERENCES "merchant_category" ("cat_id");

ALTER TABLE "transactions" ADD CONSTRAINT "fk_transactions_card_number" FOREIGN KEY("card_number")
REFERENCES "credit_card" ("card_number");

ALTER TABLE "transactions" ADD CONSTRAINT "fk_transactions_merch_id" FOREIGN KEY("merch_id")
REFERENCES "merchant" ("merch_id");

