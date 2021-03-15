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

CREATE
INDEX "IX_Relationship4" ON "studios" ("location_id");

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

CREATE
INDEX "IX_Relationship7" ON "users" ("studio_id");

CREATE
INDEX "IX_Relationship8" ON "users" ("location_id");


CREATE TABLE "locations"
(
    "id"   int8         NOT NULL,
    "name" varchar(255) NOT NULL,
    "post" varchar(255) NOT NULL,
    primary key (id)
);

ALTER TABLE "studios"
    ADD CONSTRAINT "Relationship4" FOREIGN KEY ("location_id") REFERENCES "locations" ("id");

ALTER TABLE "users"
    ADD CONSTRAINT "Relationship7" FOREIGN KEY ("studio_id") REFERENCES "studios" ("id");

ALTER TABLE "users"
    ADD CONSTRAINT "Relationship8" FOREIGN KEY ("location_id") REFERENCES "locations" ("id");

INSERT INTO locations(id, name, post)
VALUES (1, 'Adlešiči', '8341');

INSERT INTO studios (id, name, address, email, location_id)
VALUES (1, 'StudioEna', 'StudioEna23', 'StudioEna@gmail.com', 1);


INSERT INTO users (id, first_name, last_name, email, pass, studio_id, location_id)
VALUES (1, 'UserEnaName', 'UserEnaLastName', 'test@gmail.com', 'test', 1, 1);
