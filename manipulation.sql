---------------------------- insertion valeurs ---------------------------------

INSERT INTO logiciel(nomDev, nom, dateLancement, type, plateforme) VALUES('Tigre', 'Sentence', '2014-11-18', 'OS', 'PC');
INSERT INTO logiciel(nomDev, nom, dateLancement, type, plateforme) VALUES('Cachalot', 'MightyPoint', '2015-12-17', 'OS', 'tablette');
INSERT INTO logiciel(nomDev, nom, dateLancement, type, plateforme) VALUES('Lion', 'CreativePlace', '2015-12-18', 'OS', 'tablette');
INSERT INTO logiciel VALUES('Rossignol', 'Dreams', '2016-04-03', 'application', 'texte');
INSERT INTO logiciel VALUES('Requin', 'Unknown', '2016-05-18', 'application', 'texte');
INSERT INTO logiciel VALUES('Anguille', 'MathsEnvironnement', '2016-08-27', 'application', 'maths');
INSERT INTO logiciel VALUES('Cerf', 'Friends', '2017-12-23', 'application', 'autre');
INSERT INTO logiciel VALUES('Girafe', 'Football2019', '2019-02-01', 'jeu', 'platesFormes');
INSERT INTO logiciel VALUES('Poisson', 'Gunshot', '2019-05-15', 'jeu', 'FPS');
INSERT INTO logiciel VALUES('Aigle', 'FutureIsNow', '2020-01-08', 'jeu', 'FPS');
INSERT INTO logiciel VALUES('Chimère', 'HolyTown', '2020-02-17', 'jeu', 'autre');

INSERT INTO version VALUES(1, 'Tigre', '2014-11-18');
INSERT INTO version VALUES(2, 'Tigre', '2014-12-18');
INSERT INTO version VALUES(1, 'Cachalot', '2015-12-17');
INSERT INTO version VALUES(1, 'Lion', '2015-12-18');
INSERT INTO version VALUES(2, 'Lion', '2016-12-01');
INSERT INTO version VALUES(3, 'Lion', '2017-03-07');
INSERT INTO version VALUES(1, 'Rossignol', '2016-04-03');
INSERT INTO version VALUES(1, 'Requin', '2016-05-18');
INSERT INTO version VALUES(1, 'Anguille', '2016-08-27');
INSERT INTO version VALUES(2, 'Anguille', '2016-09-05');
INSERT INTO version VALUES(1, 'Cerf', '2017-12-23');
INSERT INTO version VALUES(1, 'Girafe', '2019-02-01');
INSERT INTO version VALUES(1, 'Poisson', '2019-05-15');
INSERT INTO version VALUES(2, 'Poisson', '2019-06-15');
INSERT INTO version VALUES(3, 'Poisson', '2019-07-16');
INSERT INTO version VALUES(4, 'Poisson', '2019-08-29');
INSERT INTO version VALUES(5, 'Poisson', '2019-08-30');
INSERT INTO version VALUES(1, 'Aigle', '2020-01-08');
INSERT INTO version VALUES(1, 'Chimère', '2020-02-17');

INSERT INTO problème VALUES(1, 1, 'Tigre', '2015-10-01', 'problème d"affichage');
INSERT INTO problème VALUES(2, 1, 'Cachalot', '2015-12-19', 'erreur authentification');
INSERT INTO problème VALUES(3, 2, 'Lion', '2016-12-30', 'échec connexion');
INSERT INTO problème VALUES(4, 1, 'Anguille', '2016-08-28', 'défauts modélisation');
INSERT INTO problème VALUES(5, 2, 'Anguille', '2016-09-06', 'fonctions défaillantes');
INSERT INTO problème VALUES(6, 5, 'Poisson', '2020-02-01', 'latence importante');
INSERT INTO problème VALUES(7, 1, 'Aigle', '2020-01-12', 'réseau introuvable');
INSERT INTO problème VALUES(8, 1, 'Chimère', '2020-03-07', 'utilisateur inconnu');

INSERT INTO employé VALUES(3478, 'Dupont', 'Étienne', '1962-10-04');
INSERT INTO employé VALUES(9854, 'Martial', 'Rémi', '1995-02-08');
INSERT INTO employé VALUES(6783, 'Pacot', 'Anne', '1984-05-19');

INSERT INTO client VALUES(0678324356, 'Duchâteau', 'Marie', '2002-06-11', 23, 'Rue de l"Insustrie', 92700, 'Colombes');
INSERT INTO client VALUES(0750594117, 'Manson', 'Henri', '1988-10-21');
INSERT INTO client VALUES(0788329699, 'Couturier', 'Renan', '1988-09-25', 102, 'Impasse De Gaulle', 75001, 'Paris');
INSERT INTO client VALUES(0681502243, 'Boulanger', 'Raphaël', '1998-03-02');
INSERT INTO client VALUES(0678904338, 'Dumas', 'Laura', '1999-04-03');

