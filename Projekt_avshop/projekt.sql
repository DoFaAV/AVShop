DROP DATABASE if EXISTS avshop;
CREATE DATABASE if NOT EXISTS avshop;
USE avshop;

CREATE TABLE if NOT exists Kategorie (
  katID int(255) NOT NULL,
  katname varchar(123) NOT NULL,
  katbeschr varchar(255) NOT NULL,
  katbild varchar(255) NOT NULL,
  PRIMARY KEY (katID)
  );

INSERT INTO Kategorie (katID, katname, katbeschr, katbild) VALUES
	(1, 'Grafikkarten', 'blablabla', 'bild'),
	(2,'Mainboards','',''),
	(3,'Netzteile','',''),  
	(4,'Prozessoren','',''),  
	(5,'Arbeitsspeicher','',''),
	(6,'Festplatten','',''),      
	(7,'Soundkarten','',''), 
	(8,'Gehäuse','','');     
#----------------------------------------------------------

CREATE TABLE if NOT exists Ortsname (
  laufende_NR int(255) NOT NULL,
  ortsbez VARCHAR(255) NOT NULL,
  PRIMARY KEY (laufende_NR)
  
  );

/*INSERT ist in einer anderen Datei*/



#----------------------------------------------------------

CREATE TABLE if NOT exists Ort (
  plz int(255) NOT NULL,
  laufende_NR int(255) NOT NULL,
  PRIMARY KEY (plz),
  FOREIGN KEY (laufende_NR) REFERENCES Ortsname(laufende_NR)
  
  );

/*INSERT ist in einer anderen Datei*/



#----------------------------------------------------------

CREATE TABLE if NOT exists Lieferant (
  liefID int(255) NOT NULL,
  liefname varchar(123) NOT NULL,
  liefbild varchar(255) NOT NULL,
  PRIMARY KEY (liefID)
  );

INSERT INTO Lieferant (liefID, liefname, liefbild) VALUES
	(1, 'DHL', '.png'),
	(2, 'Hermes', ''),
	(3, 'DPD', '');
	
#----------------------------------------------------------

CREATE TABLE if NOT exists Hersteller (
  herstID int(255) NOT NULL,
  herstname varchar(123) NOT NULL,
  herstbeschr varchar(255) NOT NULL,
  herstlogo varchar(255) NOT NULL,
  PRIMARY KEY (herstID)
  );

INSERT INTO Hersteller (herstID, herstname, herstbeschr, herstlogo) VALUES
	(1, 'ASUS', 'blalbal', '.pnnggg'),
	(2, 'Crucial','asd', 'd'),
	(3, 'CORSAIR','asd','d'),
	(4, 'MSI', 'asd', 'd'),
	(5, 'GIGABYTE', 'asd', 'd'),
	(6, 'BE QUIET', 'asd', 'd'),
	(7, 'AMD', 'asd', 'asd'),
	(8, 'INTEL', 'as', 'd'),
	(9, 'WD', 'd', 'd'),
	(10, 'COOLER MASTER', 'd', 'd'),
	(11, 'CREATIVE', 'd', 'd');
#----------------------------------------------------------

CREATE TABLE if NOT EXISTS Bank (
  bic varchar(255) NOT NULL,               -- pk verfeinern
  bankname varchar(123) NOT NULL,
  PRIMARY KEY (bic)
  );

/*INSERT ist in einer anderen Datei*/


#----------------------------------------------------------

CREATE TABLE if NOT exists Aktionscode (
  codenr int(255) NOT NULL,
  rabatt DECIMAL(65) NOT NULL,
  PRIMARY KEY (codenr)
  );
  
INSERT INTO Aktionscode (codenr, rabatt) VALUES
	(101225874, 0.2);

#----------------------------------------------------------

