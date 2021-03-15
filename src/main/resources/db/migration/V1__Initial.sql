CREATE SEQUENCE hibseq START 1 INCREMENT BY 50;

CREATE TABLE "studios"
(
    "id"          Serial                NOT NULL,
    "name"        Character varying(40) NOT NULL,
    "adress"      Character varying(50) NOT NULL,
    "email"       Character varying     NOT NULL,
    "location_id" Integer
);

CREATE
INDEX "IX_Relationship4" ON "studios" ("location_id");

ALTER TABLE "studios"
    ADD CONSTRAINT "PK_studios" PRIMARY KEY ("id");

CREATE TABLE "equipment"
(
    "id"          Serial                NOT NULL,
    "name"        Character varying(40) NOT NULL,
    "model"       Character varying(35),
    "warnings"    Text,
    "description" Text                  NOT NULL,
    "studio_id"   Integer
);

CREATE
INDEX "IX_Relationship1" ON "equipment" ("studio_id");

ALTER TABLE "equipment"
    ADD CONSTRAINT "PK_equipment" PRIMARY KEY ("id");

CREATE TABLE "rentals_archive"
(
    "id"             Serial                NOT NULL,
    "rental_date"    Date                  NOT NULL,
    "return_date"    Date                  NOT NULL,
    "user_email"     Character varying     NOT NULL,
    "equipment_name" Character varying(40) NOT NULL
);

ALTER TABLE "rentals_archive"
    ADD CONSTRAINT "PK_rentals_archive" PRIMARY KEY ("id");

CREATE TABLE "rentals"
(
    "id"           Serial NOT NULL,
    "rental_date"  Date   NOT NULL,
    "return_date"  Date   NOT NULL,
    "equipment_id" Integer,
    "user_id"      Integer
);

CREATE
INDEX "IX_Relationship2" ON "rentals" ("equipment_id");

CREATE
INDEX "IX_Relationship3" ON "rentals" ("user_id");

ALTER TABLE "rentals"
    ADD CONSTRAINT "PK_rentals" PRIMARY KEY ("id");

CREATE TABLE "users"
(
    "id"          Serial                NOT NULL,
    "first_name"  Character varying(40) NOT NULL,
    "last_name"   Character varying(50) NOT NULL,
    "email"       Character varying     NOT NULL,
    "pass"        Text                  NOT NULL,
    "studio_id"   Integer,
    "location_id" Integer
);

CREATE
INDEX "IX_Relationship7" ON "users" ("studio_id");

CREATE
INDEX "IX_Relationship8" ON "users" ("location_id");

ALTER TABLE "users"
    ADD CONSTRAINT "PK_users" PRIMARY KEY ("id");

CREATE TABLE "locations"
(
    "id"   Serial               NOT NULL,
    "name" Character varying    NOT NULL,
    "post" Character varying(4) NOT NULL
);

ALTER TABLE "locations"
    ADD CONSTRAINT "PK_locations" PRIMARY KEY ("id");

ALTER TABLE "equipment"
    ADD CONSTRAINT "Relationship1" FOREIGN KEY ("studio_id") REFERENCES "studios" ("id");

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

