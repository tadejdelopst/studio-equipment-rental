CREATE SEQUENCE hibseq START 100 INCREMENT BY 50;

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
    "profile_image" oid,
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

CREATE TABLE "equipments"
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
INDEX "IX_Relationship1" ON "equipments" ("studio_id");

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
    ADD CONSTRAINT "Relationship2" FOREIGN KEY ("equipment_id") REFERENCES "equipments" ("id");

ALTER TABLE "rentals"
    ADD CONSTRAINT "Relationship3" FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "studios"
    ADD CONSTRAINT "Relationship4" FOREIGN KEY ("location_id") REFERENCES "locations" ("id");

ALTER TABLE "users"
    ADD CONSTRAINT "Relationship7" FOREIGN KEY ("studio_id") REFERENCES "studios" ("id");

ALTER TABLE "users"
    ADD CONSTRAINT "Relationship8" FOREIGN KEY ("location_id") REFERENCES "locations" ("id");

ALTER TABLE "equipments"
    ADD CONSTRAINT "Relationship1" FOREIGN KEY ("studio_id") REFERENCES "studios" ("id");

CREATE OR REPLACE FUNCTION FIND_ALL_LOCATIONS()
RETURNS TABLE(locationId int8, locationName character varying, locationPost character varying) AS
$$
BEGIN
RETURN QUERY SELECT id, name, post FROM locations ORDER BY name;
END;
$$ LANGUAGE 'plpgsql';

CREATE OR REPLACE FUNCTION FIND_ALL_EQUIPMENT_FOR_DELETE()
RETURNS TABLE(locationId int8, equipmentName character varying, equipmentModel character varying) AS
$$
BEGIN
RETURN QUERY SELECT id, name, model FROM equipments;
END;
$$ LANGUAGE 'plpgsql';

CREATE OR REPLACE FUNCTION FIND_ALL_EQUIPMENT_NOT_RENTED(studioId int)
RETURNS TABLE(equipmentId int8, equipmentName character varying, equipmentModel character varying) AS
$$
BEGIN
RETURN QUERY SELECT e.id, e.name, e.model FROM studios s
INNER JOIN equipments e ON s.id = e.studio_id
WHERE s.id != studioId and e.id NOT IN (SELECT equipment_id from rentals r INNER JOIN equipments e ON e.id = r.equipment_id WHERE e.studio_id != studioId);
END;
$$ LANGUAGE 'plpgsql';

CREATE OR REPLACE FUNCTION DELETE_RENTAL(EquipmentID int)
RETURNS int AS
$$
BEGIN
delete from rentals where equipment_id  = EquipmentID;
return 1;
END;
$$ LANGUAGE 'plpgsql';

CREATE OR REPLACE FUNCTION FIND_STUDIO_RENTED_EQUIPMENT(studioId int)
RETURNS TABLE(equipmentId int8, equipmentName character varying, equipmentModel character varying) AS
$$
BEGIN
RETURN QUERY select e.id,  e.name , e.model from studios s inner join equipments e on s.id=e.studio_id
inner join rentals r on e.id=r.equipment_id inner join users us on us.id=r.user_id
where r.user_id in (select use.id from users use inner join studios stu on stu.id=use.studio_id where use.studio_id = studioId);
END;
$$ LANGUAGE 'plpgsql';

ALTER TABLE studios
ADD user_count int8;

CREATE FUNCTION public.count_users()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$
DECLARE 
    id_studio int;
    id_user int;
    number int;
    BEGIN
        FOR id_studio IN SELECT id FROM studios
        LOOP
            number := 0;
            FOR id_user IN SELECT id FROM users
            LOOP
                IF((SELECT email
                   FROM users
                   WHERE id = id_user AND studio_id = id_studio ) IS NOT NULL) THEN
                    number := number + 1;
                END IF;
            END LOOP;
            UPDATE studios
            SET user_count = number
            WHERE id = id_studio;
        END LOOP;
    RETURN NULL;
    END;
