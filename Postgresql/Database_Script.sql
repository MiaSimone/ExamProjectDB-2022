CREATE TABLE IF NOT EXISTS roles(
   role_id serial PRIMARY KEY NOT NULL,
   role varchar(10) NOT NULL
);

CREATE TABLE IF NOT EXISTS cities(
   zipcode serial PRIMARY KEY NOT NULL,
   city varchar(75) NOT NULL
);

CREATE TABLE IF NOT EXISTS address(
   address_id serial PRIMARY KEY NOT NULL,
   address varchar(200) NOT NULL,
   zipcode int NOT NULL,
   CONSTRAINT address_fk
      FOREIGN KEY(zipcode) 
	  REFERENCES cities(zipcode)
);

CREATE TABLE IF NOT EXISTS users(
   user_id serial PRIMARY KEY NOT NULL,
   firstName varchar(25) NOT NULL,
   lastName varchar(25) NOT NULL,
   age int NOT NULL,
   email varchar(40) NOT NULL,
   address_id int NOT NULL,
   role_id int NOT NULL,
   CONSTRAINT users_fk_address
      FOREIGN KEY(address_id) 
	  REFERENCES address(address_id),
	CONSTRAINT users_fk_role
      FOREIGN KEY(role_id) 
	  REFERENCES roles(role_id),
);

INSERT INTO public.roles ("role") VALUES
	 ('admin'),
	 ('user');

INSERT INTO public.cities (zipcode,city) VALUES
	 (1301,'København K'),
	 (2000,'Frederiksberg'),
	 (2100,'København Ø'),
	 (2200,'København N'),
	 (2300,'København S'),
	 (2400,'København NV'),
	 (2450,'København SV'),
	 (2500,'Valby'),
	 (2600,'Glostrup'),
	 (2605,'Brøndby');
INSERT INTO public.cities (zipcode,city) VALUES
	 (2610,'Rødovre'),
	 (2625,'Vallensbæk'),
	 (2630,'Taastrup'),
	 (2635,'Ishøj'),
	 (2640,'Hedehusene'),
	 (2650,'Hvidovre'),
	 (2660,'Brøndby Strand'),
	 (2665,'Vallensbæk Strand'),
	 (2670,'Greve'),
	 (2680,'Solrød Strand');
INSERT INTO public.cities (zipcode,city) VALUES
	 (2690,'Karlslunde'),
	 (2700,'Brønshøj'),
	 (2720,'Vanløse'),
	 (2730,'Herlev'),
	 (2740,'Skovlunde'),
	 (2750,'Ballerup'),
	 (2760,'Måløv'),
	 (2765,'Smørum'),
	 (2770,'Kastrup'),
	 (2791,'Dragør');
INSERT INTO public.cities (zipcode,city) VALUES
	 (2800,'Kongens Lyngby'),
	 (2820,'Gentofte'),
	 (2830,'Virum'),
	 (2840,'Holte'),
	 (2850,'Nærum'),
	 (2860,'Søborg'),
	 (2880,'Bagsværd'),
	 (2900,'Hellerup'),
	 (2920,'Charlottenlund'),
	 (2930,'Klampenborg');
INSERT INTO public.cities (zipcode,city) VALUES
	 (2942,'Skodsborg'),
	 (2950,'Vedbæk'),
	 (2960,'Rungsted Kyst'),
	 (2970,'Hørsholm'),
	 (2980,'Kokkedal'),
	 (2990,'Nivå'),
	 (3000,'Helsingør'),
	 (3050,'Humlebæk'),
	 (3060,'Espergærde'),
	 (3070,'Snekkersten');
INSERT INTO public.cities (zipcode,city) VALUES
	 (3080,'Tikøb'),
	 (3100,'Hornbæk'),
	 (3120,'Dronningmølle'),
	 (3140,'Ålsgårde'),
	 (3150,'Hellebæk'),
	 (3200,'Helsinge'),
	 (3210,'Vejby'),
	 (3220,'Tisvildeleje'),
	 (3230,'Græsted'),
	 (3250,'Gilleleje');
INSERT INTO public.cities (zipcode,city) VALUES
	 (3300,'Frederiksværk'),
	 (3310,'Ølsted'),
	 (3320,'Skævinge'),
	 (3330,'Gørløse'),
	 (3360,'Liseleje'),
	 (3370,'Melby'),
	 (3390,'Hundested'),
	 (3400,'Hillerød'),
	 (3460,'Birkerød'),
	 (3480,'Fredensborg');
INSERT INTO public.cities (zipcode,city) VALUES
	 (3490,'Kvistgård'),
	 (3500,'Værløse'),
	 (3520,'Farum'),
	 (3540,'Lynge'),
	 (3550,'Slangerup'),
	 (3600,'Frederikssund'),
	 (3630,'Jægerspris'),
	 (3650,'Ølstykke'),
	 (3660,'Stenløse'),
	 (3670,'Veksø Sjælland');
INSERT INTO public.cities (zipcode,city) VALUES
	 (3700,'Rønne'),
	 (3720,'Aakirkeby'),
	 (3730,'Nexø'),
	 (3740,'Svaneke'),
	 (3751,'Østermarie'),
	 (3760,'Gudhjem'),
	 (3770,'Allinge'),
	 (3782,'Klemensker'),
	 (3790,'Hasle'),
	 (4000,'Roskilde');
INSERT INTO public.cities (zipcode,city) VALUES
	 (4040,'Jyllinge'),
	 (4050,'Skibby'),
	 (4060,'Kirke Såby'),
	 (4070,'Kirke Hyllinge'),
	 (4100,'Ringsted'),
	 (4130,'Viby Sjælland'),
	 (4140,'Borup'),
	 (4160,'Herlufmagle'),
	 (4171,'Glumsø'),
	 (4173,'Fjenneslev');
INSERT INTO public.cities (zipcode,city) VALUES
	 (4174,'Jystrup'),
	 (4180,'Sorø'),
	 (4190,'Munke Bjergby'),
	 (4200,'Slagelse'),
	 (4220,'Korsør'),
	 (4230,'Skælskør'),
	 (4241,'Vemmelev'),
	 (4242,'Boeslunde'),
	 (4243,'Rude'),
	 (4250,'Fuglebjerg');