INSERT INTO locations(name, post)
VALUES ('Adlešiči', '8341');
INSERT INTO locations(name, post)
VALUES ('Ajdovščina', '5270');
INSERT INTO locations(name, post)
VALUES ('Ankaran - Ancarano', '6280');
INSERT INTO locations(name, post)
VALUES ('Apače', '9253');
INSERT INTO locations(name, post)
VALUES ('Artiče', '8253');
INSERT INTO locations(name, post)
VALUES ('Begunje na Gorenjskem', '4275');
INSERT INTO locations(name, post)
VALUES ('Begunje pri Cerknici', '1382');
INSERT INTO locations(name, post)
VALUES ('Beltinci', '9231');
INSERT INTO locations(name, post)
VALUES ('Benedikt', '2234');
INSERT INTO locations(name, post)
VALUES ('Bistrica ob Dravi', '2345');
INSERT INTO locations(name, post)
VALUES ('Bistrica ob Sotli', '3256');
INSERT INTO locations(name, post)
VALUES ('Bizeljsko', '8259');
INSERT INTO locations(name, post)
VALUES ('Blagovica', '1223');
INSERT INTO locations(name, post)
VALUES ('Blanca', '8283');
INSERT INTO locations(name, post)
VALUES ('Bled', '4260');
INSERT INTO locations(name, post)
VALUES ('Blejska Dobrava', '4273');
INSERT INTO locations(name, post)
VALUES ('Bodonci', '9265');
INSERT INTO locations(name, post)
VALUES ('Bogojina', '9222');
INSERT INTO locations(name, post)
VALUES ('Bohinjska Bela', '4263');
INSERT INTO locations(name, post)
VALUES ('Bohinjska Bistrica', '4264');
INSERT INTO locations(name, post)
VALUES ('Bohinjsko jezero', '4265');
INSERT INTO locations(name, post)
VALUES ('Borovnica', '1353');
INSERT INTO locations(name, post)
VALUES ('Boštanj', '8294');
INSERT INTO locations(name, post)
VALUES ('Bovec', '5230');
INSERT INTO locations(name, post)
VALUES ('Branik', '5295');
INSERT INTO locations(name, post)
VALUES ('Braslovče', '3314');
INSERT INTO locations(name, post)
VALUES ('Breginj', '5223');
INSERT INTO locations(name, post)
VALUES ('Brestanica', '8280');
INSERT INTO locations(name, post)
VALUES ('Bresternica', '2354');
INSERT INTO locations(name, post)
VALUES ('Brezje', '4243');
INSERT INTO locations(name, post)
VALUES ('Brezovica pri Ljubljani', '1351');
INSERT INTO locations(name, post)
VALUES ('Brežice', '8250');
INSERT INTO locations(name, post)
VALUES ('Brnik - aerodrom', '4210');
INSERT INTO locations(name, post)
VALUES ('Brusnice', '8321');
INSERT INTO locations(name, post)
VALUES ('Buče', '3255');
INSERT INTO locations(name, post)
VALUES ('Bučka ', '8276');
INSERT INTO locations(name, post)
VALUES ('Cankova', '9261');
INSERT INTO locations(name, post)
VALUES ('Celje - dostava', '3000');
INSERT INTO locations(name, post)
VALUES ('Celje - poštni predali', '3001');
INSERT INTO locations(name, post)
VALUES ('Celje', '3502');
INSERT INTO locations(name, post)
VALUES ('Celje', '3505');
INSERT INTO locations(name, post)
VALUES ('Celje', '3600');
INSERT INTO locations(name, post)
VALUES ('Cerklje na Gorenjskem', '4207');
INSERT INTO locations(name, post)
VALUES ('Cerklje ob Krki', '8263');
INSERT INTO locations(name, post)
VALUES ('Cerknica', '1380');
INSERT INTO locations(name, post)
VALUES ('Cerkno', '5282');
INSERT INTO locations(name, post)
VALUES ('Cerkvenjak', '2236');
INSERT INTO locations(name, post)
VALUES ('Ceršak', '2215');
INSERT INTO locations(name, post)
VALUES ('Cirkovce', '2326');
INSERT INTO locations(name, post)
VALUES ('Cirkulane', '2282');
INSERT INTO locations(name, post)
VALUES ('Col', '5273');
INSERT INTO locations(name, post)
VALUES ('Čatež ob Savi', '8251');
INSERT INTO locations(name, post)
VALUES ('Čemšenik', '1413');
INSERT INTO locations(name, post)
VALUES ('Čepovan', '5253');
INSERT INTO locations(name, post)
VALUES ('Črenšovci', '9232');
INSERT INTO locations(name, post)
VALUES ('Črna na Koroškem', '2393');
INSERT INTO locations(name, post)
VALUES ('Črni Kal', '6275');
INSERT INTO locations(name, post)
VALUES ('Črni Vrh nad Idrijo', '5274');
INSERT INTO locations(name, post)
VALUES ('Črniče', '5262');
INSERT INTO locations(name, post)
VALUES ('Črnomelj', '8340');
INSERT INTO locations(name, post)
VALUES ('Dekani', '6271');
INSERT INTO locations(name, post)
VALUES ('Deskle', '5210');
INSERT INTO locations(name, post)
VALUES ('Destrnik', '2253');
INSERT INTO locations(name, post)
VALUES ('Divača', '6215');
INSERT INTO locations(name, post)
VALUES ('Dob', '1233');
INSERT INTO locations(name, post)
VALUES ('Dobje pri Planini', '3224');
INSERT INTO locations(name, post)
VALUES ('Dobova', '8257');
INSERT INTO locations(name, post)
VALUES ('Dobovec', '1423');
INSERT INTO locations(name, post)
VALUES ('Dobravlje', '5263');
INSERT INTO locations(name, post)
VALUES ('Dobrna', '3204');
INSERT INTO locations(name, post)
VALUES ('Dobrnič', '8211');
INSERT INTO locations(name, post)
VALUES ('Dobrova', '1356');
INSERT INTO locations(name, post)
VALUES ('Dobrovnik - Dobronak ', '9223');
INSERT INTO locations(name, post)
VALUES ('Dobrovo v Brdih', '5212');
INSERT INTO locations(name, post)
VALUES ('Dol pri Hrastniku', '1431');
INSERT INTO locations(name, post)
VALUES ('Dol pri Ljubljani', '1262');
INSERT INTO locations(name, post)
VALUES ('Dole pri Litiji', '1273');
INSERT INTO locations(name, post)
VALUES ('Dolenja vas', '1331');
INSERT INTO locations(name, post)
VALUES ('Dolenjske Toplice', '8350');
INSERT INTO locations(name, post)
VALUES ('Domžale', '1230');
INSERT INTO locations(name, post)
VALUES ('Dornava', '2252');
INSERT INTO locations(name, post)
VALUES ('Dornberk', '5294');
INSERT INTO locations(name, post)
VALUES ('Draga', '1319');
INSERT INTO locations(name, post)
VALUES ('Dragatuš', '8343');
INSERT INTO locations(name, post)
VALUES ('Dramlje', '3222');
INSERT INTO locations(name, post)
VALUES ('Dravograd', '2370');
INSERT INTO locations(name, post)
VALUES ('Duplje', '4203');
INSERT INTO locations(name, post)
VALUES ('Dutovlje', '6221');
INSERT INTO locations(name, post)
VALUES ('Dvor', '8361');
INSERT INTO locations(name, post)
VALUES ('Fala', '2343');
INSERT INTO locations(name, post)
VALUES ('Fokovci', '9208');
INSERT INTO locations(name, post)
VALUES ('Fram', '2313');
INSERT INTO locations(name, post)
VALUES ('Frankolovo', '3213');
INSERT INTO locations(name, post)
VALUES ('Gabrovka', '1274');
INSERT INTO locations(name, post)
VALUES ('Globoko', '8254');
INSERT INTO locations(name, post)
VALUES ('Godovič', '5275');
INSERT INTO locations(name, post)
VALUES ('Golnik', '4204');
INSERT INTO locations(name, post)
VALUES ('Gomilsko', '3303');
INSERT INTO locations(name, post)
VALUES ('Gorenja vas', '4224');
INSERT INTO locations(name, post)
VALUES ('Gorica pri Slivnici', '3263');
INSERT INTO locations(name, post)
VALUES ('Gorišnica', '2272');
INSERT INTO locations(name, post)
VALUES ('Gornja Radgona', '9250');
INSERT INTO locations(name, post)
VALUES ('Gornji Grad', '3342');
INSERT INTO locations(name, post)
VALUES ('Gozd Martuljek', '4282');
INSERT INTO locations(name, post)
VALUES ('Gračišče', '6272');
INSERT INTO locations(name, post)
VALUES ('Grad', '9264');
INSERT INTO locations(name, post)
VALUES ('Gradac', '8332');
INSERT INTO locations(name, post)
VALUES ('Grahovo', '1384');
INSERT INTO locations(name, post)
VALUES ('Grahovo ob Bači', '5242');
INSERT INTO locations(name, post)
VALUES ('Grgar', '5251');
INSERT INTO locations(name, post)
VALUES ('Griže', '3302');
INSERT INTO locations(name, post)
VALUES ('Grobelno', '3231');
INSERT INTO locations(name, post)
VALUES ('Grosuplje', '1290');
INSERT INTO locations(name, post)
VALUES ('Hajdina', '2288');
INSERT INTO locations(name, post)
VALUES ('Hinje', '8362');
INSERT INTO locations(name, post)
VALUES ('Hoče', '2311');
INSERT INTO locations(name, post)
VALUES ('Hodoš - Hodos', '9205');
INSERT INTO locations(name, post)
VALUES ('Horjul', '1354');
INSERT INTO locations(name, post)
VALUES ('Hotedršica', '1372');
INSERT INTO locations(name, post)
VALUES ('Hrastnik', '1430');
INSERT INTO locations(name, post)
VALUES ('Hruševje', '6225');
INSERT INTO locations(name, post)
VALUES ('Hrušica', '4276');
INSERT INTO locations(name, post)
VALUES ('Idrija', '5280');
INSERT INTO locations(name, post)
VALUES ('Ig', '1292');
INSERT INTO locations(name, post)
VALUES ('Ilirska Bistrica', '6250');
INSERT INTO locations(name, post)
VALUES ('Ivančna Gorica', '1295');
INSERT INTO locations(name, post)
VALUES ('Ivanjkovci', '2259');
INSERT INTO locations(name, post)
VALUES ('Izlake', '1411');
INSERT INTO locations(name, post)
VALUES ('Izola - Isola', '6310');
INSERT INTO locations(name, post)
VALUES ('Jakobski Dol', '2222');
INSERT INTO locations(name, post)
VALUES ('Jarenina', '2221');
INSERT INTO locations(name, post)
VALUES ('Jelšane', '6254');
INSERT INTO locations(name, post)
VALUES ('Jesenice', '4270');
INSERT INTO locations(name, post)
VALUES ('Jesenice na Dolenjskem', '8261');
INSERT INTO locations(name, post)
VALUES ('Jurklošter', '3273');
INSERT INTO locations(name, post)
VALUES ('Jurovski Dol', '2223');
INSERT INTO locations(name, post)
VALUES ('Juršinci', '2256');
INSERT INTO locations(name, post)
VALUES ('Kal nad Kanalom', '5214');
INSERT INTO locations(name, post)
VALUES ('Kalobje', '3233');
INSERT INTO locations(name, post)
VALUES ('Kamna Gorica', '4246');
INSERT INTO locations(name, post)
VALUES ('Kamnica', '2351');
INSERT INTO locations(name, post)
VALUES ('Kamnik', '1241');
INSERT INTO locations(name, post)
VALUES ('Kanal', '5213');
INSERT INTO locations(name, post)
VALUES ('Kapele', '8258');
INSERT INTO locations(name, post)
VALUES ('Kapla', '2362');
INSERT INTO locations(name, post)
VALUES ('Kidričevo', '2325');
INSERT INTO locations(name, post)
VALUES ('Kisovec', '1412');
INSERT INTO locations(name, post)
VALUES ('Knežak', '6253');
INSERT INTO locations(name, post)
VALUES ('Kobarid', '5222');
INSERT INTO locations(name, post)
VALUES ('Kobilje', '9227');
INSERT INTO locations(name, post)
VALUES ('Kočevje', '1330');
INSERT INTO locations(name, post)
VALUES ('Kočevska Reka', '1338');
INSERT INTO locations(name, post)
VALUES ('Kog', '2276');
INSERT INTO locations(name, post)
VALUES ('Kojsko', '5211');
INSERT INTO locations(name, post)
VALUES ('Komen', '6223');
INSERT INTO locations(name, post)
VALUES ('Komenda', '1218');
INSERT INTO locations(name, post)
VALUES ('Koper - Capodistria - dostava', '6000');
INSERT INTO locations(name, post)
VALUES ('Koper - Capodistria - poštni predali', '6001');
INSERT INTO locations(name, post)
VALUES ('Koper', '6503');
INSERT INTO locations(name, post)
VALUES ('Koper', '6502');
INSERT INTO locations(name, post)
VALUES ('Koper', '6505');
INSERT INTO locations(name, post)
VALUES ('Koper', '6504');
INSERT INTO locations(name, post)
VALUES ('Koper', '6501');
INSERT INTO locations(name, post)
VALUES ('Koper', '6600');
INSERT INTO locations(name, post)
VALUES ('Koprivnica', '8282');
INSERT INTO locations(name, post)
VALUES ('Kostanjevica na Krasu', '5296');
INSERT INTO locations(name, post)
VALUES ('Kostanjevica na Krki', '8311');
INSERT INTO locations(name, post)
VALUES ('Košana', '6256');
INSERT INTO locations(name, post)
VALUES ('Kotlje', '2394');
INSERT INTO locations(name, post)
VALUES ('Kozina', '6240');
INSERT INTO locations(name, post)
VALUES ('Kozje', '3260');
INSERT INTO locations(name, post)
VALUES ('Kranj - dostava', '4000');
INSERT INTO locations(name, post)
VALUES ('Kranj - poštni predali', '4001');
INSERT INTO locations(name, post)
VALUES ('Kranj', '4600');
INSERT INTO locations(name, post)
VALUES ('Kranj', '4502');
INSERT INTO locations(name, post)
VALUES ('Kranjska Gora', '4280');
INSERT INTO locations(name, post)
VALUES ('Kresnice', '1281');
INSERT INTO locations(name, post)
VALUES ('Križe', '4294');
INSERT INTO locations(name, post)
VALUES ('Križevci', '9206');
INSERT INTO locations(name, post)
VALUES ('Križevci pri Ljutomeru', '9242');
INSERT INTO locations(name, post)
VALUES ('Krka', '1301');
INSERT INTO locations(name, post)
VALUES ('Krmelj', '8296');
INSERT INTO locations(name, post)
VALUES ('Kropa', '4245');
INSERT INTO locations(name, post)
VALUES ('Krška vas', '8262');
INSERT INTO locations(name, post)
VALUES ('Krško', '8270');
INSERT INTO locations(name, post)
VALUES ('Kuzma', '9263');
INSERT INTO locations(name, post)
VALUES ('Laporje', '2318');
INSERT INTO locations(name, post)
VALUES ('Laško', '3270');
INSERT INTO locations(name, post)
VALUES ('Laze v Tuhinju', '1219');
INSERT INTO locations(name, post)
VALUES ('Lenart v Slovenskih goricah', '2230');
INSERT INTO locations(name, post)
VALUES ('Lendava - Lendva', '9220');
INSERT INTO locations(name, post)
VALUES ('Lesce', '4248');
INSERT INTO locations(name, post)
VALUES ('Lesično', '3261');
INSERT INTO locations(name, post)
VALUES ('Leskovec pri Krškem', '8273');
INSERT INTO locations(name, post)
VALUES ('Libeliče', '2372');
INSERT INTO locations(name, post)
VALUES ('Limbuš', '2341');
INSERT INTO locations(name, post)
VALUES ('Litija', '1270');
INSERT INTO locations(name, post)
VALUES ('Ljubečna', '3202');
INSERT INTO locations(name, post)
VALUES ('Ljubljana - dostava', '1000');
INSERT INTO locations(name, post)
VALUES ('Ljubljana - poštni predali', '1001');
INSERT INTO locations(name, post)
VALUES ('Ljubljana', '1517');
INSERT INTO locations(name, post)
VALUES ('Ljubljana', '1505');
INSERT INTO locations(name, post)
VALUES ('Ljubljana', '1533');
INSERT INTO locations(name, post)
VALUES ('Ljubljana', '1512');
INSERT INTO locations(name, post)
VALUES ('Ljubljana', '1524');
INSERT INTO locations(name, post)
VALUES ('Ljubljana', '1523');
INSERT INTO locations(name, post)
VALUES ('Ljubljana', '1522');
INSERT INTO locations(name, post)
VALUES ('Ljubljana', '1510');
INSERT INTO locations(name, post)
VALUES ('Ljubljana', '1509');
INSERT INTO locations(name, post)
VALUES ('Ljubljana', '1538');
INSERT INTO locations(name, post)
VALUES ('Ljubljana', '1516');
INSERT INTO locations(name, post)
VALUES ('Ljubljana', '1528');
INSERT INTO locations(name, post)
VALUES ('Ljubljana', '1540');
INSERT INTO locations(name, post)
VALUES ('Ljubljana', '1504');
INSERT INTO locations(name, post)
VALUES ('Ljubljana', '1521');
INSERT INTO locations(name, post)
VALUES ('Ljubljana', '1545');
INSERT INTO locations(name, post)
VALUES ('Ljubljana', '1542');
INSERT INTO locations(name, post)
VALUES ('Ljubljana', '1525');
INSERT INTO locations(name, post)
VALUES ('Ljubljana', '1544');
INSERT INTO locations(name, post)
VALUES ('Ljubljana', '1514');
INSERT INTO locations(name, post)
VALUES ('Ljubljana', '1526');
INSERT INTO locations(name, post)
VALUES ('Ljubljana', '1502');
INSERT INTO locations(name, post)
VALUES ('Ljubljana', '1508');
INSERT INTO locations(name, post)
VALUES ('Ljubljana', '1501');
INSERT INTO locations(name, post)
VALUES ('Ljubljana', '1535');
INSERT INTO locations(name, post)
VALUES ('Ljubljana', '1536');
INSERT INTO locations(name, post)
VALUES ('Ljubljana', '1537');
INSERT INTO locations(name, post)
VALUES ('Ljubljana', '1520');
INSERT INTO locations(name, post)
VALUES ('Ljubljana', '1534');
INSERT INTO locations(name, post)
VALUES ('Ljubljana', '1503');
INSERT INTO locations(name, post)
VALUES ('Ljubljana', '1527');
INSERT INTO locations(name, post)
VALUES ('Ljubljana', '1603');
INSERT INTO locations(name, post)
VALUES ('Ljubljana', '1500');
INSERT INTO locations(name, post)
VALUES ('Ljubljana', '1600');
INSERT INTO locations(name, post)
VALUES ('Ljubljana', '1550');
INSERT INTO locations(name, post)
VALUES ('Ljubljana', '1532');
INSERT INTO locations(name, post)
VALUES ('Ljubljana', '1513');
INSERT INTO locations(name, post)
VALUES ('Ljubljana', '1511');
INSERT INTO locations(name, post)
VALUES ('Ljubljana', '1506');
INSERT INTO locations(name, post)
VALUES ('Ljubljana', '1519');
INSERT INTO locations(name, post)
VALUES ('Ljubljana', '1543');
INSERT INTO locations(name, post)
VALUES ('Ljubljana', '1546');
INSERT INTO locations(name, post)
VALUES ('Ljubljana', '1547');
INSERT INTO locations(name, post)
VALUES ('Ljubljana', '1518');
INSERT INTO locations(name, post)
VALUES ('Ljubljana', '1507');
INSERT INTO locations(name, post)
VALUES ('Ljubljana', '1529');
INSERT INTO locations(name, post)
VALUES ('Ljubljana - Črnuče', '1231');
INSERT INTO locations(name, post)
VALUES ('Ljubljana - Dobrunje', '1261');
INSERT INTO locations(name, post)
VALUES ('Ljubljana - Polje', '1260');
INSERT INTO locations(name, post)
VALUES ('Ljubljana - Šentvid', '1210');
INSERT INTO locations(name, post)
VALUES ('Ljubljana - Šmartno', '1211');
INSERT INTO locations(name, post)
VALUES ('Ljubno ob Savinji', '3333');
INSERT INTO locations(name, post)
VALUES ('Ljutomer', '9240');
INSERT INTO locations(name, post)
VALUES ('Loče', '3215');
INSERT INTO locations(name, post)
VALUES ('Log pod Mangartom', '5231');
INSERT INTO locations(name, post)
VALUES ('Logatec', '1370');
INSERT INTO locations(name, post)
VALUES ('Loka pri Zidanem Mostu', '1434');
INSERT INTO locations(name, post)
VALUES ('Loka pri Žusmu', '3223');
INSERT INTO locations(name, post)
VALUES ('Lokev', '6219');
INSERT INTO locations(name, post)
VALUES ('Loški Potok', '1318');
INSERT INTO locations(name, post)
VALUES ('Lovrenc na Dravskem polju', '2324');
INSERT INTO locations(name, post)
VALUES ('Lovrenc na Pohorju', '2344');
INSERT INTO locations(name, post)
VALUES ('Luče', '3334');
INSERT INTO locations(name, post)
VALUES ('Lukovica', '1225');
INSERT INTO locations(name, post)
VALUES ('Mačkovci', '9202');
INSERT INTO locations(name, post)
VALUES ('Majšperk', '2322');
INSERT INTO locations(name, post)
VALUES ('Makole', '2321');
INSERT INTO locations(name, post)
VALUES ('Mala Nedelja', '9243');
INSERT INTO locations(name, post)
VALUES ('Malečnik', '2229');
INSERT INTO locations(name, post)
VALUES ('Marezige', '6273');
INSERT INTO locations(name, post)
VALUES ('Maribor - dostava', '2000');
INSERT INTO locations(name, post)
VALUES ('Maribor - poštni predali', '2001');
INSERT INTO locations(name, post)
VALUES ('Maribor', '2504');
INSERT INTO locations(name, post)
VALUES ('Maribor', '2502');
INSERT INTO locations(name, post)
VALUES ('Maribor', '2509');
INSERT INTO locations(name, post)
VALUES ('Maribor', '2506');
INSERT INTO locations(name, post)
VALUES ('Maribor', '2508');
INSERT INTO locations(name, post)
VALUES ('Maribor', '2505');
INSERT INTO locations(name, post)
VALUES ('Maribor', '2503');
INSERT INTO locations(name, post)
VALUES ('Maribor', '2500');
INSERT INTO locations(name, post)
VALUES ('Maribor', '2600');
INSERT INTO locations(name, post)
VALUES ('Maribor', '2603');
INSERT INTO locations(name, post)
VALUES ('Maribor', '2501');
INSERT INTO locations(name, post)
VALUES ('Maribor', '2507');
INSERT INTO locations(name, post)
VALUES ('Marjeta na Dravskem polju', '2206');
INSERT INTO locations(name, post)
VALUES ('Markovci', '2281');
INSERT INTO locations(name, post)
VALUES ('Martjanci', '9221');
INSERT INTO locations(name, post)
VALUES ('Materija', '6242');
INSERT INTO locations(name, post)
VALUES ('Mavčiče', '4211');
INSERT INTO locations(name, post)
VALUES ('Medvode', '1215');
INSERT INTO locations(name, post)
VALUES ('Mengeš', '1234');
INSERT INTO locations(name, post)
VALUES ('Metlika', '8330');
INSERT INTO locations(name, post)
VALUES ('Mežica', '2392');
INSERT INTO locations(name, post)
VALUES ('Miklavž na Dravskem polju', '2204');
INSERT INTO locations(name, post)
VALUES ('Miklavž pri Ormožu', '2275');
INSERT INTO locations(name, post)
VALUES ('Miren', '5291');
INSERT INTO locations(name, post)
VALUES ('Mirna', '8233');
INSERT INTO locations(name, post)
VALUES ('Mirna Peč', '8216');
INSERT INTO locations(name, post)
VALUES ('Mislinja', '2382');
INSERT INTO locations(name, post)
VALUES ('Mojstrana', '4281');
INSERT INTO locations(name, post)
VALUES ('Mokronog', '8230');
INSERT INTO locations(name, post)
VALUES ('Moravče', '1251');
INSERT INTO locations(name, post)
VALUES ('Moravske Toplice', '9226');
INSERT INTO locations(name, post)
VALUES ('Most na Soči', '5216');
INSERT INTO locations(name, post)
VALUES ('Motnik', '1221');
INSERT INTO locations(name, post)
VALUES ('Mozirje', '3330');
INSERT INTO locations(name, post)
VALUES ('Murska Sobota - dostava', '9000');
INSERT INTO locations(name, post)
VALUES ('Murska Sobota - poštni predali', '9001');
INSERT INTO locations(name, post)
VALUES ('Murska Sobota', '9501');
INSERT INTO locations(name, post)
VALUES ('Murska Sobota', '9600');
INSERT INTO locations(name, post)
VALUES ('Muta', '2366');
INSERT INTO locations(name, post)
VALUES ('Naklo', '4202');
INSERT INTO locations(name, post)
VALUES ('Naklo', '4501');
INSERT INTO locations(name, post)
VALUES ('Nazarje', '3331');
INSERT INTO locations(name, post)
VALUES ('Notranje Gorice', '1357');
INSERT INTO locations(name, post)
VALUES ('Nova Cerkev', '3203');
INSERT INTO locations(name, post)
VALUES ('Nova Gorica - dostava', '5000');
INSERT INTO locations(name, post)
VALUES ('Nova Gorica - poštni predali', '5001');
INSERT INTO locations(name, post)
VALUES ('Nova Gorica', '5600');
INSERT INTO locations(name, post)
VALUES ('Nova vas', '1385');
INSERT INTO locations(name, post)
VALUES ('Novo mesto - dostava', '8000');
INSERT INTO locations(name, post)
VALUES ('Novo mesto - poštni predali', '8001');
INSERT INTO locations(name, post)
VALUES ('Novo mesto', '8501');
INSERT INTO locations(name, post)
VALUES ('Novo mesto', '8600');
INSERT INTO locations(name, post)
VALUES ('Obrov', '6243');
INSERT INTO locations(name, post)
VALUES ('Odranci', '9233');
INSERT INTO locations(name, post)
VALUES ('Oplotnica', '2317');
INSERT INTO locations(name, post)
VALUES ('Orehova vas', '2312');
INSERT INTO locations(name, post)
VALUES ('Ormož', '2270');
INSERT INTO locations(name, post)
VALUES ('Ortnek', '1316');
INSERT INTO locations(name, post)
VALUES ('Osilnica', '1337');
INSERT INTO locations(name, post)
VALUES ('Otočec', '8222');
INSERT INTO locations(name, post)
VALUES ('Ožbalt', '2361');
INSERT INTO locations(name, post)
VALUES ('Pernica', '2231');
INSERT INTO locations(name, post)
VALUES ('Pesnica pri Mariboru', '2211');
INSERT INTO locations(name, post)
VALUES ('Petrovci', '9203');
INSERT INTO locations(name, post)
VALUES ('Petrovče', '3301');
INSERT INTO locations(name, post)
VALUES ('Piran - Pirano', '6330');
INSERT INTO locations(name, post)
VALUES ('Pišece', '8255');
INSERT INTO locations(name, post)
VALUES ('Pivka', '6257');
INSERT INTO locations(name, post)
VALUES ('Planina', '6232');
INSERT INTO locations(name, post)
VALUES ('Planina pri Sevnici', '3225');
INSERT INTO locations(name, post)
VALUES ('Pobegi', '6276');
INSERT INTO locations(name, post)
VALUES ('Podbočje', '8312');
INSERT INTO locations(name, post)
VALUES ('Podbrdo', '5243');
INSERT INTO locations(name, post)
VALUES ('Podčetrtek', '3254');
INSERT INTO locations(name, post)
VALUES ('Podgorci', '2273');
INSERT INTO locations(name, post)
VALUES ('Podgorje', '6216');
INSERT INTO locations(name, post)
VALUES ('Podgorje pri Slovenj Gradcu', '2381');
INSERT INTO locations(name, post)
VALUES ('Podgrad', '6244');
INSERT INTO locations(name, post)
VALUES ('Podkum', '1414');
INSERT INTO locations(name, post)
VALUES ('Podlehnik', '2286');
INSERT INTO locations(name, post)
VALUES ('Podnanos', '5272');
INSERT INTO locations(name, post)
VALUES ('Podnart', '4244');
INSERT INTO locations(name, post)
VALUES ('Podplat', '3241');
INSERT INTO locations(name, post)
VALUES ('Podsreda', '3257');
INSERT INTO locations(name, post)
VALUES ('Podvelka', '2363');
INSERT INTO locations(name, post)
VALUES ('Pohorje', '2208');
INSERT INTO locations(name, post)
VALUES ('Polenšak', '2257');
INSERT INTO locations(name, post)
VALUES ('Polhov Gradec', '1355');
INSERT INTO locations(name, post)
VALUES ('Poljane nad Škofjo Loko', '4223');
INSERT INTO locations(name, post)
VALUES ('Poljčane', '2319');
INSERT INTO locations(name, post)
VALUES ('Polšnik', '1272');
INSERT INTO locations(name, post)
VALUES ('Polzela', '3313');
INSERT INTO locations(name, post)
VALUES ('Ponikva', '3232');
INSERT INTO locations(name, post)
VALUES ('Portorož - Portorose', '6320');
INSERT INTO locations(name, post)
VALUES ('Postojna', '6230');
INSERT INTO locations(name, post)
VALUES ('Pragersko', '2331');
INSERT INTO locations(name, post)
VALUES ('Prebold', '3312');
INSERT INTO locations(name, post)
VALUES ('Preddvor', '4205');
INSERT INTO locations(name, post)
VALUES ('Prem', '6255');
INSERT INTO locations(name, post)
VALUES ('Preserje', '1352');
INSERT INTO locations(name, post)
VALUES ('Prestranek', '6258');
INSERT INTO locations(name, post)
VALUES ('Prevalje', '2391');
INSERT INTO locations(name, post)
VALUES ('Prevorje', '3262');
INSERT INTO locations(name, post)
VALUES ('Primskovo ', '1276');
INSERT INTO locations(name, post)
VALUES ('Pristava pri Mestinju', '3253');
INSERT INTO locations(name, post)
VALUES ('Prosenjakovci - Partosfalva', '9207');
INSERT INTO locations(name, post)
VALUES ('Prvačina', '5297');
INSERT INTO locations(name, post)
VALUES ('Ptuj', '2250');
INSERT INTO locations(name, post)
VALUES ('Ptujska Gora', '2323');
INSERT INTO locations(name, post)
VALUES ('Puconci', '9201');
INSERT INTO locations(name, post)
VALUES ('Rače', '2327');
INSERT INTO locations(name, post)
VALUES ('Radeče', '1433');
INSERT INTO locations(name, post)
VALUES ('Radenci', '9252');
INSERT INTO locations(name, post)
VALUES ('Radenci', '9502');
INSERT INTO locations(name, post)
VALUES ('Radlje ob Dravi', '2360');
INSERT INTO locations(name, post)
VALUES ('Radomlje', '1235');
INSERT INTO locations(name, post)
VALUES ('Radovljica', '4240');
INSERT INTO locations(name, post)
VALUES ('Raka', '8274');
INSERT INTO locations(name, post)
VALUES ('Rakek', '1381');
INSERT INTO locations(name, post)
VALUES ('Rateče - Planica', '4283');
INSERT INTO locations(name, post)
VALUES ('Ravne na Koroškem', '2390');
INSERT INTO locations(name, post)
VALUES ('Rečica ob Savinji', '3332');
INSERT INTO locations(name, post)
VALUES ('Renče', '5292');
INSERT INTO locations(name, post)
VALUES ('Ribnica', '1310');
INSERT INTO locations(name, post)
VALUES ('Ribnica na Pohorju', '2364');
INSERT INTO locations(name, post)
VALUES ('Rimske Toplice', '3272');
INSERT INTO locations(name, post)
VALUES ('Rob', '1314');
INSERT INTO locations(name, post)
VALUES ('Ročinj', '5215');
INSERT INTO locations(name, post)
VALUES ('Rogaška Slatina', '3250');
INSERT INTO locations(name, post)
VALUES ('Rogašovci', '9262');
INSERT INTO locations(name, post)
VALUES ('Rogatec', '3252');
INSERT INTO locations(name, post)
VALUES ('Rovte', '1373');
INSERT INTO locations(name, post)
VALUES ('Ruše', '2342');
INSERT INTO locations(name, post)
VALUES ('Sava', '1282');
INSERT INTO locations(name, post)
VALUES ('Sečovlje - Sicciole', '6333');
INSERT INTO locations(name, post)
VALUES ('Selca', '4227');
INSERT INTO locations(name, post)
VALUES ('Selnica ob Dravi', '2352');
INSERT INTO locations(name, post)
VALUES ('Semič', '8333');
INSERT INTO locations(name, post)
VALUES ('Senovo', '8281');
INSERT INTO locations(name, post)
VALUES ('Senožeče', '6224');
INSERT INTO locations(name, post)
VALUES ('Sevnica', '8290');
INSERT INTO locations(name, post)
VALUES ('Sežana', '6210');
INSERT INTO locations(name, post)
VALUES ('Sladki Vrh', '2214');
INSERT INTO locations(name, post)
VALUES ('Slap ob Idrijci', '5283');
INSERT INTO locations(name, post)
VALUES ('Slovenj Gradec', '2380');
INSERT INTO locations(name, post)
VALUES ('Slovenska Bistrica', '2310');
INSERT INTO locations(name, post)
VALUES ('Slovenske Konjice', '3210');
INSERT INTO locations(name, post)
VALUES ('Smlednik', '1216');
INSERT INTO locations(name, post)
VALUES ('Soča', '5232');
INSERT INTO locations(name, post)
VALUES ('Sodražica', '1317');
INSERT INTO locations(name, post)
VALUES ('Solčava', '3335');
INSERT INTO locations(name, post)
VALUES ('Solkan', '5250');
INSERT INTO locations(name, post)
VALUES ('Sorica', '4229');
INSERT INTO locations(name, post)
VALUES ('Sovodenj', '4225');
INSERT INTO locations(name, post)
VALUES ('Spodnja Idrija', '5281');
INSERT INTO locations(name, post)
VALUES ('Spodnji Duplek', '2241');
INSERT INTO locations(name, post)
VALUES ('Spodnji Ivanjci', '9245');
INSERT INTO locations(name, post)
VALUES ('Središče ob Dravi', '2277');
INSERT INTO locations(name, post)
VALUES ('Srednja vas v Bohinju', '4267');
INSERT INTO locations(name, post)
VALUES ('Sromlje ', '8256');
INSERT INTO locations(name, post)
VALUES ('Srpenica', '5224');
INSERT INTO locations(name, post)
VALUES ('Stahovica', '1242');
INSERT INTO locations(name, post)
VALUES ('Stara Cerkev', '1332');
INSERT INTO locations(name, post)
VALUES ('Stari trg ob Kolpi', '8342');
INSERT INTO locations(name, post)
VALUES ('Stari trg pri Ložu', '1386');
INSERT INTO locations(name, post)
VALUES ('Starše', '2205');
INSERT INTO locations(name, post)
VALUES ('Stoperce', '2289');
INSERT INTO locations(name, post)
VALUES ('Stopiče', '8322');
INSERT INTO locations(name, post)
VALUES ('Stranice', '3206');
INSERT INTO locations(name, post)
VALUES ('Straža', '8351');
INSERT INTO locations(name, post)
VALUES ('Struge', '1313');
INSERT INTO locations(name, post)
VALUES ('Strunjan - Strugnano (sezonska pošta)', '6323');
INSERT INTO locations(name, post)
VALUES ('Studenec', '8293');
INSERT INTO locations(name, post)
VALUES ('Suhor', '8331');
INSERT INTO locations(name, post)
VALUES ('Sv. Ana v Slovenskih goricah', '2233');
INSERT INTO locations(name, post)
VALUES ('Sv. Duh na Ostrem Vrhu', '2353');
INSERT INTO locations(name, post)
VALUES ('Sv. Jurij ob Ščavnici', '9244');
INSERT INTO locations(name, post)
VALUES ('Sv. Trojica v Slovenskih goricah', '2235');
INSERT INTO locations(name, post)
VALUES ('Sveti Štefan', '3264');
INSERT INTO locations(name, post)
VALUES ('Sveti Tomaž', '2258');
INSERT INTO locations(name, post)
VALUES ('Šalovci', '9204');
INSERT INTO locations(name, post)
VALUES ('Šempas', '5261');
INSERT INTO locations(name, post)
VALUES ('Šempeter pri Gorici', '5290');
INSERT INTO locations(name, post)
VALUES ('Šempeter v Savinjski dolini', '3311');
INSERT INTO locations(name, post)
VALUES ('Šenčur', '4208');
INSERT INTO locations(name, post)
VALUES ('Šentilj v Slovenskih goricah', '2212');
INSERT INTO locations(name, post)
VALUES ('Šentjanž', '8297');
INSERT INTO locations(name, post)
VALUES ('Šentjanž pri Dravogradu', '2373');
INSERT INTO locations(name, post)
VALUES ('Šentjernej', '8310');
INSERT INTO locations(name, post)
VALUES ('Šentjur', '3230');
INSERT INTO locations(name, post)
VALUES ('Šentrupert', '3271');
INSERT INTO locations(name, post)
VALUES ('Šentrupert', '8232');
INSERT INTO locations(name, post)
VALUES ('Šentvid pri Stični', '1296');
INSERT INTO locations(name, post)
VALUES ('Škocjan', '8275');
INSERT INTO locations(name, post)
VALUES ('Škofije', '6281');
INSERT INTO locations(name, post)
VALUES ('Škofja Loka', '4220');
INSERT INTO locations(name, post)
VALUES ('Škofja vas', '3211');
INSERT INTO locations(name, post)
VALUES ('Škofljica', '1291');
INSERT INTO locations(name, post)
VALUES ('Šmarje', '6274');
INSERT INTO locations(name, post)
VALUES ('Šmarje - Sap', '1293');
INSERT INTO locations(name, post)
VALUES ('Šmarje pri Jelšah', '3240');
INSERT INTO locations(name, post)
VALUES ('Šmarješke Toplice', '8220');
INSERT INTO locations(name, post)
VALUES ('Šmartno na Pohorju', '2315');
INSERT INTO locations(name, post)
VALUES ('Šmartno ob Dreti', '3341');
INSERT INTO locations(name, post)
VALUES ('Šmartno ob Paki', '3327');
INSERT INTO locations(name, post)
VALUES ('Šmartno pri Litiji', '1275');
INSERT INTO locations(name, post)
VALUES ('Šmartno pri Slovenj Gradcu', '2383');
INSERT INTO locations(name, post)
VALUES ('Šmartno v Rožni dolini', '3201');
INSERT INTO locations(name, post)
VALUES ('Šoštanj', '3325');
INSERT INTO locations(name, post)
VALUES ('Štanjel', '6222');
INSERT INTO locations(name, post)
VALUES ('Štore', '3220');
INSERT INTO locations(name, post)
VALUES ('Tabor', '3304');
INSERT INTO locations(name, post)
VALUES ('Teharje', '3221');
INSERT INTO locations(name, post)
VALUES ('Tišina', '9251');
INSERT INTO locations(name, post)
VALUES ('Tolmin', '5220');
INSERT INTO locations(name, post)
VALUES ('Topolšica', '3326');
INSERT INTO locations(name, post)
VALUES ('Trbonje', '2371');
INSERT INTO locations(name, post)
VALUES ('Trbovlje', '1420');
INSERT INTO locations(name, post)
VALUES ('Trebelno ', '8231');
INSERT INTO locations(name, post)
VALUES ('Trebnje', '8210');
INSERT INTO locations(name, post)
VALUES ('Trnovo pri Gorici', '5252');
INSERT INTO locations(name, post)
VALUES ('Trnovska vas', '2254');
INSERT INTO locations(name, post)
VALUES ('Trojane', '1222');
INSERT INTO locations(name, post)
VALUES ('Trzin', '1236');
INSERT INTO locations(name, post)
VALUES ('Tržič', '4290');
INSERT INTO locations(name, post)
VALUES ('Tržišče', '8295');
INSERT INTO locations(name, post)
VALUES ('Turjak', '1311');
INSERT INTO locations(name, post)
VALUES ('Turnišče', '9224');
INSERT INTO locations(name, post)
VALUES ('Uršna sela', '8323');
INSERT INTO locations(name, post)
VALUES ('Vače', '1252');
INSERT INTO locations(name, post)
VALUES ('Vas', '1336');
INSERT INTO locations(name, post)
VALUES ('Velenje - dostava', '3320');
INSERT INTO locations(name, post)
VALUES ('Velenje - poštni predali', '3322');
INSERT INTO locations(name, post)
VALUES ('Velenje', '3503');
INSERT INTO locations(name, post)
VALUES ('Velenje', '3504');
INSERT INTO locations(name, post)
VALUES ('Velika Loka', '8212');
INSERT INTO locations(name, post)
VALUES ('Velika Nedelja', '2274');
INSERT INTO locations(name, post)
VALUES ('Velika Polana', '9225');
INSERT INTO locations(name, post)
VALUES ('Velike Lašče', '1315');
INSERT INTO locations(name, post)
VALUES ('Veliki Gaber', '8213');
INSERT INTO locations(name, post)
VALUES ('Veržej', '9241');
INSERT INTO locations(name, post)
VALUES ('Videm - Dobrepolje', '1312');
INSERT INTO locations(name, post)
VALUES ('Videm pri Ptuju', '2284');
INSERT INTO locations(name, post)
VALUES ('Vinica', '8344');
INSERT INTO locations(name, post)
VALUES ('Vipava', '5271');
INSERT INTO locations(name, post)
VALUES ('Visoko', '4212');
INSERT INTO locations(name, post)
VALUES ('Višnja Gora', '1294');
INSERT INTO locations(name, post)
VALUES ('Vitanje', '3205');
INSERT INTO locations(name, post)
VALUES ('Vitomarci', '2255');
INSERT INTO locations(name, post)
VALUES ('Vodice', '1217');
INSERT INTO locations(name, post)
VALUES ('Vojnik', '3212');
INSERT INTO locations(name, post)
VALUES ('Volčja Draga', '5293');
INSERT INTO locations(name, post)
VALUES ('Voličina', '2232');
INSERT INTO locations(name, post)
VALUES ('Vransko', '3305');
INSERT INTO locations(name, post)
VALUES ('Vremski Britof', '6217');
INSERT INTO locations(name, post)
VALUES ('Vrhnika', '1360');
INSERT INTO locations(name, post)
VALUES ('Vuhred', '2365');
INSERT INTO locations(name, post)
VALUES ('Vuzenica', '2367');
INSERT INTO locations(name, post)
VALUES ('Zabukovje ', '8292');
INSERT INTO locations(name, post)
VALUES ('Zagorje ob Savi', '1410');
INSERT INTO locations(name, post)
VALUES ('Zagradec', '1303');
INSERT INTO locations(name, post)
VALUES ('Zavrč', '2283');
INSERT INTO locations(name, post)
VALUES ('Zdole ', '8272');
INSERT INTO locations(name, post)
VALUES ('Zgornja Besnica', '4201');
INSERT INTO locations(name, post)
VALUES ('Zgornja Korena', '2242');
INSERT INTO locations(name, post)
VALUES ('Zgornja Kungota', '2201');
INSERT INTO locations(name, post)
VALUES ('Zgornja Ložnica', '2316');
INSERT INTO locations(name, post)
VALUES ('Zgornja Polskava', '2314');
INSERT INTO locations(name, post)
VALUES ('Zgornja Velka', '2213');
INSERT INTO locations(name, post)
VALUES ('Zgornje Gorje', '4247');
INSERT INTO locations(name, post)
VALUES ('Zgornje Jezersko', '4206');
INSERT INTO locations(name, post)
VALUES ('Zgornji Leskovec', '2285');
INSERT INTO locations(name, post)
VALUES ('Zidani Most', '1432');
INSERT INTO locations(name, post)
VALUES ('Zreče', '3214');
INSERT INTO locations(name, post)
VALUES ('Žabnica', '4209');
INSERT INTO locations(name, post)
VALUES ('Žalec', '3310');
INSERT INTO locations(name, post)
VALUES ('Železniki', '4228');
INSERT INTO locations(name, post)
VALUES ('Žetale', '2287');
INSERT INTO locations(name, post)
VALUES ('Žiri', '4226');
INSERT INTO locations(name, post)
VALUES ('Žirovnica', '4274');
INSERT INTO locations(name, post)
VALUES ('Žužemberk', '8360');