$BODY$;


CREATE TRIGGER trigger_users
AFTER INSERT OR DELETE OR UPDATE 
ON public.users
FOR EACH ROW
EXECUTE PROCEDURE public.count_users();

ALTER TABLE studios
ADD equipment_count int8;

CREATE FUNCTION public.count_equipment()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$
DECLARE 
    id_studio int;
    id_equipment int;
    number int;
    BEGIN
        FOR id_studio IN SELECT id FROM studios
        LOOP
            number := 0;
            FOR id_equipment IN SELECT id FROM equipments
            LOOP
                IF((SELECT name
                   FROM equipments
                   WHERE id= id_equipment AND studio_id = id_studio ) IS NOT NULL) THEN
                    number := number + 1;
                END IF;
            END LOOP;
            UPDATE studios
            SET equipment_count = number
            WHERE id = id_studio;
        END LOOP;
    RETURN NULL;
    END;
$BODY$;


CREATE TRIGGER trigger_equipment
AFTER INSERT OR DELETE OR UPDATE 
ON public.equipments
FOR EACH ROW
EXECUTE PROCEDURE public.count_equipment();

INSERT INTO locations(id, name,post) VALUES(1,'Adle??i??i','8341');
INSERT INTO locations(id, name,post) VALUES(2,'Ajdov????ina','5270');
INSERT INTO locations(id, name,post) VALUES(3,'Ankaran - Ancarano','6280');
INSERT INTO locations(id, name,post) VALUES(4,'Apa??e','9253');


INSERT INTO studios (id, name, address, email, location_id)
VALUES (1, 'Filmski studio Viba film', 'Stegne 5', 'StudioViba@info.si', 1);


INSERT INTO users (id, first_name, last_name, email, pass, studio_id, location_id)
VALUES (1, 'Marcel', 'Zep', 'mici.zep@gmail.com', '$2a$10$1v5MNZSDiLOHdAbgayWdsOxo8sOCcStyz8NV.kRqzmbgliedunaZ2', 1, 1);

INSERT INTO users (id, first_name, last_name, email, pass, studio_id, location_id)
VALUES (2, 'Tadej', 'Delopst', 'tadejdelopst@gmail.com', '$2a$10$1v5MNZSDiLOHdAbgayWdsOxo8sOCcStyz8NV.kRqzmbgliedunaZ2', 1, 2);

INSERT INTO users (id, first_name, last_name, email, pass, studio_id, location_id)
VALUES (3, 'Tilen', 'Hostnik', 'tilen.hostnik@gmail.com', '$2a$10$1v5MNZSDiLOHdAbgayWdsOxo8sOCcStyz8NV.kRqzmbgliedunaZ2', 1, 3);

INSERT INTO users (id, first_name, last_name, email, pass, studio_id, location_id)
VALUES (4, 'Mark', 'Legner', 'merki@gmail.com', '$2a$10$1v5MNZSDiLOHdAbgayWdsOxo8sOCcStyz8NV.kRqzmbgliedunaZ2', 1, 4);


INSERT INTO equipments (id, name, model, warnings, description, studio_id)
VALUES (1,'kamera' , 'Nikon 4555', 'Ni opomb.', 'kamera, ki dela popolno.', 1);

INSERT INTO equipments (id, name, model, warnings, description, studio_id)
VALUES (2,'mikrofon' , 'HyperX 556', 'Malce po??kodovana pena. ', 'Mikrofon za zajem zvoka v precej malem obmo??ju in za zmanj??anje zvokov iz ozadja.', 1);

INSERT INTO equipments (id, name, model, warnings, description, studio_id)
VALUES (3,'zeleno platno' , 'GR69', 'Ni opomb.', 'Platno, ki se uporablja za posebne efekte ozadja pri snemanju.', 1);