INSERT INTO public.cities (zipcode,city) VALUES
	 (4261,'Dalmose'),
	 (4262,'Sandved'),
	 (4270,'Høng'),
	 (4281,'Gørlev'),
	 (4291,'Ruds Vedby'),
	 (4293,'Dianalund'),
	 (4295,'Stenlille'),
	 (4296,'Nyrup'),
	 (4300,'Holbæk'),
	 (4320,'Lejre');
INSERT INTO public.cities (zipcode,city) VALUES
	 (4330,'Hvalsø'),
	 (4340,'Tølløse'),
	 (4350,'Ugerløse'),
	 (4360,'Kirke Eskilstrup'),
	 (4370,'Store Merløse'),
	 (4390,'Vipperød'),
	 (4400,'Kalundborg'),
	 (4420,'Regstrup'),
	 (4440,'Mørkøv'),
	 (4450,'Jyderup');
INSERT INTO public.cities (zipcode,city) VALUES
	 (4460,'Snertinge'),
	 (4470,'Svebølle'),
	 (4480,'Store Fuglede'),
	 (4490,'Jerslev'),
	 (4500,'Nykøbing Sj'),
	 (4520,'Svinninge'),
	 (4532,'Gislinge'),
	 (4534,'Hørve'),
	 (4540,'Fårevejle'),
	 (4550,'Asnæs');
INSERT INTO public.cities (zipcode,city) VALUES
	 (4560,'Vig'),
	 (4571,'Grevinge'),
	 (4572,'Nørre Asmindrup'),
	 (4573,'Højby'),
	 (4581,'Rørvig'),
	 (4583,'Sjællands Odde'),
	 (4591,'Føllenslev'),
	 (4592,'Sejerø'),
	 (4593,'Eskebjerg'),
	 (4600,'Køge');
INSERT INTO public.cities (zipcode,city) VALUES
	 (4621,'Gadstrup'),
	 (4622,'Havdrup'),
	 (4623,'Lille Skensved'),
	 (4632,'Bjæverskov'),
	 (4640,'Fakse'),
	 (4652,'Hårlev'),
	 (4653,'Karise'),
	 (4654,'Fakse Ladeplads'),
	 (4660,'Store Heddinge'),
	 (4671,'Strøby');
INSERT INTO public.cities (zipcode,city) VALUES
	 (4672,'Klippinge'),
	 (4673,'Rødvig Stevns'),
	 (4681,'Herfølge'),
	 (4682,'Tureby'),
	 (4683,'Rønnede'),
	 (4684,'Holme-Olstrup'),
	 (4690,'Haslev'),
	 (4700,'Næstved'),
	 (4720,'Præstø'),
	 (4733,'Tappernøje');
INSERT INTO public.cities (zipcode,city) VALUES
	 (4735,'Mern'),
	 (4736,'Karrebæksminde'),
	 (4750,'Lundby'),
	 (4760,'Vordingborg'),
	 (4771,'Kalvehave'),
	 (4772,'Langebæk'),
	 (4773,'Stensved'),
	 (4780,'Stege'),
	 (4791,'Borre'),
	 (4792,'Askeby');
INSERT INTO public.cities (zipcode,city) VALUES
	 (4793,'Bogø By'),
	 (4800,'Nykøbing F'),
	 (4840,'Nørre Alslev'),
	 (4850,'Stubbekøbing'),
	 (4862,'Guldborg'),
	 (4863,'Eskilstrup'),
	 (4871,'Horbelev'),
	 (4872,'Idestrup'),
	 (4873,'Væggerløse'),
	 (4874,'Gedser');
INSERT INTO public.cities (zipcode,city) VALUES
	 (4880,'Nysted'),
	 (4891,'Toreby L'),
	 (4892,'Kettinge'),
	 (4894,'Øster Ulslev'),
	 (4895,'Errindlev'),
	 (4900,'Nakskov'),
	 (4912,'Harpelunde'),
	 (4913,'Horslunde'),
	 (4920,'Søllested'),
	 (4930,'Maribo');
INSERT INTO public.cities (zipcode,city) VALUES
	 (4941,'Bandholm'),
	 (4943,'Torrig L'),
	 (4944,'Fejø'),
	 (4951,'Nørreballe'),
	 (4952,'Stokkemarke'),
	 (4953,'Vesterborg'),
	 (4960,'Holeby'),
	 (4970,'Rødby'),
	 (4983,'Dannemare'),
	 (4990,'Sakskøbing');
INSERT INTO public.cities (zipcode,city) VALUES
	 (5000,'Odense C'),
	 (5200,'Odense V'),
	 (5210,'Odense NV'),
	 (5220,'Odense SØ'),
	 (5230,'Odense M'),
	 (5240,'Odense NØ'),
	 (5250,'Odense SV'),
	 (5260,'Odense S'),
	 (5270,'Odense N'),
	 (5290,'Marslev');
INSERT INTO public.cities (zipcode,city) VALUES
	 (5300,'Kerteminde'),
	 (5330,'Munkebo'),
	 (5350,'Rynkeby'),
	 (5370,'Mesinge'),
	 (5380,'Dalby'),
	 (5390,'Martofte'),
	 (5400,'Bogense'),
	 (5450,'Otterup'),
	 (5462,'Morud'),
	 (5463,'Harndrup');
INSERT INTO public.cities (zipcode,city) VALUES
	 (5464,'Brenderup'),
	 (5466,'Asperup'),
	 (5471,'Søndersø'),
	 (5474,'Veflinge'),
	 (5485,'Skamby'),
	 (5491,'Blommenslyst'),
	 (5492,'Vissenbjerg'),
	 (5500,'Middelfart'),
	 (5540,'Ullerslev'),
	 (5550,'Langeskov');