INSERT INTO studios (name, adress, email, location_id)
VALUES ('StudioEna', 'StudioEna23', 'StudioEna@gmail.com', 43);
INSERT INTO studios (name, adress, email, location_id)
VALUES ('StudioDva', 'StudioDva23', 'StudioDva@gmail.com', 54);
INSERT INTO studios (name, adress, email, location_id)
VALUES ('StudioTri', 'StudioTri23', 'StudioTri@gmail.com', 76);
INSERT INTO studios (name, adress, email, location_id)
VALUES ('StudioStiri', 'StudioStiri23', 'StudioStiri@gmail.com', 22);
INSERT INTO studios (name, adress, email, location_id)
VALUES ('StudioPet', 'StudioPet23', 'StudioPet@gmail.com', 43);
INSERT INTO studios (name, adress, email, location_id)
VALUES ('StudioSest', 'StudioSest23', 'StudioSest@gmail.com', 64);
INSERT INTO studios (name, adress, email, location_id)
VALUES ('StudioSedem', 'StudioSedem23', 'StudioSedem@gmail.com', 87);
INSERT INTO studios (name, adress, email, location_id)
VALUES ('StudioOsem', 'StudioOsem', 'StudioOsem@gmail.com', 43);
INSERT INTO studios (name, adress, email, location_id)
VALUES ('StudioDevet', 'StudioDevet23', 'StudioDevet@gmail.com', 21);
INSERT INTO studios (name, adress, email, location_id)
VALUES ('StudioDeset', 'StudioDeset23', 'StudioDeset@gmail.com', 11);
INSERT INTO studios (name, adress, email, location_id)
VALUES ('StudioEnajst', 'StudioEnajst23', 'StudioEnajst@gmail.com', 42);