INSERT INTO equipments (id, name, model, warnings, description, studio_id)
VALUES (4,'kamera' , 'Nikon 420 stoner edition', 'Ni opomb.', 'Kamera za kadre, ki se snemajo bolj od dale??, saj ima ??irokokotne le??e', 1);





INSERT INTO studios (id, name, address, email, location_id)
VALUES (2, 'Filmski studio VPK', 'Kranj??eva ulica 22', 'Studio.VPK@gmail.com', 1);


INSERT INTO users (id, first_name, last_name, email, pass, studio_id, location_id)
VALUES (5, 'Jon', 'Rojnik', 'jon.r.gorsek@gmail.com', '$2a$10$1v5MNZSDiLOHdAbgayWdsOxo8sOCcStyz8NV.kRqzmbgliedunaZ2', 2, 1);

INSERT INTO users (id, first_name, last_name, email, pass, studio_id, location_id)
VALUES (6, 'Aleks', 'Vrenko', 'aleks.vrenko@gmail.com', '$2a$10$1v5MNZSDiLOHdAbgayWdsOxo8sOCcStyz8NV.kRqzmbgliedunaZ2', 2, 2);

INSERT INTO users (id, first_name, last_name, email, pass, studio_id, location_id)
VALUES (7, 'Maks', 'Bah', 'maksbah@gmail.com', '$2a$10$1v5MNZSDiLOHdAbgayWdsOxo8sOCcStyz8NV.kRqzmbgliedunaZ2', 2, 3);

INSERT INTO users (id, first_name, last_name, email, pass, studio_id, location_id)
VALUES (8, 'Tim', 'Dete??nik', 'dteam@gmail.com', '$2a$10$1v5MNZSDiLOHdAbgayWdsOxo8sOCcStyz8NV.kRqzmbgliedunaZ2', 2, 4);


INSERT INTO equipments (id, name, model, warnings, description, studio_id)
VALUES (5,'Diktafon' , 'DICK22', 'Ni opomb.', 'Za snemanje zvoka, ki ima zelo dobro hvaliteto, seveda pa zajema vse zvoke iz ozadja.', 2);

INSERT INTO equipments (id, name, model, warnings, description, studio_id)
VALUES (6,'Kamera' , 'Nikon 40', 'Dr??alo je malce opraskano. ', 'To je kamera za snemanje kvalitetne slike', 2);

INSERT INTO equipments (id, name, model, warnings, description, studio_id)
VALUES (7,'Zeleno platno' , 'GRNSRN', 'Ni opomb.', 'Platno, ki se uporablja za posebne efekte ozadja pri snemanju.', 2);

INSERT INTO equipments (id, name, model, warnings, description, studio_id)
VALUES (8,'Kamera' , 'Cannon 426', 'Ni opomb.', 'Taka fajna kamera. Res!', 2);




INSERT INTO studios (id, name, address, email, location_id)
VALUES (3, 'Filmski studio Arkadena', 'Brodi????e 23', 'Arkadena@info.si', 1);


INSERT INTO users (id, first_name, last_name, email, pass, studio_id, location_id)
VALUES (9, 'Dejan', 'Sole??a', 'dejansolesa@gmail.com', '$2a$10$1v5MNZSDiLOHdAbgayWdsOxo8sOCcStyz8NV.kRqzmbgliedunaZ2', 3, 1);

INSERT INTO users (id, first_name, last_name, email, pass, studio_id, location_id)
VALUES (10, 'Nick', 'Svetel', 'nicksvetel@gmail.com', '$2a$10$1v5MNZSDiLOHdAbgayWdsOxo8sOCcStyz8NV.kRqzmbgliedunaZ2', 3, 2);

INSERT INTO users (id, first_name, last_name, email, pass, studio_id, location_id)
VALUES (11, 'Matic', 'Kuhar', 'matic.kuhar@gmail.com', '$2a$10$1v5MNZSDiLOHdAbgayWdsOxo8sOCcStyz8NV.kRqzmbgliedunaZ2', 3, 3);