INSERT INTO public.cities (zipcode,city) VALUES
	 (5560,'Aarup'),
	 (5580,'Nørre Aaby'),
	 (5591,'Gelsted'),
	 (5592,'Ejby'),
	 (5600,'Faaborg'),
	 (5610,'Assens'),
	 (5620,'Glamsbjerg'),
	 (5631,'Ebberup'),
	 (5642,'Millinge'),
	 (5672,'Broby');
INSERT INTO public.cities (zipcode,city) VALUES
	 (5683,'Haarby'),
	 (5690,'Tommerup'),
	 (5700,'Svendborg'),
	 (5750,'Ringe'),
	 (5762,'Vester Skerninge'),
	 (5771,'Stenstrup'),
	 (5772,'Kværndrup'),
	 (5792,'Årslev'),
	 (5800,'Nyborg'),
	 (5853,'Ørbæk');
INSERT INTO public.cities (zipcode,city) VALUES
	 (5854,'Gislev'),
	 (5856,'Ryslinge'),
	 (5863,'Ferritslev Fyn'),
	 (5871,'Frørup'),
	 (5874,'Hesselager'),
	 (5881,'Skårup Fyn'),
	 (5882,'Vejstrup'),
	 (5883,'Oure'),
	 (5884,'Gudme'),
	 (5892,'Gudbjerg');
INSERT INTO public.cities (zipcode,city) VALUES
	 (5900,'Rudkøbing'),
	 (5932,'Humble'),
	 (5935,'Bagenkop'),
	 (5953,'Tranekær'),
	 (5960,'Marstal'),
	 (5970,'Ærøskøbing'),
	 (5985,'Søby Ærø'),
	 (6000,'Kolding'),
	 (6040,'Egtved'),
	 (6051,'Almind');
INSERT INTO public.cities (zipcode,city) VALUES
	 (6052,'Viuf'),
	 (6064,'Jordrup'),
	 (6070,'Christiansfeld'),
	 (6091,'Bjert'),
	 (6092,'Sønder Stenderup'),
	 (6093,'Sjølund'),
	 (6094,'Hejls'),
	 (6100,'Haderslev'),
	 (6200,'Aabenraa'),
	 (6230,'Rødekro');
INSERT INTO public.cities (zipcode,city) VALUES
	 (6240,'Løgumkloster'),
	 (6261,'Bredebro'),
	 (6270,'Tønder'),
	 (6280,'Højer'),
	 (6300,'Gråsten'),
	 (6310,'Broager'),
	 (6320,'Egernsund'),
	 (6330,'Padborg'),
	 (6340,'Kruså'),
	 (6360,'Tinglev');
INSERT INTO public.cities (zipcode,city) VALUES
	 (6372,'Bylderup-Bov'),
	 (6392,'Bolderslev'),
	 (6400,'Sønderborg'),
	 (6430,'Nordborg'),
	 (6440,'Augustenborg'),
	 (6470,'Sydals'),
	 (6500,'Vojens'),
	 (6510,'Gram'),
	 (6520,'Toftlund'),
	 (6535,'Branderup J');
INSERT INTO public.cities (zipcode,city) VALUES
	 (6541,'Bevtoft'),
	 (6560,'Sommersted'),
	 (6580,'Vamdrup'),
	 (6600,'Vejen'),
	 (6621,'Gesten'),
	 (6622,'Bække'),
	 (6623,'Vorbasse'),
	 (6630,'Rødding'),
	 (6640,'Lunderskov'),
	 (6650,'Brørup');
INSERT INTO public.cities (zipcode,city) VALUES
	 (6660,'Lintrup'),
	 (6670,'Holsted'),
	 (6682,'Hovborg'),
	 (6683,'Føvling'),
	 (6690,'Gørding'),
	 (6700,'Esbjerg'),
	 (6701,'Esbjerg'),
	 (6705,'Esbjerg Ø'),
	 (6710,'Esbjerg V'),
	 (6715,'Esbjerg N');
INSERT INTO public.cities (zipcode,city) VALUES
	 (6720,'Fanø'),
	 (6731,'Tjæreborg'),
	 (6740,'Bramming'),
	 (6752,'Glejbjerg'),
	 (6760,'Ribe'),
	 (6771,'Gredstedbro'),
	 (6780,'Skærbæk'),
	 (6792,'Rømø'),
	 (6800,'Varde'),
	 (6818,'Årre');
INSERT INTO public.cities (zipcode,city) VALUES
	 (6823,'Ansager'),
	 (6830,'Nørre Nebel'),
	 (6840,'Oksbøl'),
	 (6851,'Janderup'),
	 (6852,'Billum'),
	 (6853,'Vejers Strand'),
	 (6854,'Henne'),
	 (6855,'Outrup'),
	 (6857,'Blåvand'),
	 (6862,'Tistrup');
INSERT INTO public.cities (zipcode,city) VALUES
	 (6870,'Ølgod'),
	 (6880,'Tarm'),
	 (6893,'Hemmet'),
	 (6900,'Skjern'),
	 (6920,'Videbæk'),
	 (6933,'Kibæk'),
	 (6940,'Lem St'),
	 (6950,'Ringkøbing'),
	 (6960,'Hvide Sande'),
	 (6971,'Spjald');
INSERT INTO public.cities (zipcode,city) VALUES
	 (6973,'Ørnhøj'),
	 (6980,'Tim'),
	 (6990,'Ulfborg'),
	 (7000,'Fredericia'),
	 (7080,'Børkop'),
	 (7100,'Vejle'),
	 (7120,'Vejle Øst'),
	 (7130,'Juelsminde'),
	 (7140,'Stouby'),
	 (7150,'Barrit');
INSERT INTO public.cities (zipcode,city) VALUES
	 (7160,'Tørring'),
	 (7171,'Uldum'),
	 (7173,'Vonge'),
	 (7182,'Bredsten'),
	 (7183,'Randbøl'),
	 (7184,'Vandel'),
	 (7190,'Billund'),
	 (7200,'Grindsted'),
	 (7250,'Hejnsvig'),
	 (7260,'Sønder Omme');