INSERT INTO users (first_name, last_name, email, pass, studio_id, location_id)
VALUES ('UserEnaName', 'UserEnaLastName', 'UserEna@gmail.com', 'test', 2, 65);
INSERT INTO users (first_name, last_name, email, pass, studio_id, location_id)
VALUES ('UserDvaName', 'UserDvaLastName', 'UserDva@gmail.com', 'test', 2, 87);
INSERT INTO users (first_name, last_name, email, pass, studio_id, location_id)
VALUES ('UserTriName', 'UserTriLastName', 'UserTri@gmail.com', 'test', 2, 22);
INSERT INTO users (first_name, last_name, email, pass, studio_id, location_id)
VALUES ('UserStiriName', 'UserStiriLastName', 'UserStiri@gmail.com', 'test', 2, 33);
INSERT INTO users (first_name, last_name, email, pass, studio_id, location_id)
VALUES ('UserPetName', 'UserPetLastName', 'UserPet@gmail.com', 'test', 2, 44);
INSERT INTO users (first_name, last_name, email, pass, studio_id, location_id)
VALUES ('UserSestName', 'UserSestLastName', 'UserSest@gmail.com', 'test', 2, 55);
INSERT INTO users (first_name, last_name, email, pass, studio_id, location_id)
VALUES ('UserSedemName', 'UserSedemLastName', 'UserSedem@gmail.com', 'test', 2, 32);
INSERT INTO users (first_name, last_name, email, pass, studio_id, location_id)
VALUES ('UserOsemName', 'UserOsemLastName', 'UserOsem@gmail.com', 'test', 2, 87);
INSERT INTO users (first_name, last_name, email, pass, studio_id, location_id)
VALUES ('UserDevetName', 'UserDevetLastName', 'UserDevet@gmail.com', 'test', 2, 57);
INSERT INTO users (first_name, last_name, email, pass, studio_id, location_id)
VALUES ('UserDesetName', 'UserDesetLastName', 'UserDeset@gmail.com', 'test', 2, 72);
INSERT INTO users (first_name, last_name, email, pass, studio_id, location_id)
VALUES ('UserEnaName', 'UserEnaLastName', 'UserEna@gmail.com', 'test', 3, 65);
INSERT INTO users (first_name, last_name, email, pass, studio_id, location_id)
VALUES ('UserDvaName', 'UserDvaLastName', 'UserDva@gmail.com', 'test', 3, 87);
INSERT INTO users (first_name, last_name, email, pass, studio_id, location_id)
VALUES ('UserTriName', 'UserTriLastName', 'UserTri@gmail.com', 'test', 3, 33);
INSERT INTO users (first_name, last_name, email, pass, studio_id, location_id)
VALUES ('UserStiriName', 'UserStiriLastName', 'UserStiri@gmail.com', 'test', 3, 33);
INSERT INTO users (first_name, last_name, email, pass, studio_id, location_id)
VALUES ('UserPetName', 'UserPetLastName', 'UserPet@gmail.com', 'test', 3, 44);
INSERT INTO users (first_name, last_name, email, pass, studio_id, location_id)
VALUES ('UserSestName', 'UserSestLastName', 'UserSest@gmail.com', 'test', 3, 55);
INSERT INTO users (first_name, last_name, email, pass, studio_id, location_id)
VALUES ('UserSedemName', 'UserSedemLastName', 'UserSedem@gmail.com', 'test', 3, 33);
INSERT INTO users (first_name, last_name, email, pass, studio_id, location_id)
VALUES ('UserOsemName', 'UserOsemLastName', 'UserOsem@gmail.com', 'test', 3, 87);
INSERT INTO users (first_name, last_name, email, pass, studio_id, location_id)
VALUES ('UserDevetName', 'UserDevetLastName', 'UserDevet@gmail.com', 'test', 3, 57);
INSERT INTO users (first_name, last_name, email, pass, studio_id, location_id)
VALUES ('UserDesetName', 'UserDesetLastName', 'UserDeset@gmail.com', 'test', 3, 73);
INSERT INTO users (first_name, last_name, email, pass, studio_id, location_id)
VALUES ('UserEnaName', 'UserEnaLastName', 'UserEna@gmail.com', 'test', 4, 65);
INSERT INTO users (first_name, last_name, email, pass, studio_id, location_id)
VALUES ('UserDvaName', 'UserDvaLastName', 'UserDva@gmail.com', 'test', 4, 87);
INSERT INTO users (first_name, last_name, email, pass, studio_id, location_id)
VALUES ('UserTriName', 'UserTriLastName', 'UserTri@gmail.com', 'test', 4, 44);
INSERT INTO users (first_name, last_name, email, pass, studio_id, location_id)
VALUES ('UserStiriName', 'UserStiriLastName', 'UserStiri@gmail.com', 'test', 4, 44);
INSERT INTO users (first_name, last_name, email, pass, studio_id, location_id)
VALUES ('UserPetName', 'UserPetLastName', 'UserPet@gmail.com', 'test', 4, 44);
INSERT INTO users (first_name, last_name, email, pass, studio_id, location_id)
VALUES ('UserSestName', 'UserSestLastName', 'UserSest@gmail.com', 'test', 4, 55);
INSERT INTO users (first_name, last_name, email, pass, studio_id, location_id)
VALUES ('UserSedemName', 'UserSedemLastName', 'UserSedem@gmail.com', 'test', 4, 44);
INSERT INTO users (first_name, last_name, email, pass, studio_id, location_id)
VALUES ('UserOsemName', 'UserOsemLastName', 'UserOsem@gmail.com', 'test', 4, 87);
INSERT INTO users (first_name, last_name, email, pass, studio_id, location_id)
VALUES ('UserDevetName', 'UserDevetLastName', 'UserDevet@gmail.com', 'test', 4, 81);
INSERT INTO users (first_name, last_name, email, pass, studio_id, location_id)
VALUES ('UserDesetName', 'UserDesetLastName', 'UserDeset@gmail.com', 'test', 4, 80);
INSERT INTO users (first_name, last_name, email, pass, studio_id, location_id)
VALUES ('UserEnaName', 'UserEnaLastName', 'UserEna@gmail.com', 'test', 5, 79);
INSERT INTO users (first_name, last_name, email, pass, studio_id, location_id)
VALUES ('UserDvaName', 'UserDvaLastName', 'UserDva@gmail.com', 'test', 5, 78);
INSERT INTO users (first_name, last_name, email, pass, studio_id, location_id)
VALUES ('UserTriName', 'UserTriLastName', 'UserTri@gmail.com', 'test', 5, 76);
INSERT INTO users (first_name, last_name, email, pass, studio_id, location_id)
VALUES ('UserStiriName', 'UserStiriLastName', 'UserStiri@gmail.com', 'test', 5, 75);
INSERT INTO users (first_name, last_name, email, pass, studio_id, location_id)
VALUES ('UserPetName', 'UserPetLastName', 'UserPet@gmail.com', 'test', 5, 74);
INSERT INTO users (first_name, last_name, email, pass, studio_id, location_id)
VALUES ('UserSestName', 'UserSestLastName', 'UserSest@gmail.com', 'test', 5, 73);
INSERT INTO users (first_name, last_name, email, pass, studio_id, location_id)
VALUES ('UserSedemName', 'UserSedemLastName', 'UserSedem@gmail.com', 'test', 5, 72);
INSERT INTO users (first_name, last_name, email, pass, studio_id, location_id)
VALUES ('UserOsemName', 'UserOsemLastName', 'UserOsem@gmail.com', 'test', 5, 71);
INSERT INTO users (first_name, last_name, email, pass, studio_id, location_id)
VALUES ('UserDevetName', 'UserDevetLastName', 'UserDevet@gmail.com', 'test', 5, 70);
INSERT INTO users (first_name, last_name, email, pass, studio_id, location_id)
VALUES ('UserDesetName', 'UserDesetLastName', 'UserDeset@gmail.com', 'test', 5, 69);
INSERT INTO users (first_name, last_name, email, pass, studio_id, location_id)
VALUES ('UserEnaName', 'UserEnaLastName', 'UserEna@gmail.com', 'test', 6, 68);
INSERT INTO users (first_name, last_name, email, pass, studio_id, location_id)
VALUES ('UserDvaName', 'UserDvaLastName', 'UserDva@gmail.com', 'test', 6, 65);
INSERT INTO users (first_name, last_name, email, pass, studio_id, location_id)
VALUES ('UserTriName', 'UserTriLastName', 'UserTri@gmail.com', 'test', 6, 67);
INSERT INTO users (first_name, last_name, email, pass, studio_id, location_id)
VALUES ('UserStiriName', 'UserStiriLastName', 'UserStiri@gmail.com', 'test', 6, 66);
INSERT INTO users (first_name, last_name, email, pass, studio_id, location_id)
VALUES ('UserPetName', 'UserPetLastName', 'UserPet@gmail.com', 'test', 6, 64);
INSERT INTO users (first_name, last_name, email, pass, studio_id, location_id)
VALUES ('UserSestName', 'UserSestLastName', 'UserSest@gmail.com', 'test', 6, 63);
INSERT INTO users (first_name, last_name, email, pass, studio_id, location_id)
VALUES ('UserSedemName', 'UserSedemLastName', 'UserSedem@gmail.com', 'test', 6, 62);
INSERT INTO users (first_name, last_name, email, pass, studio_id, location_id)
VALUES ('UserOsemName', 'UserOsemLastName', 'UserOsem@gmail.com', 'test', 6, 61);
INSERT INTO users (first_name, last_name, email, pass, studio_id, location_id)
VALUES ('UserDevetName', 'UserDevetLastName', 'UserDevet@gmail.com', 'test', 6, 60);
INSERT INTO users (first_name, last_name, email, pass, studio_id, location_id)
VALUES ('UserDesetName', 'UserDesetLastName', 'UserDeset@gmail.com', 'test', 6, 59);
INSERT INTO users (first_name, last_name, email, pass, studio_id, location_id)
VALUES ('UserEnaName', 'UserEnaLastName', 'UserEna@gmail.com', 'test', 7, 58);
INSERT INTO users (first_name, last_name, email, pass, studio_id, location_id)
VALUES ('UserDvaName', 'UserDvaLastName', 'UserDva@gmail.com', 'test', 7, 57);
INSERT INTO users (first_name, last_name, email, pass, studio_id, location_id)
VALUES ('UserTriName', 'UserTriLastName', 'UserTri@gmail.com', 'test', 7, 56);
INSERT INTO users (first_name, last_name, email, pass, studio_id, location_id)
VALUES ('UserStiriName', 'UserStiriLastName', 'UserStiri@gmail.com', 'test', 7, 55);
INSERT INTO users (first_name, last_name, email, pass, studio_id, location_id)
VALUES ('UserPetName', 'UserPetLastName', 'UserPet@gmail.com', 'test', 7, 54);
INSERT INTO users (first_name, last_name, email, pass, studio_id, location_id)
VALUES ('UserSestName', 'UserSestLastName', 'UserSest@gmail.com', 'test', 7, 53);
INSERT INTO users (first_name, last_name, email, pass, studio_id, location_id)
VALUES ('UserSedemName', 'UserSedemLastName', 'UserSedem@gmail.com', 'test', 7, 52);
INSERT INTO users (first_name, last_name, email, pass, studio_id, location_id)
VALUES ('UserOsemName', 'UserOsemLastName', 'UserOsem@gmail.com', 'test', 7, 51);
INSERT INTO users (first_name, last_name, email, pass, studio_id, location_id)
VALUES ('UserDevetName', 'UserDevetLastName', 'UserDevet@gmail.com', 'test', 7, 50);
INSERT INTO users (first_name, last_name, email, pass, studio_id, location_id)
VALUES ('UserDesetName', 'UserDesetLastName', 'UserDeset@gmail.com', 'test', 7, 49);
INSERT INTO users (first_name, last_name, email, pass, studio_id, location_id)
VALUES ('UserEnaName', 'UserEnaLastName', 'UserEna@gmail.com', 'test', 8, 48);
INSERT INTO users (first_name, last_name, email, pass, studio_id, location_id)
VALUES ('UserDvaName', 'UserDvaLastName', 'UserDva@gmail.com', 'test', 8, 84);
INSERT INTO users (first_name, last_name, email, pass, studio_id, location_id)
VALUES ('UserTriName', 'UserTriLastName', 'UserTri@gmail.com', 'test', 8, 47);
INSERT INTO users (first_name, last_name, email, pass, studio_id, location_id)
VALUES ('UserStiriName', 'UserStiriLastName', 'UserStiri@gmail.com', 'test', 8, 46);
INSERT INTO users (first_name, last_name, email, pass, studio_id, location_id)
VALUES ('UserPetName', 'UserPetLastName', 'UserPet@gmail.com', 'test', 8, 45);
INSERT INTO users (first_name, last_name, email, pass, studio_id, location_id)
VALUES ('UserSestName', 'UserSestLastName', 'UserSest@gmail.com', 'test', 8, 44);
INSERT INTO users (first_name, last_name, email, pass, studio_id, location_id)
VALUES ('UserSedemName', 'UserSedemLastName', 'UserSedem@gmail.com', 'test', 8, 43);
INSERT INTO users (first_name, last_name, email, pass, studio_id, location_id)
VALUES ('UserOsemName', 'UserOsemLastName', 'UserOsem@gmail.com', 'test', 8, 42);
INSERT INTO users (first_name, last_name, email, pass, studio_id, location_id)
VALUES ('UserDevetName', 'UserDevetLastName', 'UserDevet@gmail.com', 'test', 8, 41);
INSERT INTO users (first_name, last_name, email, pass, studio_id, location_id)
VALUES ('UserDesetName', 'UserDesetLastName', 'UserDeset@gmail.com', 'test', 8, 40);
INSERT INTO users (first_name, last_name, email, pass, studio_id, location_id)
VALUES ('UserEnaName', 'UserEnaLastName', 'UserEna@gmail.com', 'test', 9, 39);
INSERT INTO users (first_name, last_name, email, pass, studio_id, location_id)
VALUES ('UserDvaName', 'UserDvaLastName', 'UserDva@gmail.com', 'test', 9, 38);
INSERT INTO users (first_name, last_name, email, pass, studio_id, location_id)
VALUES ('UserTriName', 'UserTriLastName', 'UserTri@gmail.com', 'test', 9, 37);
INSERT INTO users (first_name, last_name, email, pass, studio_id, location_id)
VALUES ('UserStiriName', 'UserStiriLastName', 'UserStiri@gmail.com', 'test', 9, 36);
INSERT INTO users (first_name, last_name, email, pass, studio_id, location_id)
VALUES ('UserPetName', 'UserPetLastName', 'UserPet@gmail.com', 'test', 9, 35);
INSERT INTO users (first_name, last_name, email, pass, studio_id, location_id)
VALUES ('UserSestName', 'UserSestLastName', 'UserSest@gmail.com', 'test', 9, 34);
INSERT INTO users (first_name, last_name, email, pass, studio_id, location_id)
VALUES ('UserSedemName', 'UserSedemLastName', 'UserSedem@gmail.com', 'test', 9, 33);
INSERT INTO users (first_name, last_name, email, pass, studio_id, location_id)
VALUES ('UserOsemName', 'UserOsemLastName', 'UserOsem@gmail.com', 'test', 9, 32);
INSERT INTO users (first_name, last_name, email, pass, studio_id, location_id)
VALUES ('UserDevetName', 'UserDevetLastName', 'UserDevet@gmail.com', 'test', 9, 31);
INSERT INTO users (first_name, last_name, email, pass, studio_id, location_id)
VALUES ('UserDesetName', 'UserDesetLastName', 'UserDeset@gmail.com', 'test', 9, 30);
INSERT INTO users (first_name, last_name, email, pass, studio_id, location_id)
VALUES ('UserEnaName', 'UserEnaLastName', 'UserEna@gmail.com', 'test', 10, 30);
INSERT INTO users (first_name, last_name, email, pass, studio_id, location_id)
VALUES ('UserDvaName', 'UserDvaLastName', 'UserDva@gmail.com', 'test', 10, 29);
INSERT INTO users (first_name, last_name, email, pass, studio_id, location_id)
VALUES ('UserTriName', 'UserTriLastName', 'UserTri@gmail.com', 'test', 10, 28);
INSERT INTO users (first_name, last_name, email, pass, studio_id, location_id)
VALUES ('UserStiriName', 'UserStiriLastName', 'UserStiri@gmail.com', 'test', 10, 27);
INSERT INTO users (first_name, last_name, email, pass, studio_id, location_id)
VALUES ('UserPetName', 'UserPetLastName', 'UserPet@gmail.com', 'test', 10, 26);
INSERT INTO users (first_name, last_name, email, pass, studio_id, location_id)
VALUES ('UserSestName', 'UserSestLastName', 'UserSest@gmail.com', 'test', 10, 25);
INSERT INTO users (first_name, last_name, email, pass, studio_id, location_id)
VALUES ('UserSedemName', 'UserSedemLastName', 'UserSedem@gmail.com', 'test', 10, 24);
INSERT INTO users (first_name, last_name, email, pass, studio_id, location_id)
VALUES ('UserOsemName', 'UserOsemLastName', 'UserOsem@gmail.com', 'test', 10, 23);
INSERT INTO users (first_name, last_name, email, pass, studio_id, location_id)
VALUES ('UserDevetName', 'UserDevetLastName', 'UserDevet@gmail.com', 'test', 10, 22);
INSERT INTO users (first_name, last_name, email, pass, studio_id, location_id)
VALUES ('UserDesetName', 'UserDesetLastName', 'UserDeset@gmail.com', 'test', 10, 21);
INSERT INTO users (first_name, last_name, email, pass, studio_id, location_id)
VALUES ('UserEnaName', 'UserEnaLastName', 'UserEna@gmail.com', 'test', 11, 20);
INSERT INTO users (first_name, last_name, email, pass, studio_id, location_id)
VALUES ('UserDvaName', 'UserDvaLastName', 'UserDva@gmail.com', 'test', 11, 19);
INSERT INTO users (first_name, last_name, email, pass, studio_id, location_id)
VALUES ('UserTriName', 'UserTriLastName', 'UserTri@gmail.com', 'test', 11, 18);
INSERT INTO users (first_name, last_name, email, pass, studio_id, location_id)
VALUES ('UserStiriName', 'UserStiriLastName', 'UserStiri@gmail.com', 'test', 11, 17);
INSERT INTO users (first_name, last_name, email, pass, studio_id, location_id)
VALUES ('UserPetName', 'UserPetLastName', 'UserPet@gmail.com', 'test', 11, 16);
INSERT INTO users (first_name, last_name, email, pass, studio_id, location_id)
VALUES ('UserSestName', 'UserSestLastName', 'UserSest@gmail.com', 'test', 11, 15);
INSERT INTO users (first_name, last_name, email, pass, studio_id, location_id)
VALUES ('UserSedemName', 'UserSedemLastName', 'UserSedem@gmail.com', 'test', 11, 14);
INSERT INTO users (first_name, last_name, email, pass, studio_id, location_id)
VALUES ('UserOsemName', 'UserOsemLastName', 'UserOsem@gmail.com', 'test', 11, 13);
INSERT INTO users (first_name, last_name, email, pass, studio_id, location_id)
VALUES ('UserDevetName', 'UserDevetLastName', 'UserDevet@gmail.com', 'test', 11, 12);
INSERT INTO users (first_name, last_name, email, pass, studio_id, location_id)
VALUES ('UserDesetName', 'UserDesetLastName', 'UserDeset@gmail.com', 'test', 11, 11);
INSERT INTO users (first_name, last_name, email, pass, studio_id, location_id)
VALUES ('UserEnaName', 'UserEnaLastName', 'UserEna@gmail.com', 'test', 1, 1);
INSERT INTO users (first_name, last_name, email, pass, studio_id, location_id)
VALUES ('UserDvaName', 'UserDvaLastName', 'UserDva@gmail.com', 'test', 1, 2);
INSERT INTO users (first_name, last_name, email, pass, studio_id, location_id)
VALUES ('UserTriName', 'UserTriLastName', 'UserTri@gmail.com', 'test', 1, 3);
INSERT INTO users (first_name, last_name, email, pass, studio_id, location_id)
VALUES ('UserStiriName', 'UserStiriLastName', 'UserStiri@gmail.com', 'test', 1, 4);
INSERT INTO users (first_name, last_name, email, pass, studio_id, location_id)
VALUES ('UserPetName', 'UserPetLastName', 'UserPet@gmail.com', 'test', 1, 5);
INSERT INTO users (first_name, last_name, email, pass, studio_id, location_id)
VALUES ('UserSestName', 'UserSestLastName', 'UserSest@gmail.com', 'test', 1, 6);
INSERT INTO users (first_name, last_name, email, pass, studio_id, location_id)
VALUES ('UserSedemName', 'UserSedemLastName', 'UserSedem@gmail.com', 'test', 1, 7);
INSERT INTO users (first_name, last_name, email, pass, studio_id, location_id)
VALUES ('UserOsemName', 'UserOsemLastName', 'UserOsem@gmail.com', 'test', 1, 8);
INSERT INTO users (first_name, last_name, email, pass, studio_id, location_id)
VALUES ('UserDevetName', 'UserDevetLastName', 'UserDevet@gmail.com', 'test', 1, 9);
INSERT INTO users (first_name, last_name, email, pass, studio_id, location_id)
VALUES ('UserDesetName', 'UserDesetLastName', 'UserDeset@gmail.com', 'test', 1, 10);