INSERT INTO users (id, first_name, last_name, email, pass, studio_id, location_id)
VALUES (12, 'Melita', 'Hruska', 'melita.hruska@gmail.com', '$2a$10$1v5MNZSDiLOHdAbgayWdsOxo8sOCcStyz8NV.kRqzmbgliedunaZ2', 3, 4);


INSERT INTO equipments (id, name, model, warnings, description, studio_id)
VALUES (9,'Kamera' , 'Cannon 458', 'Ni opomb.', 'kamera, ki dela ful vredu.', 3);

INSERT INTO equipments (id, name, model, warnings, description, studio_id)
VALUES (10,'Mikrofon' , 'MIC42', 'Na momente kabel ne dela najbolje. ', 'Mikrofon snema zvok v zelo dobri kvaliteti', 3);

INSERT INTO equipments (id, name, model, warnings, description, studio_id)
VALUES (11,'Kamera' , 'NIKON23', 'Ni opomb.', 'Snema lahko v vseh svetlobah in da ven lepo fotografijo.', 3);

INSERT INTO equipments (id, name, model, warnings, description, studio_id)
VALUES (12,'Kamera' , 'Samsung2373', 'Ni opomb.', 'Pametna kamera, ki jo lahko upravlja?? z glasom', 3);





INSERT INTO studios (id, name, address, email, location_id)
VALUES (4, 'Filmski studio Partizanka', 'Dunajska cesta 123', 'Partizanka@gmail.com', 1);



INSERT INTO users (id, first_name, last_name, email, pass, studio_id, location_id)
VALUES (13, 'Nick', 'Srebot', 'nicksrebot@gmail.com', '$2a$10$1v5MNZSDiLOHdAbgayWdsOxo8sOCcStyz8NV.kRqzmbgliedunaZ2', 4, 2);

INSERT INTO users (id, first_name, last_name, email, pass, studio_id, location_id)
VALUES (14, 'Matic', 'Ozimic', 'matic.ozimic@gmail.com', '$2a$10$1v5MNZSDiLOHdAbgayWdsOxo8sOCcStyz8NV.kRqzmbgliedunaZ2', 4, 3);

INSERT INTO users (id, first_name, last_name, email, pass, studio_id, location_id)
VALUES (15, 'Melita', 'Mlada', 'melita.mlada@gmail.com', '$2a$10$1v5MNZSDiLOHdAbgayWdsOxo8sOCcStyz8NV.kRqzmbgliedunaZ2', 4, 4);

INSERT INTO users (id, first_name, last_name, email, pass, studio_id, location_id)
VALUES (16, 'Nada', 'Jane??i??', 'nadajane??i??@gmail.com', '$2a$10$1v5MNZSDiLOHdAbgayWdsOxo8sOCcStyz8NV.kRqzmbgliedunaZ2', 4, 1);



INSERT INTO equipments (id, name, model, warnings, description, studio_id)
VALUES (13,'Mikrofon' , 'MIC242', 'Ni opomb', 'navaden mikrofon za snemanje zvoka.', 4);

INSERT INTO equipments (id, name, model, warnings, description, studio_id)
VALUES (14,'Zeleno platno' , 'GREEN146', 'Ni opomb.', 'Za dodajanje efektov v ozadju', 4);

INSERT INTO equipments (id, name, model, warnings, description, studio_id)
VALUES (15,'Kamera' , 'Pyhit2373', 'Ni opomb.', 'Kamera z lepo slilo.', 4);

INSERT INTO equipments (id, name, model, warnings, description, studio_id)
VALUES (16,'Kamera' , 'Nikon 11', 'Ni opomb.', 'kamera za vsakdanje snemanje.', 4);



INSERT INTO rentals (id, rental_date, return_date, equipment_id, user_id)
VALUES(1, '2021-04-22', '12-5-2021' , 15 , 1 );

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