INSERT INTO achat VALUES(0678324356, 'Tigre');
INSERT INTO achat VALUES(0678324356, 'Cachalot');
INSERT INTO achat VALUES(0750594117, 'Lion');
INSERT INTO achat VALUES(0750594117, 'Rossignol');
INSERT INTO achat VALUES(0750594117, 'Requin');
INSERT INTO achat VALUES(0788329699, 'Tigre');
INSERT INTO achat VALUES(0788329699, 'Poisson');
INSERT INTO achat VALUES(0788329699, 'Aigle');
INSERT INTO achat VALUES(0788329699, 'Chimère');
INSERT INTO achat VALUES(0681502243, 'Tigre');
INSERT INTO achat VALUES(0678904338, 'Poisson');

INSERT INTO signalement VALUES(0750594117, 1);
INSERT INTO signalement VALUES(0750594117, 2);
INSERT INTO signalement VALUES(0788329699, 3);
INSERT INTO signalement VALUES(0788329699, 4);
INSERT INTO signalement VALUES(0681502243, 5);
INSERT INTO signalement VALUES(0678904338, 6);
INSERT INTO signalement VALUES(0750594117, 7);
INSERT INTO signalement VALUES(0750594117, 8);

INSERT INTO correctif(num, p, e, dateC, patch) VALUES(1, 1, 3478, '2015-10-02', 876543);
INSERT INTO correctif VALUES(2, 1, 3478, '2015-10-03', 'Diminuer résolution');
INSERT INTO correctif(num, p, e, dateC, patch) VALUES(1, 2, 3478, '2015-12-23', 347594);
INSERT INTO correctif(num, p, e, dateC, patch) VALUES(1, 3, 3478, '2017-01-05', 545576);
INSERT INTO correctif(num, p, e, dateC, patch) VALUES(1, 4, 3478, '2016-08-29', 199899);
INSERT INTO correctif(num, p, e, dateC, patch) VALUES(1, 5, 3478, '2016-09-07', 651265);
INSERT INTO correctif(num, p, e, dateC, patch) VALUES(1, 6, 3478, '2020-02-02', 102132);
INSERT INTO correctif(num, p, e, dateC, patch) VALUES(2, 6, 3478, '2020-02-03', 658565);
INSERT INTO correctif VALUES(3, 6, 3478, '2020-02-04', 'Limiter les interactions avec les PNJs');

INSERT INTO support VALUES('Rossignol', 'Tigre');
INSERT INTO support VALUES('Requin', 'Tigre');
INSERT INTO support VALUES('Anguille', 'Tigre');
INSERT INTO support VALUES('Anguille', 'Cachalot');
INSERT INTO support VALUES('Anguille', 'Lion');
INSERT INTO support VALUES('Cerf', 'Lion');
INSERT INTO support VALUES('Girafe', 'Tigre');
INSERT INTO support VALUES('Girafe', 'Cachalot');
INSERT INTO support VALUES('Poisson', 'Cachalot');
INSERT INTO support VALUES('Aigle', 'Tigre');
INSERT INTO support VALUES('Chimère', 'Cachalot');
INSERT INTO support VALUES('Chimère', 'Lion');

--------------------------------- requêtes -------------------------------------

-- nombre de problèmes non corrigés pour chaque version de ses logiciels
SELECT version.L as logiciel, version.num as version, COUNT(problème.id)as problèmes_irrésolus
FROM problème
JOIN version
ON(problème.v = version.num AND problème.L = version.L)
LEFT JOIN correctif
ON problème.id = correctif.p
WHERE correctif.num IS NULL
GROUP BY(version.L, version.num);

-- applications tournant sur tablettes ayant eu plus d'un correctif
CREATE VIEW vApplicationsTablette(application)
AS
SELECT app.nomDev
FROM logiciel app
JOIN support s
ON app.nomDev = s.programme
JOIN logiciel os
ON os.nomDev = s.os
WHERE app.type = 'application' AND os.plateforme = 'tablette'
GROUP BY app.nomDev;

SELECT application, COUNT (c.*) as nombre_correctifs
FROM vApplicationsTablette
JOIN version v
ON vApplicationsTablette.application = v.L
JOIN problème p
ON v.num = p.v AND v.L = p.L
JOIN correctif c
ON p.id = c.p
GROUP BY application
HAVING COUNT (c.*) > 1;

-- clients ayant remonté des problèmes sur des logiciels qu'ils ne possèdent pas
SELECT c.prénom as prénom, c.nom as nom
FROM client c
JOIN signalement s
ON c.numTel = s.c
JOIN problème p
ON p.id = s.p
JOIN version v
ON p.v = v.num AND p.L = v.L
JOIN logiciel l
ON l.nomDev = v.L
LEFT JOIN achat a
ON l.nomDev = a.L
WHERE a.L IS NULL
GROUP BY c.prénom, c.nom;