INSERT INTO equipment (name, model, warnings, description, studio_id)
VALUES ('equipmentEna', 'equipmentModelEna', 'equipmentOpombaEna', 'equipmentdescriptionEna', 2);
INSERT INTO equipment (name, model, warnings, description, studio_id)
VALUES ('equipmentDva', 'equipmentDvaModel', 'equipmentDvaOpomba', 'equipmentDvadescription', 2);
INSERT INTO equipment (name, model, warnings, description, studio_id)
VALUES ('equipmentTri', 'equipmentTriModel', 'equipmentTriOpomba', 'equipmentTridescription', 2);
INSERT INTO equipment (name, model, warnings, description, studio_id)
VALUES ('equipmentStiri', 'equipmentStiriModel', 'equipmentStiriOpomba', 'equipmentStiridescription', 2);
INSERT INTO equipment (name, model, warnings, description, studio_id)
VALUES ('equipmentPet', 'equipmentPetModel', 'equipmentPetOpomba', 'equipmentPetdescription', 2);
INSERT INTO equipment (name, model, warnings, description, studio_id)
VALUES ('equipmentSest', 'equipmentSestModel', 'equipmentSestOpomba', 'equipmentSestdescription', 2);
INSERT INTO equipment (name, model, warnings, description, studio_id)
VALUES ('equipmentSedem', 'equipmentSedemModel', 'equipmentSedemOpomba', 'equipmentSedemdescription', 2);
INSERT INTO equipment (name, model, warnings, description, studio_id)
VALUES ('equipmentOsem', 'equipmentOsemModel', 'OpremOsemaOpomba', 'equipmentOsemdescription', 2);
INSERT INTO equipment (name, model, warnings, description, studio_id)
VALUES ('equipmentDevet', 'equipmentDevetModel', 'equipmentDevetOpomba', 'equipmentDevetdescription', 2);
INSERT INTO equipment (name, model, warnings, description, studio_id)
VALUES ('equipmentEna', 'equipmentModelEna', 'equipmentOpombaEna', 'equipmentdescriptionEna', 3);
INSERT INTO equipment (name, model, warnings, description, studio_id)
VALUES ('equipmentDva', 'equipmentDvaModel', 'equipmentDvaOpomba', 'equipmentDvadescription', 3);
INSERT INTO equipment (name, model, warnings, description, studio_id)
VALUES ('equipmentTri', 'equipmentTriModel', 'equipmentTriOpomba', 'equipmentTridescription', 3);
INSERT INTO equipment (name, model, warnings, description, studio_id)
VALUES ('equipmentStiri', 'equipmentStiriModel', 'equipmentStiriOpomba', 'equipmentStiridescription', 3);
INSERT INTO equipment (name, model, warnings, description, studio_id)
VALUES ('equipmentPet', 'equipmentPetModel', 'equipmentPetOpomba', 'equipmentPetdescription', 3);
INSERT INTO equipment (name, model, warnings, description, studio_id)
VALUES ('equipmentSest', 'equipmentSestModel', 'equipmentSestOpomba', 'equipmentSestdescription', 3);
INSERT INTO equipment (name, model, warnings, description, studio_id)
VALUES ('equipmentSedem', 'equipmentSedemModel', 'equipmentSedemOpomba', 'equipmentSedemdescription', 3);
INSERT INTO equipment (name, model, warnings, description, studio_id)
VALUES ('equipmentOsem', 'equipmentOsemModel', 'OpremOsemaOpomba', 'equipmentOsemdescription', 3);
INSERT INTO equipment (name, model, warnings, description, studio_id)
VALUES ('equipmentDevet', 'equipmentDevetModel', 'equipmentDevetOpomba', 'equipmentDevetdescription', 3);
INSERT INTO equipment (name, model, warnings, description, studio_id)
VALUES ('equipmentEna', 'equipmentModelEna', 'equipmentOpombaEna', 'equipmentdescriptionEna', 4);
INSERT INTO equipment (name, model, warnings, description, studio_id)
VALUES ('equipmentDva', 'equipmentDvaModel', 'equipmentDvaOpomba', 'equipmentDvadescription', 4);
INSERT INTO equipment (name, model, warnings, description, studio_id)
VALUES ('equipmentTri', 'equipmentTriModel', 'equipmentTriOpomba', 'equipmentTridescription', 4);
INSERT INTO equipment (name, model, warnings, description, studio_id)
VALUES ('equipmentStiri', 'equipmentStiriModel', 'equipmentStiriOpomba', 'equipmentStiridescription', 4);
INSERT INTO equipment (name, model, warnings, description, studio_id)
VALUES ('equipmentPet', 'equipmentPetModel', 'equipmentPetOpomba', 'equipmentPetdescription', 4);
INSERT INTO equipment (name, model, warnings, description, studio_id)
VALUES ('equipmentSest', 'equipmentSestModel', 'equipmentSestOpomba', 'equipmentSestdescription', 4);
INSERT INTO equipment (name, model, warnings, description, studio_id)
VALUES ('equipmentSedem', 'equipmentSedemModel', 'equipmentSedemOpomba', 'equipmentSedemdescription', 4);
INSERT INTO equipment (name, model, warnings, description, studio_id)
VALUES ('equipmentOsem', 'equipmentOsemModel', 'OpremOsemaOpomba', 'equipmentOsemdescription', 4);
INSERT INTO equipment (name, model, warnings, description, studio_id)
VALUES ('equipmentDevet', 'equipmentDevetModel', 'equipmentDevetOpomba', 'equipmentDevetdescription', 4);
INSERT INTO equipment (name, model, warnings, description, studio_id)
VALUES ('equipmentEna', 'equipmentModelEna', 'equipmentOpombaEna', 'equipmentdescriptionEna', 5);
INSERT INTO equipment (name, model, warnings, description, studio_id)
VALUES ('equipmentDva', 'equipmentDvaModel', 'equipmentDvaOpomba', 'equipmentDvadescription', 5);
INSERT INTO equipment (name, model, warnings, description, studio_id)
VALUES ('equipmentTri', 'equipmentTriModel', 'equipmentTriOpomba', 'equipmentTridescription', 5);
INSERT INTO equipment (name, model, warnings, description, studio_id)
VALUES ('equipmentStiri', 'equipmentStiriModel', 'equipmentStiriOpomba', 'equipmentStiridescription', 5);
INSERT INTO equipment (name, model, warnings, description, studio_id)
VALUES ('equipmentPet', 'equipmentPetModel', 'equipmentPetOpomba', 'equipmentPetdescription', 5);
INSERT INTO equipment (name, model, warnings, description, studio_id)
VALUES ('equipmentSest', 'equipmentSestModel', 'equipmentSestOpomba', 'equipmentSestdescription', 5);
INSERT INTO equipment (name, model, warnings, description, studio_id)
VALUES ('equipmentSedem', 'equipmentSedemModel', 'equipmentSedemOpomba', 'equipmentSedemdescription', 5);
INSERT INTO equipment (name, model, warnings, description, studio_id)
VALUES ('equipmentOsem', 'equipmentOsemModel', 'OpremOsemaOpomba', 'equipmentOsemdescription', 5);
INSERT INTO equipment (name, model, warnings, description, studio_id)
VALUES ('equipmentDevet', 'equipmentDevetModel', 'equipmentDevetOpomba', 'equipmentDevetdescription', 5);
INSERT INTO equipment (name, model, warnings, description, studio_id)
VALUES ('equipmentEna', 'equipmentModelEna', 'equipmentOpombaEna', 'equipmentdescriptionEna', 6);
INSERT INTO equipment (name, model, warnings, description, studio_id)
VALUES ('equipmentDva', 'equipmentDvaModel', 'equipmentDvaOpomba', 'equipmentDvadescription', 6);
INSERT INTO equipment (name, model, warnings, description, studio_id)
VALUES ('equipmentTri', 'equipmentTriModel', 'equipmentTriOpomba', 'equipmentTridescription', 6);
INSERT INTO equipment (name, model, warnings, description, studio_id)
VALUES ('equipmentStiri', 'equipmentStiriModel', 'equipmentStiriOpomba', 'equipmentStiridescription', 6);
INSERT INTO equipment (name, model, warnings, description, studio_id)
VALUES ('equipmentPet', 'equipmentPetModel', 'equipmentPetOpomba', 'equipmentPetdescription', 6);
INSERT INTO equipment (name, model, warnings, description, studio_id)
VALUES ('equipmentSest', 'equipmentSestModel', 'equipmentSestOpomba', 'equipmentSestdescription', 6);
INSERT INTO equipment (name, model, warnings, description, studio_id)
VALUES ('equipmentSedem', 'equipmentSedemModel', 'equipmentSedemOpomba', 'equipmentSedemdescription', 6);
INSERT INTO equipment (name, model, warnings, description, studio_id)
VALUES ('equipmentOsem', 'equipmentOsemModel', 'OpremOsemaOpomba', 'equipmentOsemdescription', 6);
INSERT INTO equipment (name, model, warnings, description, studio_id)
VALUES ('equipmentDevet', 'equipmentDevetModel', 'equipmentDevetOpomba', 'equipmentDevetdescription', 6);
INSERT INTO equipment (name, model, warnings, description, studio_id)
VALUES ('equipmentEna', 'equipmentModelEna', 'equipmentOpombaEna', 'equipmentdescriptionEna', 7);
INSERT INTO equipment (name, model, warnings, description, studio_id)
VALUES ('equipmentDva', 'equipmentDvaModel', 'equipmentDvaOpomba', 'equipmentDvadescription', 7);
INSERT INTO equipment (name, model, warnings, description, studio_id)
VALUES ('equipmentTri', 'equipmentTriModel', 'equipmentTriOpomba', 'equipmentTridescription', 7);
INSERT INTO equipment (name, model, warnings, description, studio_id)
VALUES ('equipmentStiri', 'equipmentStiriModel', 'equipmentStiriOpomba', 'equipmentStiridescription', 7);
INSERT INTO equipment (name, model, warnings, description, studio_id)
VALUES ('equipmentPet', 'equipmentPetModel', 'equipmentPetOpomba', 'equipmentPetdescription', 7);
INSERT INTO equipment (name, model, warnings, description, studio_id)
VALUES ('equipmentSest', 'equipmentSestModel', 'equipmentSestOpomba', 'equipmentSestdescription', 7);
INSERT INTO equipment (name, model, warnings, description, studio_id)
VALUES ('equipmentSedem', 'equipmentSedemModel', 'equipmentSedemOpomba', 'equipmentSedemdescription', 7);
INSERT INTO equipment (name, model, warnings, description, studio_id)
VALUES ('equipmentOsem', 'equipmentOsemModel', 'OpremOsemaOpomba', 'equipmentOsemdescription', 7);
INSERT INTO equipment (name, model, warnings, description, studio_id)
VALUES ('equipmentDevet', 'equipmentDevetModel', 'equipmentDevetOpomba', 'equipmentDevetdescription', 7);
INSERT INTO equipment (name, model, warnings, description, studio_id)
VALUES ('equipmentEna', 'equipmentModelEna', 'equipmentOpombaEna', 'equipmentdescriptionEna', 8);
INSERT INTO equipment (name, model, warnings, description, studio_id)
VALUES ('equipmentDva', 'equipmentDvaModel', 'equipmentDvaOpomba', 'equipmentDvadescription', 8);
INSERT INTO equipment (name, model, warnings, description, studio_id)
VALUES ('equipmentTri', 'equipmentTriModel', 'equipmentTriOpomba', 'equipmentTridescription', 8);
INSERT INTO equipment (name, model, warnings, description, studio_id)
VALUES ('equipmentStiri', 'equipmentStiriModel', 'equipmentStiriOpomba', 'equipmentStiridescription', 8);
INSERT INTO equipment (name, model, warnings, description, studio_id)
VALUES ('equipmentPet', 'equipmentPetModel', 'equipmentPetOpomba', 'equipmentPetdescription', 8);
INSERT INTO equipment (name, model, warnings, description, studio_id)
VALUES ('equipmentSest', 'equipmentSestModel', 'equipmentSestOpomba', 'equipmentSestdescription', 8);
INSERT INTO equipment (name, model, warnings, description, studio_id)
VALUES ('equipmentSedem', 'equipmentSedemModel', 'equipmentSedemOpomba', 'equipmentSedemdescription', 8);
INSERT INTO equipment (name, model, warnings, description, studio_id)
VALUES ('equipmentOsem', 'equipmentOsemModel', 'OpremOsemaOpomba', 'equipmentOsemdescription', 8);
INSERT INTO equipment (name, model, warnings, description, studio_id)
VALUES ('equipmentDevet', 'equipmentDevetModel', 'equipmentDevetOpomba', 'equipmentDevetdescription', 8);
INSERT INTO equipment (name, model, warnings, description, studio_id)
VALUES ('equipmentEna', 'equipmentModelEna', 'equipmentOpombaEna', 'equipmentdescriptionEna', 9);
INSERT INTO equipment (name, model, warnings, description, studio_id)
VALUES ('equipmentDva', 'equipmentDvaModel', 'equipmentDvaOpomba', 'equipmentDvadescription', 9);
INSERT INTO equipment (name, model, warnings, description, studio_id)
VALUES ('equipmentTri', 'equipmentTriModel', 'equipmentTriOpomba', 'equipmentTridescription', 9);
INSERT INTO equipment (name, model, warnings, description, studio_id)
VALUES ('equipmentStiri', 'equipmentStiriModel', 'equipmentStiriOpomba', 'equipmentStiridescription', 9);
INSERT INTO equipment (name, model, warnings, description, studio_id)
VALUES ('equipmentPet', 'equipmentPetModel', 'equipmentPetOpomba', 'equipmentPetdescription', 9);
INSERT INTO equipment (name, model, warnings, description, studio_id)
VALUES ('equipmentSest', 'equipmentSestModel', 'equipmentSestOpomba', 'equipmentSestdescription', 9);
INSERT INTO equipment (name, model, warnings, description, studio_id)
VALUES ('equipmentSedem', 'equipmentSedemModel', 'equipmentSedemOpomba', 'equipmentSedemdescription', 9);
INSERT INTO equipment (name, model, warnings, description, studio_id)
VALUES ('equipmentOsem', 'equipmentOsemModel', 'OpremOsemaOpomba', 'equipmentOsemdescription', 9);
INSERT INTO equipment (name, model, warnings, description, studio_id)
VALUES ('equipmentDevet', 'equipmentDevetModel', 'equipmentDevetOpomba', 'equipmentDevetdescription', 9);
INSERT INTO equipment (name, model, warnings, description, studio_id)
VALUES ('equipmentEna', 'equipmentModelEna', 'equipmentOpombaEna', 'equipmentdescriptionEna', 10);
INSERT INTO equipment (name, model, warnings, description, studio_id)
VALUES ('equipmentDva', 'equipmentDvaModel', 'equipmentDvaOpomba', 'equipmentDvadescription', 10);
INSERT INTO equipment (name, model, warnings, description, studio_id)
VALUES ('equipmentTri', 'equipmentTriModel', 'equipmentTriOpomba', 'equipmentTridescription', 10);
INSERT INTO equipment (name, model, warnings, description, studio_id)
VALUES ('equipmentStiri', 'equipmentStiriModel', 'equipmentStiriOpomba', 'equipmentStiridescription', 10);
INSERT INTO equipment (name, model, warnings, description, studio_id)
VALUES ('equipmentPet', 'equipmentPetModel', 'equipmentPetOpomba', 'equipmentPetdescription', 10);
INSERT INTO equipment (name, model, warnings, description, studio_id)
VALUES ('equipmentSest', 'equipmentSestModel', 'equipmentSestOpomba', 'equipmentSestdescription', 10);
INSERT INTO equipment (name, model, warnings, description, studio_id)
VALUES ('equipmentSedem', 'equipmentSedemModel', 'equipmentSedemOpomba', 'equipmentSedemdescription', 10);
INSERT INTO equipment (name, model, warnings, description, studio_id)
VALUES ('equipmentOsem', 'equipmentOsemModel', 'OpremOsemaOpomba', 'equipmentOsemdescription', 10);
INSERT INTO equipment (name, model, warnings, description, studio_id)
VALUES ('equipmentDevet', 'equipmentDevetModel', 'equipmentDevetOpomba', 'equipmentDevetdescription', 10);
INSERT INTO equipment (name, model, warnings, description, studio_id)
VALUES ('equipmentEna', 'equipmentModelEna', 'equipmentOpombaEna', 'equipmentdescriptionEna', 11);
INSERT INTO equipment (name, model, warnings, description, studio_id)
VALUES ('equipmentDva', 'equipmentDvaModel', 'equipmentDvaOpomba', 'equipmentDvadescription', 11);
INSERT INTO equipment (name, model, warnings, description, studio_id)
VALUES ('equipmentTri', 'equipmentTriModel', 'equipmentTriOpomba', 'equipmentTridescription', 11);
INSERT INTO equipment (name, model, warnings, description, studio_id)
VALUES ('equipmentStiri', 'equipmentStiriModel', 'equipmentStiriOpomba', 'equipmentStiridescription', 11);
INSERT INTO equipment (name, model, warnings, description, studio_id)
VALUES ('equipmentPet', 'equipmentPetModel', 'equipmentPetOpomba', 'equipmentPetdescription', 11);
INSERT INTO equipment (name, model, warnings, description, studio_id)
VALUES ('equipmentSest', 'equipmentSestModel', 'equipmentSestOpomba', 'equipmentSestdescription', 11);
INSERT INTO equipment (name, model, warnings, description, studio_id)
VALUES ('equipmentSedem', 'equipmentSedemModel', 'equipmentSedemOpomba', 'equipmentSedemdescription', 11);
INSERT INTO equipment (name, model, warnings, description, studio_id)
VALUES ('equipmentOsem', 'equipmentOsemModel', 'OpremOsemaOpomba', 'equipmentOsemdescription', 11);
INSERT INTO equipment (name, model, warnings, description, studio_id)
VALUES ('equipmentDevet', 'equipmentDevetModel', 'equipmentDevetOpomba', 'equipmentDevetdescription', 11);
INSERT INTO equipment (name, model, warnings, description, studio_id)
VALUES ('equipmentEna', 'equipmentModelEna', 'equipmentOpombaEna', 'equipmentdescriptionEna', 1);
INSERT INTO equipment (name, model, warnings, description, studio_id)
VALUES ('equipmentDva', 'equipmentDvaModel', 'equipmentDvaOpomba', 'equipmentDvadescription', 1);
INSERT INTO equipment (name, model, warnings, description, studio_id)
VALUES ('equipmentTri', 'equipmentTriModel', 'equipmentTriOpomba', 'equipmentTridescription', 1);
INSERT INTO equipment (name, model, warnings, description, studio_id)
VALUES ('equipmentStiri', 'equipmentStiriModel', 'equipmentStiriOpomba', 'equipmentStiridescription', 1);
INSERT INTO equipment (name, model, warnings, description, studio_id)
VALUES ('equipmentPet', 'equipmentPetModel', 'equipmentPetOpomba', 'equipmentPetdescription', 1);
INSERT INTO equipment (name, model, warnings, description, studio_id)
VALUES ('equipmentSest', 'equipmentSestModel', 'equipmentSestOpomba', 'equipmentSestdescription', 1);
INSERT INTO equipment (name, model, warnings, description, studio_id)
VALUES ('equipmentSedem', 'equipmentSedemModel', 'equipmentSedemOpomba', 'equipmentSedemdescription', 1);
INSERT INTO equipment (name, model, warnings, description, studio_id)
VALUES ('equipmentOsem', 'equipmentOsemModel', 'OpremOsemaOpomba', 'equipmentOsemdescription', 1);
INSERT INTO equipment (name, model, warnings, description, studio_id)
VALUES ('equipmentDevet', 'equipmentDevetModel', 'equipmentDevetOpomba', 'equipmentDevetdescription', 1);


