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
    "id"          int8         NOT NULL,
    "name"        varchar(255) NOT NULL,
    "model"       varchar(255),
    "warnings"    varchar(255),
    "description" varchar(255) NOT NULL,
    "studio_id"   int8,
    primary key (id)
);

CREATE TABLE "rentals"
(
    "id"           int8 NOT NULL,
    "rental_date"  date NOT NULL,
    "return_date"  date NOT NULL,
    "equipment_id" int8,
    "user_id"      int8,
    primary key (id)
);

CREATE
INDEX "IX_Relationship1" ON "equipment" ("studio_id");

CREATE
INDEX "IX_Relationship2" ON "rentals" ("equipment_id");

CREATE
INDEX "IX_Relationship3" ON "rentals" ("user_id");

CREATE
INDEX "IX_Relationship4" ON "studios" ("location_id");

CREATE
INDEX "IX_Relationship7" ON "users" ("studio_id");

CREATE
INDEX "IX_Relationship8" ON "users" ("location_id");


ALTER TABLE "rentals"
    ADD CONSTRAINT "Relationship2" FOREIGN KEY ("equipment_id") REFERENCES "equipment" ("id");

ALTER TABLE "rentals"
    ADD CONSTRAINT "Relationship3" FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "studios"
    ADD CONSTRAINT "Relationship4" FOREIGN KEY ("location_id") REFERENCES "locations" ("id");

ALTER TABLE "users"
    ADD CONSTRAINT "Relationship7" FOREIGN KEY ("studio_id") REFERENCES "studios" ("id");

ALTER TABLE "users"
    ADD CONSTRAINT "Relationship8" FOREIGN KEY ("location_id") REFERENCES "locations" ("id");

ALTER TABLE "equipment"
    ADD CONSTRAINT "Relationship1" FOREIGN KEY ("studio_id") REFERENCES "studios" ("id");

INSERT INTO locations(id, name,post) VALUES(1,'Adlešiči','8341');
INSERT INTO locations(id, name,post) VALUES(2,'Ajdovščina','5270');
INSERT INTO locations(id, name,post) VALUES(3,'Ankaran - Ancarano','6280');
INSERT INTO locations(id, name,post) VALUES(4,'Apače','9253');


INSERT INTO studios (id, name, address, email, location_id)
VALUES (1, 'Filmski studio Viba film', 'Stegne 5', 'StudioViba@info.si', 1);


INSERT INTO users (id, first_name, last_name, email, pass, studio_id, location_id)
VALUES (1, 'Marcel', 'Zep', 'mici.zep@gmail.com', 'test', 1, 1);

INSERT INTO users (id, first_name, last_name, email, pass, studio_id, location_id)
VALUES (2, 'Tadej', 'Delopst', 'tadejdelopst@gmail.com', 'test', 1, 2);

INSERT INTO users (id, first_name, last_name, email, pass, studio_id, location_id)
VALUES (3, 'Tilen', 'Hostnik', 'tilen.hostnik@gmail.com', 'test', 1, 3);

INSERT INTO users (id, first_name, last_name, email, pass, studio_id, location_id)
VALUES (4, 'Mark', 'Legner', 'merki@gmail.com', 'test', 1, 4);


INSERT INTO equipment (id, name, model, warnings, description, studio_id)
VALUES (1,'kamera' , 'Nikon 4555', 'Ni opomb.', 'kamera, ki dela popolno.', 1);

INSERT INTO equipment (id, name, model, warnings, description, studio_id)
VALUES (2,'mikrofon' , 'HyperX 556', 'Malce poškodovana pena. ', 'Mikrofon za zajem zvoka v precej malem območju in za zmanjšanje zvokov iz ozadja.', 1);

INSERT INTO equipment (id, name, model, warnings, description, studio_id)
VALUES (3,'zeleno platno' , 'GR69', 'Ni opomb.', 'Platno, ki se uporablja za posebne efekte ozadja pri snemanju.', 1);

INSERT INTO equipment (id, name, model, warnings, description, studio_id)
VALUES (4,'kamera' , 'Nikon 420 stoner edition', 'Ni opomb.', 'Kamera za kadre, ki se snemajo bolj od daleč, saj ima širokokotne leče', 1);





INSERT INTO studios (id, name, address, email, location_id)
VALUES (2, 'Filmski studio VPK', 'Kranjčeva ulica 22', 'Studio.VPK@gmail.com', 1);


INSERT INTO users (id, first_name, last_name, email, pass, studio_id, location_id)
VALUES (5, 'Jon', 'Rojnik', 'jon.r.gorsek@gmail.com', 'test', 2, 1);

INSERT INTO users (id, first_name, last_name, email, pass, studio_id, location_id)
VALUES (6, 'Aleks', 'Vrenko', 'aleks.vrenko@gmail.com', 'test', 2, 2);

INSERT INTO users (id, first_name, last_name, email, pass, studio_id, location_id)
VALUES (7, 'Maks', 'Bah', 'maksbah@gmail.com', 'test', 2, 3);

INSERT INTO users (id, first_name, last_name, email, pass, studio_id, location_id)
VALUES (8, 'Tim', 'Detečnik', 'dteam@gmail.com', 'test', 2, 4);


INSERT INTO equipment (id, name, model, warnings, description, studio_id)
VALUES (5,'Diktafon' , 'DICK22', 'Ni opomb.', 'Za snemanje zvoka, ki ima zelo dobro hvaliteto, seveda pa zajema vse zvoke iz ozadja.', 2);

INSERT INTO equipment (id, name, model, warnings, description, studio_id)
VALUES (6,'Kamera' , 'Nikon 40', 'Držalo je malce opraskano. ', 'To je kamera za snemanje kvalitetne slike', 2);

