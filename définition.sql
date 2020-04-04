DROP TABLE IF EXISTS logiciel CASCADE ;
DROP TABLE IF EXISTS version CASCADE ;
DROP TABLE IF EXISTS problème CASCADE ;
DROP TABLE IF EXISTS employé CASCADE ;
DROP TABLE IF EXISTS client CASCADE ;
DROP TABLE IF EXISTS achat CASCADE ;
DROP TABLE IF EXISTS signalement CASCADE ;
DROP TABLE IF EXISTS correctif CASCADE ;
DROP TABLE IF EXISTS support CASCADE ;

----------------------------- création tables ----------------------------------

CREATE TABLE logiciel(
  nomDev VARCHAR(25)PRIMARY KEY,
  nom VARCHAR(25)UNIQUE NOT NULL,
  dateLancement DATE NOT NULL,
  type VARCHAR(25)NOT NULL,
  sousType VARCHAR(25),
  plateforme VARCHAR(25),
  CHECK(NOT((type = 'OS')AND(sousType IS NOT NULL))),
  CHECK(NOT((type = 'application')AND(sousType NOT IN('texte', 'maths', 'autre')))),
  CHECK(NOT((type = 'jeu')AND(sousType NOT IN('platesFormes', 'FPS', 'autre')))),
  CHECK(NOT((type = 'OS')AND(plateforme NOT IN('smartphone', 'tablette', 'PC', 'serveur')))),
  CHECK(NOT((type = 'application')AND(plateforme IS NOT NULL))),
  CHECK(NOT((type = 'jeu')AND(plateforme IS NOT NULL)))
);

CREATE TABLE support(
  programme VARCHAR(25),
  FOREIGN KEY(programme) REFERENCES logiciel(nomDev),
  os VARCHAR(25),
  FOREIGN KEY(os) REFERENCES logiciel(nomDev),
  PRIMARY KEY(os, programme)
);

CREATE TABLE version(
  num INTEGER,
  L VARCHAR(25) NOT NULL,
  dateDispo DATE NOT NULL,
  PRIMARY KEY(num, L),
  FOREIGN KEY(L)REFERENCES logiciel(nomDev)
);

CREATE TABLE problème(
  id INTEGER PRIMARY KEY,
  v INTEGER NOT NULL,
  L VARCHAR(25) NOT NULL,
  datePb DATE NOT NULL,
  description VARCHAR(100) NOT NULL,
  FOREIGN KEY(v, L)REFERENCES version(num, L)
);

CREATE TABLE employé(
  id INTEGER PRIMARY KEY,
  nom VARCHAR(25) NOT NULL,
  prénom VARCHAR(25) NOT NULL,
  dateNaissance DATE NOT NULL
);

CREATE TABLE client(
  numTel INTEGER PRIMARY KEY,
  nom VARCHAR(25) NOT NULL,
  prénom VARCHAR(25) NOT NULL,
  dateNaissance DATE NOT NULL,
  numRue INTEGER,
  nomRue VARCHAR(50),
  codePostal INTEGER,
  ville VARCHAR(50),
  CHECK((numRue IS NULL AND nomRue IS NULL AND ville IS NULL AND codePostal IS NULL)OR(numRue IS NOT NULL AND nomRue IS NOT NULL AND ville IS NOT NULL AND codePostal IS NOT NULL))
);

CREATE TABLE achat(
  c INTEGER,
  FOREIGN KEY(c) REFERENCES client(numTel),
  L VARCHAR(25),
  FOREIGN KEY(L) REFERENCES logiciel(nomDev),
  PRIMARY KEY(c, L)
);

CREATE TABLE signalement(
  c INTEGER,
  FOREIGN KEY(c)REFERENCES client(numTel),
  p INTEGER,
  FOREIGN KEY(p)REFERENCES problème(id),
  PRIMARY KEY(c, p)
);

CREATE TABLE correctif(
  num INTEGER,
  p INTEGER,
  FOREIGN KEY(p)REFERENCES problème(id),
  e INTEGER,
  FOREIGN KEY(e)REFERENCES employé(id),
  dateC DATE NOT NULL,
  instructions VARCHAR(100),
  patch INTEGER,
  PRIMARY KEY(num, p),
  CHECK(instructions IS NOT NULL OR patch IS NOT NULL),
  CHECK(NOT(instructions IS NOT NULL AND patch IS NOT NULL))
);

----- vues permettant de détecter des anomalies(contraintes compliquées)------

-- projection(achat.c)= projection(client.num)
CREATE VIEW vAchat(cAchat, numClient)
AS
SELECT achat.c, client.numTel
FROM achat RIGHT JOIN client
ON achat.c = client.numTel
WHERE achat.c = NULL;

-- projection(version.L)= projection(logiciel.nomDev)
CREATE VIEW vVersion(lVersion, nomDevLogiciel)
AS
SELECT version.L, logiciel.nomDev
FROM logiciel RIGHT JOIN version
ON version.L = logiciel.nomDev
WHERE version.L = NULL;

-- os ne référence que des enregistrements tels que type = ‘os’
CREATE VIEW vSupport1(logicielType, supportOS)
AS
SELECT logiciel.type, support.os
FROM logiciel JOIN support
ON logiciel.type = support.os
WHERE type != 'OS';

-- programme ne référence que des enregistrements tels que type = ‘programme’
CREATE VIEW vSupport2(logicielType, supportProgramme)
AS
SELECT logiciel.type, support.programme
FROM logiciel JOIN support
ON logiciel.type = support.programme
WHERE type != 'programme';

-- restriction(projection(logiciel.type), type = ‘programme’)= projection(support.programme)
CREATE VIEW vSupport3(logicielType, supportProgramme)
AS
SELECT logiciel.type, support.programme
FROM logiciel RIGHT JOIN support
ON logiciel.type = support.programme
WHERE logiciel.type = 'programme' AND support.programme = NULL;

-- la date d'un correctif doit être postérieure à celle du problème
CREATE VIEW vDate1(correctif_num, correctif_p)
AS
SELECT correctif.num, correctif.p
FROM correctif JOIN problème
ON correctif.p = problème.id
WHERE correctif.dateC < problème.datePb;

-- la date d'un problème doit être postérieure à celle de la version
CREATE VIEW vDate2(problème_id)
AS
SELECT problème.id
FROM version JOIN problème
ON version.num = problème.v AND version.L = problème.L
WHERE problème.datePb < version.dateDispo;

-- la date d'une version doit être postérieure à celle du logiciel
CREATE VIEW vDate3(version_num, version_L)
AS
SELECT version.num, version.L
FROM logiciel JOIN version
ON logiciel.nomDev = version.L
WHERE version.dateDispo < logiciel.dateLancement;