INSERT INTO public.cities (zipcode,city) VALUES
	 (7270,'Stakroge'),
	 (7280,'Sønder Felding'),
	 (7300,'Jelling'),
	 (7321,'Gadbjerg'),
	 (7323,'Give'),
	 (7330,'Brande'),
	 (7361,'Ejstrupholm'),
	 (7362,'Hampen'),
	 (7400,'Herning'),
	 (7430,'Ikast');
INSERT INTO public.cities (zipcode,city) VALUES
	 (7441,'Bording'),
	 (7442,'Engesvang'),
	 (7451,'Sunds'),
	 (7470,'Karup J'),
	 (7480,'Vildbjerg'),
	 (7490,'Aulum'),
	 (7500,'Holstebro'),
	 (7540,'Haderup'),
	 (7550,'Sørvad'),
	 (7560,'Hjerm');
INSERT INTO public.cities (zipcode,city) VALUES
	 (7570,'Vemb'),
	 (7600,'Struer'),
	 (7620,'Lemvig'),
	 (7650,'Bøvlingbjerg'),
	 (7660,'Bækmarksbro'),
	 (7673,'Harboøre'),
	 (7680,'Thyborøn'),
	 (7700,'Thisted'),
	 (7730,'Hanstholm'),
	 (7741,'Frøstrup');
INSERT INTO public.cities (zipcode,city) VALUES
	 (7742,'Vesløs'),
	 (7752,'Snedsted'),
	 (7755,'Bedsted Thy'),
	 (7760,'Hurup Thy'),
	 (7770,'Vestervig'),
	 (7790,'Thyholm'),
	 (7800,'Skive'),
	 (7830,'Vinderup'),
	 (7840,'Højslev'),
	 (7850,'Stoholm, Jylland');
INSERT INTO public.cities (zipcode,city) VALUES
	 (7860,'Spøttrup'),
	 (7870,'Roslev'),
	 (7884,'Fur'),
	 (7900,'Nykøbing M'),
	 (7950,'Erslev'),
	 (7960,'Karby'),
	 (7970,'Redsted M'),
	 (7980,'Vils'),
	 (7990,'Øster Assels'),
	 (8000,'Århus C');
INSERT INTO public.cities (zipcode,city) VALUES
	 (8200,'Århus N'),
	 (8210,'Århus V'),
	 (8220,'Brabrand'),
	 (8230,'Åbyhøj'),
	 (8240,'Risskov'),
	 (8250,'Egå'),
	 (8260,'Viby J'),
	 (8270,'Højbjerg'),
	 (8300,'Odder'),
	 (8305,'Samsø');
INSERT INTO public.cities (zipcode,city) VALUES
	 (8310,'Tranbjerg J'),
	 (8320,'Mårslet'),
	 (8330,'Beder'),
	 (8340,'Malling'),
	 (8350,'Hundslund'),
	 (8355,'Solbjerg'),
	 (8361,'Hasselager'),
	 (8362,'Hørning'),
	 (8370,'Hadsten'),
	 (8380,'Trige');
INSERT INTO public.cities (zipcode,city) VALUES
	 (8381,'Tilst'),
	 (8382,'Hinnerup'),
	 (8400,'Ebeltoft'),
	 (8410,'Rønde'),
	 (8420,'Knebel'),
	 (8444,'Balle'),
	 (8450,'Hammel'),
	 (8462,'Harlev J'),
	 (8464,'Galten'),
	 (8471,'Sabro');
INSERT INTO public.cities (zipcode,city) VALUES
	 (8472,'Sporup'),
	 (8500,'Grenaa'),
	 (8520,'Lystrup'),
	 (8530,'Hjortshøj'),
	 (8541,'Skødstrup'),
	 (8543,'Hornslet'),
	 (8544,'Mørke'),
	 (8550,'Ryomgård'),
	 (8560,'Kolind'),
	 (8570,'Trustrup');
INSERT INTO public.cities (zipcode,city) VALUES
	 (8581,'Nimtofte'),
	 (8585,'Glesborg'),
	 (8586,'Ørum Djurs'),
	 (8592,'Anholt'),
	 (8600,'Silkeborg'),
	 (8620,'Kjellerup'),
	 (8632,'Lemming'),
	 (8641,'Sorring'),
	 (8643,'Ans by'),
	 (8653,'Them');
INSERT INTO public.cities (zipcode,city) VALUES
	 (8654,'Bryrup'),
	 (8660,'Skanderborg'),
	 (8670,'Låsby'),
	 (8680,'Ry'),
	 (8700,'Horsens'),
	 (8721,'Daugård'),
	 (8722,'Hedensted'),
	 (8723,'Løsning'),
	 (8732,'Hovedgård'),
	 (8740,'Brædstrup');
INSERT INTO public.cities (zipcode,city) VALUES
	 (8751,'Gedved'),
	 (8752,'Østbirk'),
	 (8762,'Flemming'),
	 (8763,'Rask Mølle'),
	 (8765,' Klovborg'),
	 (8766,'Nørre Snede'),
	 (8781,'Stenderup'),
	 (8783,'Hornsyld'),
	 (8800,'Viborg'),
	 (8830,'Tjele');
INSERT INTO public.cities (zipcode,city) VALUES
	 (8831,'Løgstrup'),
	 (8832,'Skals'),
	 (8840,'Rødkærsbro'),
	 (8850,'Bjerringbro'),
	 (8860,'Ulstrup'),
	 (8870,'Langå'),
	 (8881,'Thorsø'),
	 (8882,'Fårvang'),
	 (8883,'Gjern'),
	 (8900,'Randers');
INSERT INTO public.cities (zipcode,city) VALUES
	 (8950,'Ørsted'),
	 (8961,'Allingåbro'),
	 (8963,'Auning'),
	 (8970,'Havndal'),
	 (8981,'Spenstrup'),
	 (8983,'Gjerlev J'),
	 (8990,'Fårup'),
	 (9000,'Aalborg'),
	 (9200,'Aalborg SV'),
	 (9210,'Aalborg SØ');
