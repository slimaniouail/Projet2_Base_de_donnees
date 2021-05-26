CREATE TABLE tbl_employe (
	ID_employe			SERIAL			NOT NULL UNIQUE,
	nom					VARCHAR(32)		NOT NULL, 
	prenom				VARCHAR(32)		NOT NULL,
	genre				type_genre		DEFAULT 'x',
	NAS					CHAR(9)			NOT NULL,
	salaire				DECIMAL(5,2)	DEFAULT 27.50,
	poste				VARCHAR(32)		NOT NULL,
	date_embauche		DATE 			DEFAULT CURRENT_DATE,
	departement			VARCHAR(32)		NOT NULL,
	
	CONSTRAINT pk_employe PRIMARY KEY(ID_employe),
	CONSTRAINT cc_salaire	CHECK (	salaire BETWEEN 15.00 AND 250.00)
);

CREATE TABLE tbl_poste (
	ID_poste			SERIAL			NOT NULL UNIQUE,
	nom_poste			VARCHAR(32)		NOT NULL UNIQUE,
	
	CONSTRAINT pk_poste PRIMARY KEY(ID_poste)
);




CREATE OR REPLACE PROCEDURE insertion_table_employe (nom_1 VARCHAR(32), prenom_1 VARCHAR(32), genre_1 type_genre DEFAULT 'x', NAS_1	CHAR(9), 
salaire_1 DECIMAL(5,2) DEFAULT 27.50, poste_1 VARCHAR(32), date_embauche_1 DATE DEFAULT CURRENT_DATE, departement_1 VARCHAR(32))
LANGUAGE plpgsql 
AS $$
    BEGIN
        INSERT INTO tbl_employe (nom , prenom , genre , NAS	,salaire , poste , date_embauche ,departement) VALUES (nom_1 , prenom_1, 
genre_1 , NAS_1, salaire_1 , poste_1 , date_embauche_1,	departement_1);
END $$;

CALL insertion_table_employe('nom1' , 'prenom1' , 'h' , '313212132'	,43.32 , 'poste1' , '2021-05-04' ,'departement1');
CALL insertion_table_employe('nom2' , 'prenom2' , 'f' , '342354626'	,106.32 , 'poste2' , '2018-06-20' ,'departement2');





CREATE OR REPLACE PROCEDURE insertion_table_tbl_troncon (nom_rue_1 VARCHAR(32), intersection_debut_1 CHAR(7)
	, intersection_fin_1 CHAR(7), longueur_1 DECIMAL(7,1), limite_vitesse_1 INTEGER, nb_voie_1 INTEGER DEFAULT 1, pavage_1 type_pavage)
LANGUAGE plpgsql 
AS $$
    BEGIN
        INSERT INTO tbl_employe (nom_rue , intersection_debut, intersection_fin, longueur, limite_vitesse, nb_voie, pavage) 
		VALUES (nom_rue_1 , intersection_debut_1 , intersection_fin_1 , longueur_1 , limite_vitesse_1 , nb_voie_1 , pavage_1);
END $$;

CALL insertion_table_employe('nom_rue1' , 'inter_d1' , 'inter_f1' , '32123.32'	,3126 , 4 , 'non pave');
CALL insertion_table_employe('nom_rue2' , 'inter_d2' , 'inter_f2' , '32126.48'	,9889 , 6 , 'indetermine');
