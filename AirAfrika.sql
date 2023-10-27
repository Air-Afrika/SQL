CREATE TABLE client (
  code VARCHAR(255) NOT NULL,
  nom VARCHAR(255) NOT NULL,
  prénom VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  téléphone VARCHAR(255) NOT NULL,
  PRIMARY KEY (code)
);

CREATE TABLE compagnieAérienne (
  nom VARCHAR(255) NOT NULL,
  numéro VARCHAR(255) NOT NULL,
  code VARCHAR(255) NOT NULL,
  PRIMARY KEY (code)
);

CREATE TABLE vol (
  id VARCHAR(255) NOT NULL,
  numéro VARCHAR(255) NOT NULL,
  compagnieAérienne VARCHAR(255) NOT NULL,
  villeDeDépart VARCHAR(255) NOT NULL,
  villeDArrivée VARCHAR(255) NOT NULL,
  dateDeDépart DATE NOT NULL,
  heureDeDépart TIME NOT NULL,
  dateDArrivée DATE NOT NULL,
  heureDArrivée TIME NOT NULL,
  nombreDePlacesDisponibles INT NOT NULL,
  escale VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (compagnieAérienne) REFERENCES compagnieAérienne (code)
);

CREATE TABLE escale (
  aéroport VARCHAR(255) NOT NULL,
  heureDArrivée TIME NOT NULL,
  heureDeDépart TIME NOT NULL,
  PRIMARY KEY (aéroport, heureDArrivée)
);

CREATE TABLE aéroport (
  nom VARCHAR(255) NOT NULL,
  code VARCHAR(255) NOT NULL,
  ville VARCHAR(255) NOT NULL,
  PRIMARY KEY (code)
);

CREATE TABLE reservations (
	id INT NOT NULL PRIMARY KEY,
	client_id VARCHAR(255) NOT NULL REFERENCES client (code),
	vol_id VARCHAR(255) NOT NULL REFERENCES vol (id),
	nombre_places INT NOT NULL,
	extras VARCHAR(255) NOT NULL,
	tarif DECIMAL(10,2) NOT NULL,
	etat VARCHAR(255) NOT NULL
);

CREATE TABLE extra (
  nom VARCHAR(255) NOT NULL,
  prix FLOAT NOT NULL,
  PRIMARY KEY (nom)
);

CREATE TABLE statutRéservation (
  statut VARCHAR(255) NOT NULL,
  PRIMARY KEY (statut)
);
CREATE TABLE admin (
  id VARCHAR(255) NOT NULL,
  nom VARCHAR(255) NOT NULL,
  prénom VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  motDePasse VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
);