INSERT INTO public.cities (zipcode,city) VALUES
	 (9220,'Aalborg Øst'),
	 (9230,'Svenstrup J'),
	 (9240,'Nibe'),
	 (9260,'Gistrup'),
	 (9270,'Klarup'),
	 (9280,'Storvorde'),
	 (9293,'Kongerslev'),
	 (9300,'Sæby'),
	 (9310,'Vodskov'),
	 (9320,'Hjallerup');
INSERT INTO public.cities (zipcode,city) VALUES
	 (9330,'Dronninglund'),
	 (9340,'Asaa'),
	 (9352,'Dybvad'),
	 (9362,'Gandrup'),
	 (9370,'Hals'),
	 (9380,'Vestbjerg'),
	 (9381,'Sulsted'),
	 (9382,'Tylstrup'),
	 (9400,'Nørresundby'),
	 (9430,'Vadum');
INSERT INTO public.cities (zipcode,city) VALUES
	 (9440,'Aabybro'),
	 (9460,'Brovst'),
	 (9480,'Løkken'),
	 (9490,'Pandrup'),
	 (9492,'Blokhus'),
	 (9493,'Saltum'),
	 (9500,'Hobro'),
	 (9510,'Arden'),
	 (9520,'Skørping'),
	 (9530,'Støvring');
INSERT INTO public.cities (zipcode,city) VALUES
	 (9541,'Suldrup'),
	 (9550,'Mariager'),
	 (9560,'Hadsund'),
	 (9574,'Bælum'),
	 (9575,'Terndrup'),
	 (9600,'Aars'),
	 (9610,'Nørager'),
	 (9620,'Aalestrup'),
	 (9631,'Gedsted'),
	 (9632,'Møldrup');
INSERT INTO public.cities (zipcode,city) VALUES
	 (9640,'Farsø'),
	 (9670,'Løgstør'),
	 (9681,'Ranum'),
	 (9690,'Fjerritslev'),
	 (9700,'Brønderslev'),
	 (9740,'Jerslev J'),
	 (9750,'Øster Vrå'),
	 (9760,'Vrå'),
	 (9800,'Hjørring'),
	 (9830,'Tårs');
INSERT INTO public.cities (zipcode,city) VALUES
	 (9850,'Hirtshals'),
	 (9870,'Sindal'),
	 (9881,'Bindslev'),
	 (9900,'Frederikshavn'),
	 (9940,'Læsø'),
	 (9970,'Strandby'),
	 (9981,'Jerup'),
	 (9982,'Ålbæk'),
	 (9990,'Skagen');


INSERT INTO public.address (address,zipcode) VALUES
	 ('Svinget 80',4735),
	 ('Klintevej 80',2000),
	 ('Blæsenborgvej 26',2100),
	 ('Albanivej 57',4573),
	 ('Sønderstræde 88',2450),
	 ('Frørupvej 53',1301),
	 ('Kongshøj Allé 65',4220),
	 ('Østervoldgade 42',2000),
	 ('Degnehøjvej 86',4230),
	 ('Christianslundsvej 30',8883);
INSERT INTO public.address (address,zipcode) VALUES
	 ('Sibiriensvej 11',6792),
	 ('Skolegade 23',2400),
	 ('Nørremarksvej 67',2400),
	 ('Mikkelenborgvej 25',1301),
	 ('Lumbyholmvej 38',3050),
	 ('Nørrebrovænget 10',1301),
	 ('Slipager 78',1301),
	 ('Grønvangen 87',2720),
	 ('Kongshøjvej 99',1301),
	 ('Nørrebrovænget 65',1301);


INSERT INTO public.users (firstname,lastname,age,email,address_id,role_id) VALUES
	 ('Belinda','Foster',44,'b.foster@randatmail.com',9,2),
	 ('Emma','Murray',42,'e.murray@randatmail.com',19,2),
	 ('Antony','Wright',45,'a.wright@randatmail.com',19,2),
	 ('Belinda','Riley',45,'b.riley@randatmail.com',5,2),
	 ('Aida','Farrell',48,'a.farrell@randatmail.com',4,2),
	 ('Oliver','Montgomery',50,'o.montgomery@randatmail.com',7,2),
	 ('Henry','Davis',41,'h.davis@randatmail.com',6,2),
	 ('Honey','Anderson',48,'h.anderson@randatmail.com',2,2),
	 ('Lana','Kelley',50,'l.kelley@randatmail.com',3,2),
	 ('Kate','Elliott',40,'k.elliott@randatmail.com',11,2);
INSERT INTO public.users (firstname,lastname,age,email,address_id,role_id) VALUES
	 ('Abigail','Robinson',45,'a.robinson@randatmail.com',3,2),
	 ('Vivian','Wells',44,'v.wells@randatmail.com',5,2),
	 ('Jacob','Barnes',40,'j.barnes@randatmail.com',20,2),
	 ('Maximilian','Holmes',48,'m.holmes@randatmail.com',11,2),
	 ('Ryan','Martin',41,'r.martin@randatmail.com',3,2),
	 ('Tara','Harper',42,'t.harper@randatmail.com',1,2),
	 ('Frederick','Campbell',44,'f.campbell@randatmail.com',16,2),
	 ('Eric','Smith',48,'e.smith@randatmail.com',2,2),
	 ('Tony','Wells',45,'t.wells@randatmail.com',13,2),
	 ('Agata','Hunt',47,'a.hunt@randatmail.com',20,2);
INSERT INTO public.users (firstname,lastname,age,email,address_id,role_id) VALUES
	 ('Justin','Thomas',19,'j.thomas@randatmail.com',20,2),
	 ('Derek','Johnson',24,'d.johnson@randatmail.com',8,2),
	 ('Maya','Campbell',20,'m.campbell@randatmail.com',13,2),
	 ('Alisa','Mason',20,'a.mason@randatmail.com',7,2),
	 ('Oliver','Warren',29,'o.warren@randatmail.com',3,2),
	 ('Carlos','Bennett',24,'c.bennett@randatmail.com',19,2),
	 ('Melissa','Lloyd',26,'m.lloyd@randatmail.com',18,2),
	 ('Melissa','Miller',20,'m.miller@randatmail.com',6,2),
	 ('Thomas','Barrett',25,'t.barrett@randatmail.com',20,2),
	 ('Paige','Mason',30,'p.mason@randatmail.com',11,2);
