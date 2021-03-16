CREATE SEQUENCE hibseq START 1 INCREMENT BY 50;

CREATE TABLE "studios"
(
    "id"          int8         NOT NULL,
    "name"        varchar(255) NOT NULL,
    "address"     varchar(255) NOT NULL,
    "email"       varchar(255) NOT NULL,
    "location_id" int8,
    primary key (id)
);

CREATE TABLE "users"
(
    "id"          int8          NOT NULL,
    "first_name"  varchar(255)  NOT NULL,
    "last_name"   varchar(255)  NOT NULL,
    "email"       varchar(255)  NOT NULL,
    "pass"        varchar(1024) NOT NULL,
    "studio_id"   int8,
    "location_id" int8,
    primary key (id)
);

CREATE TABLE "locations"
(
    "id"   int8         NOT NULL,
    "name" varchar(255) NOT NULL,
    "post" varchar(255) NOT NULL,
    primary key (id)
);

CREATE TABLE "studios"
(
    "id"          int8         NOT NULL,
    "name"        varchar(255) NOT NULL,
    "address"     varchar(255) NOT NULL,
    "email"       varchar(255) NOT NULL,
    "location_id" int8,
    primary key (id)
);

CREATE TABLE "equipment"
(
    "id" int8 NOT NULL,
    "name" varchar(255) NOT NULL,
    "model" varchar(255)
        "warnings" varchar(255)
        "description" varchar(255) NOT NULL,
    "studio_id" int8,
    primary key (id)
);

CREATE TABLE "rentals"
(
    "id" int8 NOT NULL,
    "rental_date" date NOT NULL,
    "return_date" date NOT NULL,
    "equipment_id" int8,
    "user_id" int8,
    primary key (id)
);

CREATE INDEX "IX_Relationship1" ON "equipment" ("studio_id");

CREATE INDEX "IX_Relationship2" ON "rentals" ("equipment_id");

CREATE INDEX "IX_Relationship3" ON "rentals" ("user_id");

CREATE INDEX "IX_Relationship4" ON "studios" ("location_id");

CREATE INDEX "IX_Relationship7" ON "users" ("studio_id");

CREATE INDEX "IX_Relationship8" ON "users" ("location_id");


ALTER TABLE "rentals" ADD CONSTRAINT "Relationship2" FOREIGN KEY ("equipment_id") REFERENCES "equipment" ("id");

ALTER TABLE "rentals" ADD CONSTRAINT "Relationship3" FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "studios" ADD CONSTRAINT "Relationship4" FOREIGN KEY ("location_id") REFERENCES "locations" ("id");

ALTER TABLE "users" ADD CONSTRAINT "Relationship7" FOREIGN KEY ("studio_id") REFERENCES "studios" ("id");

ALTER TABLE "users" ADD CONSTRAINT "Relationship8" FOREIGN KEY ("location_id") REFERENCES "locations" ("id");

ALTER TABLE "equipment" ADD CONSTRAINT "Relationship1" FOREIGN KEY ("studio_id") REFERENCES "studios" ("id");