INSERT INTO rentals (rental_date, return_date, equipment_id, user_id)
VALUES ('26-4-2021', '26-5-2021', 9, 9);
INSERT INTO rentals (rental_date, return_date, equipment_id, user_id)
VALUES ('26-5-2021', '26-6-2021', 19, 19);
INSERT INTO rentals (rental_date, return_date, equipment_id, user_id)
VALUES ('26-6-2021', '26-7-2021', 29, 29);
INSERT INTO rentals (rental_date, return_date, equipment_id, user_id)
VALUES ('26-7-2021', '26-8-2021', 39, 39);
INSERT INTO rentals (rental_date, return_date, equipment_id, user_id)
VALUES ('26-8-2021', '26-9-2021', 49, 49);
INSERT INTO rentals (rental_date, return_date, equipment_id, user_id)
VALUES ('26-9-2021', '26-10-2021', 59, 59);
INSERT INTO rentals (rental_date, return_date, equipment_id, user_id)
VALUES ('26-10-2021', '26-11-2021', 69, 69);
INSERT INTO rentals (rental_date, return_date, equipment_id, user_id)
VALUES ('26-11-2021', '26-12-2021', 79, 79);
INSERT INTO rentals (rental_date, return_date, equipment_id, user_id)
VALUES ('26-2-2021', '26-3-2021', 89, 89);
INSERT INTO rentals (rental_date, return_date, equipment_id, user_id)
VALUES ('26-3-2021', '26-4-2021', 99, 99);
INSERT INTO rentals (rental_date, return_date, equipment_id, user_id)
VALUES ('26-03-2021', '26-04-2021', 2, 1);
INSERT INTO rentals (rental_date, return_date, equipment_id, user_id)
VALUES ('26-4-2021', '26-5-2021', 8, 8);
INSERT INTO rentals (rental_date, return_date, equipment_id, user_id)
VALUES ('26-5-2021', '26-6-2021', 18, 18);
INSERT INTO rentals (rental_date, return_date, equipment_id, user_id)
VALUES ('26-6-2021', '26-7-2021', 28, 28);
INSERT INTO rentals (rental_date, return_date, equipment_id, user_id)
VALUES ('26-7-2021', '26-8-2021', 38, 38);
INSERT INTO rentals (rental_date, return_date, equipment_id, user_id)
VALUES ('26-8-2021', '26-8-2021', 48, 48);
INSERT INTO rentals (rental_date, return_date, equipment_id, user_id)
VALUES ('26-8-2021', '26-10-2021', 58, 58);
INSERT INTO rentals (rental_date, return_date, equipment_id, user_id)
VALUES ('26-10-2021', '26-11-2021', 68, 68);
INSERT INTO rentals (rental_date, return_date, equipment_id, user_id)
VALUES ('26-11-2021', '26-12-2021', 78, 78);
INSERT INTO rentals (rental_date, return_date, equipment_id, user_id)
VALUES ('26-2-2021', '26-3-2021', 88, 88);