INSERT INTO public.users (firstname,lastname,age,email,address_id,role_id) VALUES
	 ('Chloe','Payne',21,'c.payne@randatmail.com',20,2),
	 ('Sawyer','Hawkins',30,'s.hawkins@randatmail.com',19,2),
	 ('Miller','Taylor',28,'m.taylor@randatmail.com',1,2),
	 ('Owen','Payne',20,'o.payne@randatmail.com',19,2),
	 ('Jasmine','Parker',21,'j.parker@randatmail.com',15,2),
	 ('Belinda','Turner',25,'b.turner@randatmail.com',8,2),
	 ('Edwin','Myers',26,'e.myers@randatmail.com',4,2),
	 ('Ada','Richards',18,'a.richards@randatmail.com',2,2),
	 ('Briony','Kelley',23,'b.kelley@randatmail.com',5,2),
	 ('Maddie','Bennett',30,'m.bennett@randatmail.com',9,2);
INSERT INTO public.users (firstname,lastname,age,email,address_id,role_id) VALUES
	 ('Emily','Cameron',22,'e.cameron@randatmail.com',15,2),
	 ('Michelle','Foster',30,'m.foster@randatmail.com',14,2),
	 ('Penelope','Myers',18,'p.myers@randatmail.com',3,2),
	 ('Elian','Alexander',26,'e.alexander@randatmail.com',6,2),
	 ('Sydney','Grant',22,'s.grant@randatmail.com',20,2),
	 ('Anna','Allen',27,'a.allen@randatmail.com',16,2),
	 ('Eddy','Stevens',25,'e.stevens@randatmail.com',19,2),
	 ('Jacob','Craig',19,'j.craig@randatmail.com',5,2),
	 ('Antony','Cooper',26,'a.cooper@randatmail.com',15,2),
	 ('Evelyn','Smith',26,'e.smith@randatmail.com',14,2);
INSERT INTO public.users (firstname,lastname,age,email,address_id,role_id) VALUES
	 ('Garry','Watson',23,'g.watson@randatmail.com',10,2),
	 ('Cadie','Sullivan',23,'c.sullivan@randatmail.com',15,2),
	 ('Sofia','Cole',21,'s.cole@randatmail.com',11,2),
	 ('Melissa','Bennett',22,'m.bennett@randatmail.com',15,2),
	 ('Florrie','Bennett',20,'f.bennett@randatmail.com',15,2),
	 ('Leonardo','Parker',28,'l.parker@randatmail.com',16,2),
	 ('Melissa','Casey',26,'m.casey@randatmail.com',9,2),
	 ('Jordan','Sullivan',25,'j.sullivan@randatmail.com',15,2),
	 ('Kevin','Gray',21,'k.gray@randatmail.com',18,2),
	 ('Connie','Alexander',18,'c.alexander@randatmail.com',20,2);
INSERT INTO public.users (firstname,lastname,age,email,address_id,role_id) VALUES
	 ('Preston','Smith',29,'p.smith@randatmail.com',12,2),
	 ('Ryan','Kelly',22,'r.kelly@randatmail.com',11,2),
	 ('Sofia','Myers',18,'s.myers@randatmail.com',11,2),
	 ('Kate','Cole',18,'k.cole@randatmail.com',2,2),
	 ('Jasmine','Miller',22,'j.miller@randatmail.com',1,2),
	 ('Garry','Tucker',29,'g.tucker@randatmail.com',9,2),
	 ('Cadie','Ellis',26,'c.ellis@randatmail.com',20,2),
	 ('Jenna','Wells',26,'j.wells@randatmail.com',11,2),
	 ('Jenna','Scott',27,'j.scott@randatmail.com',14,2),
	 ('Maria','Cameron',22,'m.cameron@randatmail.com',8,2);
INSERT INTO public.users (firstname,lastname,age,email,address_id,role_id) VALUES
	 ('Jacob','Hunt',23,'j.hunt@randatmail.com',14,2),
	 ('Oscar','Lloyd',20,'o.lloyd@randatmail.com',20,2),
	 ('Sienna','Reed',28,'s.reed@randatmail.com',16,2),
	 ('Chester','Hill',29,'c.hill@randatmail.com',12,2),
	 ('Alisa','Grant',25,'a.grant@randatmail.com',18,2),
	 ('Harold','Williams',26,'h.williams@randatmail.com',13,2),
	 ('Abigail','Bennett',25,'a.bennett@randatmail.com',14,2),
	 ('James','Kelly',22,'j.kelly@randatmail.com',3,2),
	 ('Alfred','Perkins',26,'a.perkins@randatmail.com',6,2),
	 ('Dainton','Ryan',28,'d.ryan@randatmail.com',5,2);
INSERT INTO public.users (firstname,lastname,age,email,address_id,role_id) VALUES
	 ('Victor','Barnes',22,'v.barnes@randatmail.com',12,2),
	 ('Leonardo','Sullivan',21,'l.sullivan@randatmail.com',10,2),
	 ('Kirsten','Perkins',18,'k.perkins@randatmail.com',14,2),
	 ('John','Chapman',27,'j.chapman@randatmail.com',18,2),
	 ('Isabella','Carter',29,'i.carter@randatmail.com',15,2),
	 ('Connie','Thomas',26,'c.thomas@randatmail.com',11,2),
	 ('Alfred','Mitchell',21,'a.mitchell@randatmail.com',19,2),
	 ('Nicholas','Hill',20,'n.hill@randatmail.com',12,2),
	 ('Brooke','Morris',30,'b.morris@randatmail.com',20,2),
	 ('Kellan','Harper',24,'k.harper@randatmail.com',17,2);