CREATE TABLE if NOT exists Kunde (
  knr int(255) NOT NULL,
  vname varchar(123) NOT NULL,
  nachname varchar(255) NOT NULL,
  passwort varchar(255) NOT NULL,
  email varchar(255) NOT NULL,
  anrede varchar(255) NOT NULL,
  strasse varchar(255) NOT NULL,
  plz int(255) NOT NULL,
  PRIMARY KEY (knr),
  FOREIGN KEY (plz) REFERENCES Ort(plz)
  );
 
  
#----------------------------------------------------------

CREATE TABLE if NOT exists Produkt (
  prodID int(255) NOT NULL,
  prodname varchar(123) NOT NULL,
  preis varchar(255) NOT NULL,
  bestand varchar(255) NOT NULL,
  prodbeschr varchar(255) NOT NULL,
  brodbild varchar(255) NOT NULL,
  katID int(255) NOT NULL,
  herstID int(255) NOT NULL,
  PRIMARY KEY (prodID),
  FOREIGN KEY (katID) REFERENCES Kategorie(katID),
  FOREIGN KEY (herstID) REFERENCES Hersteller(herstID)
  );
  
INSERT INTO Produkt (prodID, prodname, preis, bestand, prodbeschr, brodbild, katID, herstID) VALUES
	(1, 'CRUCIAL CT16G4SFD8266 Arbeitsspeicher 16 GB DDR4', 66.63, 7, '', '', 5, 2),
	(2, 'CORSAIR Vengeance RGB PRO Arbeitsspeicher 16 GB DDR4', 144.85, 7, '', '', 5, 3),
	(3, 'CORSAIR Value Select PC Arbeitsspeicher 8 GB DDR4', 46.90, 7, '', '', 5, 3),
	(4, 'ASUS Radeon RX 580 Dual 8GB OC (90YV0AQ1-M0NA00) (AMD, Grafikkarte)', 184.99, 7, '', '', 1, 1),
	(5, 'ASUS GeForce® RTX 2070 SUPER™ Dual Evo OC 8GB (90YV0DK0-M0NA00) (NVIDIA, Grafikkarte)', 539, 7, '', '', 1, 1),
	(6, 'MSI GeForce® RTX 2070 SUPER™ Gaming X Trio 8GB (V372-257R) (NVIDIA, Grafikkarte)', 609, 7, '', '', 1, 4),
	(7, 'MSI B450 Gaming Plus Max Mainboard', 119.99, 7, '', '', 2, 4),
	(8, 'ASUS ROG Strix X570 E Gaming Mainboard', 359, 7, '', '', 2, 1),
	(9, 'GIGABYTE B450M DS3H Mainboard', 88.25, 7, '', '', 2, 5),
	(10, 'CORSAIR VS650 2018 Netzteile', 59.99, 7, '', '', 3, 3),
	(11, 'BE QUIET BN299 PURE POWER 11 700W CM PC-Netzteil', 99.99, 7, '', '', 3, 6),
	(12, 'BE QUIET Dark Power PRO 11 Netzteil', 143.99, 7, '', '', 3, 6),
	(13, 'INTEL Core™ i7-9700K Prozessor', 419, 7, '', '', 4, 8),
	(14, 'AMD 63WOF RYZEN THREADRIPPER 3990X (100-100000163WOF) Prozessor', 4049, 7, '', '', 4, 7),
	(15, 'INTEL Core™ i9-9900K Prozessor', 535, 7, '', '', 4, 8),
	(16, 'WD Blue™ BULK, 1 TB, HDD, 3,5 Zoll, intern', 50.15, 7, '', '', 6, 9),
	(17, 'WD Purple™ interne Festplatte 4 TB, BULK, 4 TB, HDD, 3,5 Zoll, intern', 113.99, 7, '', '', 6, 9),
	(18, 'WD Black™ BULK, 6 TB, HDD, 3,5 Zoll, intern', 303.60, 7, '', '', 6, 9),
	(19, 'COOLER MASTER MasterBox Lite 3.1 PC-Gehäuse', 44.99, 7, '', '', 8, 10),
	(20, 'CORSAIR Carbide SPEC-04 PC Gehäuse', 65.99, 7, '', '', 8, 3),
	(21, 'CORSAIR Crystal Series 680X RGB ATX Gehäuse', 239.99, 7, '', '', 8, 3),
	(22, 'CREATIVE Sound BlasterX AE-5', 126.99, 7, '', '', 7, 11),
	(23, 'CREATIVE 70SB150000001 Sound Blaster Z', 99.99, 7, '', '', 7, 11),
	(24, 'ASUS 90YA00T0 XONAR SE', 39.99, 7, '', '', 7, 1);