INSERT INTO equipment (id, name, model, warnings, description, studio_id)
VALUES (7,'Zeleno platno' , 'GRNSRN', 'Ni opomb.', 'Platno, ki se uporablja za posebne efekte ozadja pri snemanju.', 2);

INSERT INTO equipment (id, name, model, warnings, description, studio_id)
VALUES (8,'Kamera' , 'Cannon 426', 'Ni opomb.', 'Taka fajna kamera. Res!', 2);




INSERT INTO studios (id, name, address, email, location_id)
VALUES (3, 'Filmski studio Arkadena', 'Brodišče 23', 'Arkadena@info.si', 1);


INSERT INTO users (id, first_name, last_name, email, pass, studio_id, location_id)
VALUES (9, 'Dejan', 'Soleša', 'dejansolesa@gmail.com', 'test', 3, 1);

INSERT INTO users (id, first_name, last_name, email, pass, studio_id, location_id)
VALUES (10, 'Nick', 'Srebot', 'nicksrebot@gmail.com', 'test', 3, 2);

INSERT INTO users (id, first_name, last_name, email, pass, studio_id, location_id)
VALUES (11, 'Matic', 'Ozimic', 'pička.peder@gmail.com', 'test', 3, 3);

INSERT INTO users (id, first_name, last_name, email, pass, studio_id, location_id)
VALUES (12, 'Melita', 'Cvikl', 'melita.cvikl@gmail.com', 'test', 3, 4);


INSERT INTO equipment (id, name, model, warnings, description, studio_id)
VALUES (9,'Kamera' , 'Cannon 458', 'Ni opomb.', 'kamera, ki dela ful vredu.', 3);

INSERT INTO equipment (id, name, model, warnings, description, studio_id)
VALUES (10,'Mikrofon' , 'MIC42', 'Na momente kabel ne dela najbolje. ', 'Mikrofon snema zvok v zelo dobri kvaliteti', 3);

INSERT INTO equipment (id, name, model, warnings, description, studio_id)
VALUES (11,'Kamera' , 'NIKON23', 'Ni opomb.', 'Snema lahko v vseh svetlobah in da ven lepo fotografijo.', 3);

INSERT INTO equipment (id, name, model, warnings, description, studio_id)
VALUES (12,'Kamera' , 'Samsung2373', 'Ni opomb.', 'Pametna kamera, ki jo lahko upravljaš z glasom', 3);





INSERT INTO studios (id, name, address, email, location_id)
VALUES (4, 'Filmski studio Partizanka', 'Dunajska cesta 123', 'Partizanka@gmail.com', 1);


INSERT INTO users (id, first_name, last_name, email, pass, studio_id, location_id)
VALUES (12, 'Nada', 'Pirnat', 'nadapirnat@gmail.com', 'test', 4, 1);

INSERT INTO users (id, first_name, last_name, email, pass, studio_id, location_id)
VALUES (13, 'Nick', 'Srebot', 'nicksrebot@gmail.com', 'test', 4, 2);

INSERT INTO users (id, first_name, last_name, email, pass, studio_id, location_id)
VALUES (14, 'Matic', 'Ozimic', 'pička.peder@gmail.com', 'test', 4, 3);

INSERT INTO users (id, first_name, last_name, email, pass, studio_id, location_id)
VALUES (15, 'Melita', 'Cvikl', 'melita.cvikl@gmail.com', 'test', 4, 4);


INSERT INTO equipment (id, name, model, warnings, description, studio_id)
VALUES (12,'Kamera' , 'Nikon 11', 'Ni opomb.', 'kamera za vsakdanje snemanje.', 4);

INSERT INTO equipment (id, name, model, warnings, description, studio_id)
VALUES (13,'Mikrofon' , 'MIC242', 'Ni opomb', 'navaden mikrofon za snemanje zvoka.', 4);

INSERT INTO equipment (id, name, model, warnings, description, studio_id)
VALUES (14,'Zeleno platno' , 'GREEN146', 'Ni opomb.', 'Za dodajanje efektov v ozadju', 4);

INSERT INTO equipment (id, name, model, warnings, description, studio_id)
VALUES (15,'Kamera' , 'Pyhit2373', 'Ni opomb.', 'Kamera z lepo slilo.', 4);



INSERT INTO rentals (id, rental_date, return_date, equipment_id, user_id)
VALUES(1, '12-4-2021', '12-5-2021' , 15 , 1 );

INSERT INTO rentals (id, rental_date, return_date, equipment_id, user_id)
VALUES(2, '22-6-2021', '22-7-2021' , 13 , 3 );

INSERT INTO rentals (id, rental_date, return_date, equipment_id, user_id)
VALUES(3, '13-9-2021', '13-10-2021' , 11 , 5 );

INSERT INTO rentals (id, rental_date, return_date, equipment_id, user_id)
VALUES(4, '13-12-2021', '13-1-2022' , 9 , 7 );

INSERT INTO rentals (id, rental_date, return_date, equipment_id, user_id)
VALUES(5, '4-4-2021', '4-5-2021' , 7 , 9 );

INSERT INTO rentals (id, rental_date, return_date, equipment_id, user_id)
VALUES(6, '1-1-2021', '1-2-2021' , 5 , 11 );

INSERT INTO rentals (id, rental_date, return_date, equipment_id, user_id)
VALUES(7, '30-9-2021', '30-10-2021' , 3 , 13 );

INSERT INTO rentals (id, rental_date, return_date, equipment_id, user_id)
VALUES(8, '13-9-2021', '13-10-2021' , 1 , 15 );