INSERT INTO public.users (firstname,lastname,age,email,address_id,role_id) VALUES
	 ('Julia','Ferguson',23,'j.ferguson@randatmail.com',1,2),
	 ('Derek','Murphy',24,'d.murphy@randatmail.com',5,2),
	 ('Tess','Kelley',22,'t.kelley@randatmail.com',8,2),
	 ('Alisa','Parker',27,'a.parker@randatmail.com',17,2),
	 ('Vivian','Mitchell',19,'v.mitchell@randatmail.com',19,2),
	 ('Albert','Murphy',23,'a.murphy@randatmail.com',13,2),
	 ('Eddy','Owens',26,'e.owens@randatmail.com',14,2),
	 ('Chester','Spencer',25,'c.spencer@randatmail.com',8,2),
	 ('Isabella','Harrison',22,'i.harrison@randatmail.com',11,2),
	 ('James','Parker',21,'j.parker@randatmail.com',10,2);
INSERT INTO public.users (firstname,lastname,age,email,address_id,role_id) VALUES
	 ('Alexia','Murphy',27,'a.murphy@randatmail.com',18,2),
	 ('Miller','Riley',18,'m.riley@randatmail.com',17,2),
	 ('Albert','Anderson',30,'a.anderson@randatmail.com',19,2),
	 ('Natalie','Kelley',26,'n.kelley@randatmail.com',7,2),
	 ('Jessica','Hawkins',26,'j.hawkins@randatmail.com',3,2),
	 ('Jessica','Wells',29,'j.wells@randatmail.com',3,2),
	 ('Miley','Johnston',28,'m.johnston@randatmail.com',17,2),
	 ('Tony','Myers',18,'t.myers@randatmail.com',4,2),
	 ('Marcus','Montgomery',26,'m.montgomery@randatmail.com',12,2),
	 ('James','Jones',24,'j.jones@randatmail.com',9,2);
INSERT INTO public.users (firstname,lastname,age,email,address_id,role_id) VALUES
	 ('James','Cole',26,'j.cole@randatmail.com',4,2),
	 ('Carlos','Barnes',30,'c.barnes@randatmail.com',11,2),
	 ('Amber','Thomas',29,'a.thomas@randatmail.com',8,2),
	 ('Kelsey','Spencer',29,'k.spencer@randatmail.com',9,2),
	 ('Vivian','Cameron',25,'v.cameron@randatmail.com',9,2),
	 ('Tiana','Smith',26,'t.smith@randatmail.com',8,2),
	 ('Arthur','Lloyd',27,'a.lloyd@randatmail.com',11,2),
	 ('Myra','Reed',18,'m.reed@randatmail.com',15,2),
	 ('Lyndon','Baker',21,'l.baker@randatmail.com',7,2),
	 ('Elian','Cameron',30,'e.cameron@randatmail.com',10,2);
INSERT INTO public.users (firstname,lastname,age,email,address_id,role_id) VALUES
	 ('Violet','Cooper',30,'v.cooper@randatmail.com',16,2),
	 ('Owen','Nelson',30,'o.nelson@randatmail.com',18,2),
	 ('Valeria','Stevens',25,'v.stevens@randatmail.com',12,2),
	 ('Tony','Wilson',27,'t.wilson@randatmail.com',14,2),
	 ('Madaline','Crawford',24,'m.crawford@randatmail.com',12,2),
	 ('Walter','Morris',18,'w.morris@randatmail.com',13,2),
	 ('Lily','Henderson',20,'l.henderson@randatmail.com',15,2),
	 ('Dominik','Mason',30,'d.mason@randatmail.com',13,2),
	 ('Charlie','Campbell',25,'c.campbell@randatmail.com',16,2),
	 ('Eric','Montgomery',20,'e.montgomery@randatmail.com',7,2);
INSERT INTO public.users (firstname,lastname,age,email,address_id,role_id) VALUES
	 ('Sarah','Kelley',24,'s.kelley@randatmail.com',8,2),
	 ('Annabella','Bailey',29,'a.bailey@randatmail.com',13,2),
	 ('Daryl','Hawkins',28,'d.hawkins@randatmail.com',3,2),
	 ('Carina','Gibson',22,'c.gibson@randatmail.com',6,2),
	 ('Joyce','Nelson',20,'j.nelson@randatmail.com',9,2),
	 ('Jack','Edwards',28,'j.edwards@randatmail.com',14,2),
	 ('Chester','Lloyd',19,'c.lloyd@randatmail.com',11,2),
	 ('Eleanor','Cunningham',21,'e.cunningham@randatmail.com',13,2),
	 ('Tiana','Ross',27,'t.ross@randatmail.com',15,2),
	 ('Cherry','Riley',19,'c.riley@randatmail.com',3,2);
INSERT INTO public.users (firstname,lastname,age,email,address_id,role_id) VALUES
	 ('Stella','Anderson',26,'s.anderson@randatmail.com',16,2),
	 ('Luke','Perkins',30,'l.perkins@randatmail.com',4,2),
	 ('Melissa','Hall',21,'m.hall@randatmail.com',20,2),
	 ('Ted','Alexander',24,'t.alexander@randatmail.com',19,2),
	 ('Adrianna','Miller',21,'a.miller@randatmail.com',7,2),
	 ('Vivian','Martin',20,'v.martin@randatmail.com',6,2),
	 ('Andrew','Taylor',21,'a.taylor@randatmail.com',1,2),
	 ('Kristian','Martin',23,'k.martin@randatmail.com',4,2),
	 ('Michelle','Perry',18,'m.perry@randatmail.com',20,2),
	 ('John','Wilson',28,'j.wilson@randatmail.com',4,2);
INSERT INTO public.users (firstname,lastname,age,email,address_id,role_id) VALUES
	 ('Lilianna','Wilson',30,'l.wilson@randatmail.com',10,2),
	 ('Edith','Scott',19,'e.scott@randatmail.com',11,2),
	 ('Daryl','Wilson',28,'d.wilson@randatmail.com',5,2),
	 ('Mike','Farrell',20,'m.farrell@randatmail.com',18,2),
	 ('Brianna','Richardson',25,'b.richardson@randatmail.com',11,2),
	 ('Alfred','Harper',30,'a.harper@randatmail.com',2,2),
	 ('Antony','Grant',27,'a.grant@randatmail.com',1,2),
	 ('Carina','Warren',29,'c.warren@randatmail.com',1,2),
	 ('Cherry','Mason',20,'c.mason@randatmail.com',3,2),
	 ('James','Fowler',22,'j.fowler@randatmail.com',9,2);