#----------------------------------------------------------

CREATE TABLE if NOT exists Bestellung (
  bestID int(255) NOT NULL,
  bestdat varchar(123) NOT NULL,
  summe varchar(255) NOT NULL,
  
  knr int(255) NOT NULL,
  codenr int(255) NOT NULL,
  PRIMARY KEY (bestID),
  FOREIGN KEY (knr) REFERENCES Kunde(knr),
  FOREIGN KEY (codenr) REFERENCES Aktionscode(codenr)
  );


#----------------------------------------------------------

CREATE TABLE if NOT exists Bankverbindung (
  iban varchar(255) NOT NULL,                         -- pk verfeinern
  kontoinhaber varchar(123) NOT NULL,
  bic varchar(255) NOT NULL,
  knr int(255) NOT NULL,
  PRIMARY KEY (iban),
  FOREIGN KEY (bic) REFERENCES Bank(bic),
  FOREIGN KEY (knr) REFERENCES Kunde(knr)
  );
  

#----------------------------------------------------------

CREATE TABLE if NOT exists Wunschliste (
  prodID int(255) NOT NULL,                         -- pk verfeinern
  knr int(123) NOT NULL,
  dat varchar(255) NOT NULL,
  PRIMARY KEY (prodID, knr),
  FOREIGN KEY (prodID) REFERENCES Produkt(prodID),
  FOREIGN KEY (knr) REFERENCES Kunde(knr)
  );
  

#----------------------------------------------------------

CREATE TABLE if NOT exists Bestellposition (
  bestID int(255) NOT NULL,                         -- pk verfeinern
  prodID int(123) NOT NULL,
  stuekzahl int(255) NOT NULL,
  PRIMARY KEY (bestID, prodID),
  FOREIGN KEY (bestID) REFERENCES Bestellung(bestID),
  FOREIGN KEY (prodID) REFERENCES Produkt(prodID)
  );
  

#----------------------------------------------------------

CREATE TABLE if NOT exists Bezahlung (
  bestID int(255) NOT NULL,                         -- pk verfeinern
  iban varchar(255) NOT NULL,
  bezdat varchar(255) NOT NULL,
  PRIMARY KEY (bestID, iban),
  FOREIGN KEY (bestID) REFERENCES Bestellung(bestID),
  FOREIGN KEY (iban) REFERENCES Bankverbindung(iban)
  );
  

#----------------------------------------------------------

CREATE TABLE if NOT exists Lieferung (
  bestID int(255) NOT NULL,                         -- pk verfeinern
  liefID int(123) NOT NULL,
  liefdat int(255) NOT NULL,
  versdat varchar(255) NOT NULL,
  PRIMARY KEY (bestID, liefID),
  FOREIGN KEY (bestID) REFERENCES Bestellung(bestID),
  FOREIGN KEY (liefID) REFERENCES Lieferant(liefID)
  );


#----------------------------------------------------------

CREATE TABLE if NOT exists Bewertung (
  bewID int(255) NOT NULL,                         -- pk verfeinern
  prodID int(123) NOT NULL,
  knr int(255) NOT NULL,
  titel VARCHAR(255) NOT NULL, 
  kommentar varchar(255) NOT NULL,
  bewdat timestamp NOT NULL,
  PRIMARY KEY (bewID),
  FOREIGN KEY (knr) REFERENCES Kunde(knr),
  FOREIGN KEY (prodID) REFERENCES Produkt(prodID)
  );