INSERT INTO public.users (firstname,lastname,age,email,address_id,role_id) VALUES
	 ('Reid','Ellis',28,'r.ellis@randatmail.com',7,2),
	 ('Dainton','Armstrong',19,'d.armstrong@randatmail.com',8,2),
	 ('Gianna','Farrell',26,'g.farrell@randatmail.com',15,2),
	 ('Lydia','Adams',18,'l.adams@randatmail.com',2,2),
	 ('Adrian','Craig',23,'a.craig@randatmail.com',3,2),
	 ('Carina','Henderson',28,'c.henderson@randatmail.com',2,2),
	 ('Brianna','Kelley',20,'b.kelley@randatmail.com',2,2),
	 ('Sarah','Barrett',30,'s.barrett@randatmail.com',6,2),
	 ('Anna','Johnson',29,'a.johnson@randatmail.com',19,2),
	 ('Cadie','Hall',29,'c.hall@randatmail.com',17,2);
INSERT INTO public.users (firstname,lastname,age,email,address_id,role_id) VALUES
	 ('Briony','Morris',18,'b.morris@randatmail.com',9,2),
	 ('Elise','Martin',23,'e.martin@randatmail.com',9,2),
	 ('Walter','Payne',26,'w.payne@randatmail.com',17,2),
	 ('Sofia','Evans',19,'s.evans@randatmail.com',2,2),
	 ('Henry','Roberts',28,'h.roberts@randatmail.com',3,2),
	 ('David','Brooks',20,'d.brooks@randatmail.com',16,2),
	 ('Wilson','Harris',22,'w.harris@randatmail.com',15,2),
	 ('Sophia','Stevens',18,'s.stevens@randatmail.com',15,2),
	 ('Dominik','Howard',28,'d.howard@randatmail.com',17,2),
	 ('Tyler','Casey',27,'t.casey@randatmail.com',2,2);
INSERT INTO public.users (firstname,lastname,age,email,address_id,role_id) VALUES
	 ('Byron','Warren',29,'b.warren@randatmail.com',12,2),
	 ('Chelsea','Barrett',20,'c.barrett@randatmail.com',20,2),
	 ('Ashton','Cooper',30,'a.cooper@randatmail.com',9,2),
	 ('Aiden','Myers',25,'a.myers@randatmail.com',20,2),
	 ('Owen','Williams',18,'o.williams@randatmail.com',10,2),
	 ('Oliver','Ross',25,'o.ross@randatmail.com',20,2),
	 ('Aston','Murphy',24,'a.murphy@randatmail.com',7,2),
	 ('Brianna','Cameron',20,'b.cameron@randatmail.com',2,2),
	 ('Eric','Stevens',21,'e.stevens@randatmail.com',2,2),
	 ('Carl','Murphy',30,'c.murphy@randatmail.com',11,2);
INSERT INTO public.users (firstname,lastname,age,email,address_id,role_id) VALUES
	 ('James','Perkins',30,'j.perkins@randatmail.com',6,2),
	 ('Freddie','Murray',26,'f.murray@randatmail.com',6,2),
	 ('Lydia','Wilson',28,'l.wilson@randatmail.com',11,2),
	 ('Belinda','Jones',23,'b.jones@randatmail.com',12,2),
	 ('Penelope','Morris',22,'p.morris@randatmail.com',10,2),
	 ('Maria','Wells',29,'m.wells@randatmail.com',1,2),
	 ('Ada','Dixon',28,'a.dixon@randatmail.com',11,2),
	 ('Connie','Hunt',27,'c.hunt@randatmail.com',5,2),
	 ('Arnold','Warren',20,'a.warren@randatmail.com',12,2),
	 ('Kellan','Moore',22,'k.moore@randatmail.com',16,2);
INSERT INTO public.users (firstname,lastname,age,email,address_id,role_id) VALUES
	 ('Grace','Owens',21,'g.owens@randatmail.com',5,2),
	 ('Aida','Carter',24,'a.carter@randatmail.com',1,2),
	 ('Dale','Ellis',22,'d.ellis@randatmail.com',9,2),
	 ('Henry','Campbell',29,'h.campbell@randatmail.com',14,2),
	 ('Maximilian','Reed',22,'m.reed@randatmail.com',13,2),
	 ('Andrew','Reed',20,'a.reed@randatmail.com',17,2),
	 ('Savana','Barnes',28,'s.barnes@randatmail.com',4,2),
	 ('Robert','Ellis',29,'r.ellis@randatmail.com',5,2),
	 ('Albert','Edwards',26,'a.edwards@randatmail.com',14,2),
	 ('Agata','Dixon',29,'a.dixon@randatmail.com',17,2);
INSERT INTO public.users (firstname,lastname,age,email,address_id,role_id) VALUES
	 ('Alford','Allen',28,'a.allen@randatmail.com',5,2),
	 ('Aiden','Hamilton',29,'a.hamilton@randatmail.com',6,2),
	 ('Steven','Hill',18,'s.hill@randatmail.com',8,2),
	 ('Heather','Howard',29,'h.howard@randatmail.com',5,2),
	 ('Ned','Turner',30,'n.turner@randatmail.com',9,2),
	 ('Sabrina','Stevens',30,'s.stevens@randatmail.com',16,2),
	 ('Emma','Harris',28,'e.harris@randatmail.com',7,2),
	 ('Elian','Hunt',28,'e.hunt@randatmail.com',20,2),
	 ('Alberta','Brown',21,'a.brown@randatmail.com',6,2),
	 ('Rafael','Barrett',23,'r.barrett@randatmail.com',4,2);

