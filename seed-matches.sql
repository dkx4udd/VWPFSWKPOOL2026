-- WK 2026 Wedstrijdschema — groepsfase
-- Alle tijden in UTC. WK start 11 juni 2026, finale 19 juli 2026.
-- Stadia: Azteca (MEX), Rose Bowl (LA), MetLife (NJ), AT&T (DAL),
--         SoFi (LA), Hard Rock (MIA), Levi's (SF), Gillette (BOS),
--         Lincoln Financial (PHI), Arrowhead (KC), BC Place (VAN),
--         BMO Field (TOR)

-- Helper: haal team-ids op via subquery
-- Groepsfase: elke groep speelt 6 wedstrijden (A vs B, A vs C, A vs D, B vs C, B vs D, C vs D)

DO $$
DECLARE
  -- Groep A
  mx UUID; ec UUID; hu UUID; nz UUID;
  -- Groep B
  ar UUID; cl UUID; ma UUID; ua UUID;
  -- Groep C
  ca UUID; de UUID; sk UUID; cm UUID;
  -- Groep D
  jp UUID; hr UUID; ng UUID; pe UUID;
  -- Groep E
  es UUID; sn UUID; dk UUID; uz UUID;
  -- Groep F
  pt UUID; uy UUID; ir UUID; tz UUID;
  -- Groep G
  us UUID; co UUID; tn UUID; ug UUID;
  -- Groep H
  nl UUID; kr UUID; iq UUID; jm UUID;
  -- Groep I
  en UUID; rs UUID; cr UUID; ke UUID;
  -- Groep J
  br UUID; no UUID; sa UUID; cu UUID;
  -- Groep K
  fr UUID; au UUID; eg UUID; gt UUID;
  -- Groep L
  be UUID; at UUID; pa UUID; ci UUID;
BEGIN
  SELECT id INTO mx FROM teams WHERE "isoCode"='MX';
  SELECT id INTO ec FROM teams WHERE "isoCode"='EC';
  SELECT id INTO hu FROM teams WHERE "isoCode"='HU';
  SELECT id INTO nz FROM teams WHERE "isoCode"='NZ';
  SELECT id INTO ar FROM teams WHERE "isoCode"='AR';
  SELECT id INTO cl FROM teams WHERE "isoCode"='CL';
  SELECT id INTO ma FROM teams WHERE "isoCode"='MA';
  SELECT id INTO ua FROM teams WHERE "isoCode"='UA';
  SELECT id INTO ca FROM teams WHERE "isoCode"='CA';
  SELECT id INTO de FROM teams WHERE "isoCode"='DE';
  SELECT id INTO sk FROM teams WHERE "isoCode"='SK';
  SELECT id INTO cm FROM teams WHERE "isoCode"='CM';
  SELECT id INTO jp FROM teams WHERE "isoCode"='JP';
  SELECT id INTO hr FROM teams WHERE "isoCode"='HR';
  SELECT id INTO ng FROM teams WHERE "isoCode"='NG';
  SELECT id INTO pe FROM teams WHERE "isoCode"='PE';
  SELECT id INTO es FROM teams WHERE "isoCode"='ES';
  SELECT id INTO sn FROM teams WHERE "isoCode"='SN';
  SELECT id INTO dk FROM teams WHERE "isoCode"='DK';
  SELECT id INTO uz FROM teams WHERE "isoCode"='UZ';
  SELECT id INTO pt FROM teams WHERE "isoCode"='PT';
  SELECT id INTO uy FROM teams WHERE "isoCode"='UY';
  SELECT id INTO ir FROM teams WHERE "isoCode"='IR';
  SELECT id INTO tz FROM teams WHERE "isoCode"='TZ';
  SELECT id INTO us FROM teams WHERE "isoCode"='US';
  SELECT id INTO co FROM teams WHERE "isoCode"='CO';
  SELECT id INTO tn FROM teams WHERE "isoCode"='TN';
  SELECT id INTO ug FROM teams WHERE "isoCode"='UG';
  SELECT id INTO nl FROM teams WHERE "isoCode"='NL';
  SELECT id INTO kr FROM teams WHERE "isoCode"='KR';
  SELECT id INTO iq FROM teams WHERE "isoCode"='IQ';
  SELECT id INTO jm FROM teams WHERE "isoCode"='JM';
  SELECT id INTO en FROM teams WHERE "isoCode"='EN';
  SELECT id INTO rs FROM teams WHERE "isoCode"='RS';
  SELECT id INTO cr FROM teams WHERE "isoCode"='CR';
  SELECT id INTO ke FROM teams WHERE "isoCode"='KE';
  SELECT id INTO br FROM teams WHERE "isoCode"='BR';
  SELECT id INTO no FROM teams WHERE "isoCode"='NO';
  SELECT id INTO sa FROM teams WHERE "isoCode"='SA';
  SELECT id INTO cu FROM teams WHERE "isoCode"='CU';
  SELECT id INTO fr FROM teams WHERE "isoCode"='FR';
  SELECT id INTO au FROM teams WHERE "isoCode"='AU';
  SELECT id INTO eg FROM teams WHERE "isoCode"='EG';
  SELECT id INTO gt FROM teams WHERE "isoCode"='GT';
  SELECT id INTO be FROM teams WHERE "isoCode"='BE';
  SELECT id INTO at FROM teams WHERE "isoCode"='AT';
  SELECT id INTO pa FROM teams WHERE "isoCode"='PA';
  SELECT id INTO ci FROM teams WHERE "isoCode"='CI';

  -- ============================================================
  -- GROEPSFASE (speeldag 1: 11-16 juni)
  -- ============================================================

  -- Groep A
  INSERT INTO matches (home_team_id,away_team_id,"scheduledAt",phase,"group",stadium,city) VALUES
    (mx,ec,'2026-06-11 21:00:00+00','group','A','Estadio Azteca','Mexico-Stad'),
    (hu,nz,'2026-06-12 00:00:00+00','group','A','Rose Bowl','Los Angeles');

  -- Groep B
  INSERT INTO matches (home_team_id,away_team_id,"scheduledAt",phase,"group",stadium,city) VALUES
    (ar,cl,'2026-06-12 18:00:00+00','group','B','MetLife Stadium','New York/New Jersey'),
    (ma,ua,'2026-06-12 21:00:00+00','group','B','AT&T Stadium','Dallas');

  -- Groep C
  INSERT INTO matches (home_team_id,away_team_id,"scheduledAt",phase,"group",stadium,city) VALUES
    (ca,de,'2026-06-13 18:00:00+00','group','C','BC Place','Vancouver'),
    (sk,cm,'2026-06-13 21:00:00+00','group','C','BMO Field','Toronto');

  -- Groep D
  INSERT INTO matches (home_team_id,away_team_id,"scheduledAt",phase,"group",stadium,city) VALUES
    (jp,hr,'2026-06-14 18:00:00+00','group','D','SoFi Stadium','Los Angeles'),
    (ng,pe,'2026-06-14 21:00:00+00','group','D','Hard Rock Stadium','Miami');

  -- Groep E
  INSERT INTO matches (home_team_id,away_team_id,"scheduledAt",phase,"group",stadium,city) VALUES
    (es,sn,'2026-06-15 18:00:00+00','group','E','Levi''s Stadium','San Francisco'),
    (dk,uz,'2026-06-15 21:00:00+00','group','E','Gillette Stadium','Boston');

  -- Groep F
  INSERT INTO matches (home_team_id,away_team_id,"scheduledAt",phase,"group",stadium,city) VALUES
    (pt,uy,'2026-06-16 18:00:00+00','group','F','Lincoln Financial Field','Philadelphia'),
    (ir,tz,'2026-06-16 21:00:00+00','group','F','Arrowhead Stadium','Kansas City');

  -- Groep G
  INSERT INTO matches (home_team_id,away_team_id,"scheduledAt",phase,"group",stadium,city) VALUES
    (us,co,'2026-06-17 18:00:00+00','group','G','MetLife Stadium','New York/New Jersey'),
    (tn,ug,'2026-06-17 21:00:00+00','group','G','AT&T Stadium','Dallas');

  -- Groep H
  INSERT INTO matches (home_team_id,away_team_id,"scheduledAt",phase,"group",stadium,city) VALUES
    (nl,kr,'2026-06-18 18:00:00+00','group','H','SoFi Stadium','Los Angeles'),
    (iq,jm,'2026-06-18 21:00:00+00','group','H','Hard Rock Stadium','Miami');

  -- Groep I
  INSERT INTO matches (home_team_id,away_team_id,"scheduledAt",phase,"group",stadium,city) VALUES
    (en,rs,'2026-06-19 18:00:00+00','group','I','Levi''s Stadium','San Francisco'),
    (cr,ke,'2026-06-19 21:00:00+00','group','I','Gillette Stadium','Boston');

  -- Groep J
  INSERT INTO matches (home_team_id,away_team_id,"scheduledAt",phase,"group",stadium,city) VALUES
    (br,no,'2026-06-20 18:00:00+00','group','J','Lincoln Financial Field','Philadelphia'),
    (sa,cu,'2026-06-20 21:00:00+00','group','J','Arrowhead Stadium','Kansas City');

  -- Groep K
  INSERT INTO matches (home_team_id,away_team_id,"scheduledAt",phase,"group",stadium,city) VALUES
    (fr,au,'2026-06-21 18:00:00+00','group','K','Rose Bowl','Los Angeles'),
    (eg,gt,'2026-06-21 21:00:00+00','group','K','Estadio Azteca','Mexico-Stad');

  -- Groep L
  INSERT INTO matches (home_team_id,away_team_id,"scheduledAt",phase,"group",stadium,city) VALUES
    (be,at,'2026-06-22 18:00:00+00','group','L','BC Place','Vancouver'),
    (pa,ci,'2026-06-22 21:00:00+00','group','L','BMO Field','Toronto');

  -- ============================================================
  -- GROEPSFASE speeldag 2 (23-28 juni)
  -- ============================================================

  INSERT INTO matches (home_team_id,away_team_id,"scheduledAt",phase,"group",stadium,city) VALUES
    (mx,hu,'2026-06-23 18:00:00+00','group','A','Estadio Azteca','Mexico-Stad'),
    (ec,nz,'2026-06-23 21:00:00+00','group','A','Rose Bowl','Los Angeles'),
    (ar,ma,'2026-06-24 18:00:00+00','group','B','MetLife Stadium','New York/New Jersey'),
    (cl,ua,'2026-06-24 21:00:00+00','group','B','AT&T Stadium','Dallas'),
    (ca,sk,'2026-06-25 18:00:00+00','group','C','BC Place','Vancouver'),
    (de,cm,'2026-06-25 21:00:00+00','group','C','BMO Field','Toronto'),
    (jp,ng,'2026-06-26 18:00:00+00','group','D','SoFi Stadium','Los Angeles'),
    (hr,pe,'2026-06-26 21:00:00+00','group','D','Hard Rock Stadium','Miami'),
    (es,dk,'2026-06-27 18:00:00+00','group','E','Levi''s Stadium','San Francisco'),
    (sn,uz,'2026-06-27 21:00:00+00','group','E','Gillette Stadium','Boston'),
    (pt,ir,'2026-06-28 18:00:00+00','group','F','Lincoln Financial Field','Philadelphia'),
    (uy,tz,'2026-06-28 21:00:00+00','group','F','Arrowhead Stadium','Kansas City');

  -- ============================================================
  -- GROEPSFASE speeldag 3 (29 juni - 2 juli, simultaan)
  -- ============================================================

  INSERT INTO matches (home_team_id,away_team_id,"scheduledAt",phase,"group",stadium,city) VALUES
    (mx,nz,'2026-06-29 21:00:00+00','group','A','Estadio Azteca','Mexico-Stad'),
    (ec,hu,'2026-06-29 21:00:00+00','group','A','Rose Bowl','Los Angeles'),
    (ar,ua,'2026-06-30 21:00:00+00','group','B','MetLife Stadium','New York/New Jersey'),
    (ma,cl,'2026-06-30 21:00:00+00','group','B','AT&T Stadium','Dallas'),
    (ca,cm,'2026-07-01 21:00:00+00','group','C','BC Place','Vancouver'),
    (de,sk,'2026-07-01 21:00:00+00','group','C','BMO Field','Toronto'),
    (jp,pe,'2026-07-02 18:00:00+00','group','D','SoFi Stadium','Los Angeles'),
    (hr,ng,'2026-07-02 18:00:00+00','group','D','Hard Rock Stadium','Miami'),
    (es,uz,'2026-07-02 21:00:00+00','group','E','Levi''s Stadium','San Francisco'),
    (dk,sn,'2026-07-02 21:00:00+00','group','E','Gillette Stadium','Boston'),
    (pt,tz,'2026-07-03 21:00:00+00','group','F','Lincoln Financial Field','Philadelphia'),
    (uy,ir,'2026-07-03 21:00:00+00','group','F','Arrowhead Stadium','Kansas City'),
    (us,ug,'2026-07-04 18:00:00+00','group','G','MetLife Stadium','New York/New Jersey'),
    (co,tn,'2026-07-04 18:00:00+00','group','G','AT&T Stadium','Dallas'),
    (nl,jm,'2026-07-04 21:00:00+00','group','H','SoFi Stadium','Los Angeles'),
    (kr,iq,'2026-07-04 21:00:00+00','group','H','Hard Rock Stadium','Miami'),
    (en,ke,'2026-07-05 18:00:00+00','group','I','Levi''s Stadium','San Francisco'),
    (rs,cr,'2026-07-05 18:00:00+00','group','I','Gillette Stadium','Boston'),
    (br,cu,'2026-07-05 21:00:00+00','group','J','Lincoln Financial Field','Philadelphia'),
    (no,sa,'2026-07-05 21:00:00+00','group','J','Arrowhead Stadium','Kansas City'),
    (fr,gt,'2026-07-06 18:00:00+00','group','K','Rose Bowl','Los Angeles'),
    (au,eg,'2026-07-06 18:00:00+00','group','K','Estadio Azteca','Mexico-Stad'),
    (be,ci,'2026-07-06 21:00:00+00','group','L','BC Place','Vancouver'),
    (at,pa,'2026-07-06 21:00:00+00','group','L','BMO Field','Toronto');

  -- Groep G/H/I/J/K/L speeldag 2 (invullen)
  INSERT INTO matches (home_team_id,away_team_id,"scheduledAt",phase,"group",stadium,city) VALUES
    (us,tn,'2026-06-23 18:00:00+00','group','G','MetLife Stadium','New York/New Jersey'),
    (co,ug,'2026-06-23 21:00:00+00','group','G','AT&T Stadium','Dallas'),
    (nl,iq,'2026-06-24 18:00:00+00','group','H','SoFi Stadium','Los Angeles'),
    (kr,jm,'2026-06-24 21:00:00+00','group','H','Hard Rock Stadium','Miami'),
    (en,cr,'2026-06-25 18:00:00+00','group','I','Levi''s Stadium','San Francisco'),
    (rs,ke,'2026-06-25 21:00:00+00','group','I','Gillette Stadium','Boston'),
    (br,sa,'2026-06-26 18:00:00+00','group','J','Lincoln Financial Field','Philadelphia'),
    (no,cu,'2026-06-26 21:00:00+00','group','J','Arrowhead Stadium','Kansas City'),
    (fr,eg,'2026-06-27 18:00:00+00','group','K','Rose Bowl','Los Angeles'),
    (au,gt,'2026-06-27 21:00:00+00','group','K','Estadio Azteca','Mexico-Stad'),
    (be,pa,'2026-06-28 18:00:00+00','group','L','BC Place','Vancouver'),
    (at,ci,'2026-06-28 21:00:00+00','group','L','BMO Field','Toronto');

  -- ============================================================
  -- KNOCKOUT FASE (placeholder-namen, teams onbekend)
  -- ============================================================

  -- Ronde van 32 (4-8 juli)
  INSERT INTO matches ("homeTeamPlaceholder","awayTeamPlaceholder","scheduledAt",phase,stadium,city) VALUES
    ('1A','2B','2026-07-08 18:00:00+00','round_of_32','MetLife Stadium','New York/New Jersey'),
    ('1B','2A','2026-07-08 21:00:00+00','round_of_32','AT&T Stadium','Dallas'),
    ('1C','2D','2026-07-09 18:00:00+00','round_of_32','SoFi Stadium','Los Angeles'),
    ('1D','2C','2026-07-09 21:00:00+00','round_of_32','Hard Rock Stadium','Miami'),
    ('1E','2F','2026-07-10 18:00:00+00','round_of_32','Levi''s Stadium','San Francisco'),
    ('1F','2E','2026-07-10 21:00:00+00','round_of_32','Gillette Stadium','Boston'),
    ('1G','2H','2026-07-11 18:00:00+00','round_of_32','Lincoln Financial Field','Philadelphia'),
    ('1H','2G','2026-07-11 21:00:00+00','round_of_32','Arrowhead Stadium','Kansas City'),
    ('1I','2J','2026-07-12 18:00:00+00','round_of_32','BC Place','Vancouver'),
    ('1J','2I','2026-07-12 21:00:00+00','round_of_32','BMO Field','Toronto'),
    ('1K','2L','2026-07-13 18:00:00+00','round_of_32','Rose Bowl','Los Angeles'),
    ('1L','2K','2026-07-13 21:00:00+00','round_of_32','Estadio Azteca','Mexico-Stad'),
    ('3e plaats 1','3e plaats 2','2026-07-07 18:00:00+00','round_of_32','MetLife Stadium','New York/New Jersey'),
    ('3e plaats 3','3e plaats 4','2026-07-07 21:00:00+00','round_of_32','AT&T Stadium','Dallas'),
    ('3e plaats 5','3e plaats 6','2026-07-07 18:00:00+00','round_of_32','SoFi Stadium','Los Angeles'),
    ('3e plaats 7','3e plaats 8','2026-07-07 21:00:00+00','round_of_32','Hard Rock Stadium','Miami');

  -- Achtste finales (10-12 juli)
  INSERT INTO matches ("homeTeamPlaceholder","awayTeamPlaceholder","scheduledAt",phase,stadium,city) VALUES
    ('W49','W50','2026-07-14 18:00:00+00','round_of_16','MetLife Stadium','New York/New Jersey'),
    ('W51','W52','2026-07-14 21:00:00+00','round_of_16','AT&T Stadium','Dallas'),
    ('W53','W54','2026-07-15 18:00:00+00','round_of_16','SoFi Stadium','Los Angeles'),
    ('W55','W56','2026-07-15 21:00:00+00','round_of_16','Hard Rock Stadium','Miami'),
    ('W57','W58','2026-07-16 18:00:00+00','round_of_16','Levi''s Stadium','San Francisco'),
    ('W59','W60','2026-07-16 21:00:00+00','round_of_16','Gillette Stadium','Boston'),
    ('W61','W62','2026-07-17 18:00:00+00','round_of_16','Lincoln Financial Field','Philadelphia'),
    ('W63','W64','2026-07-17 21:00:00+00','round_of_16','Arrowhead Stadium','Kansas City');

  -- Kwartfinales (18-19 juli)
  INSERT INTO matches ("homeTeamPlaceholder","awayTeamPlaceholder","scheduledAt",phase,stadium,city) VALUES
    ('W65','W66','2026-07-19 18:00:00+00','quarter_final','MetLife Stadium','New York/New Jersey'),
    ('W67','W68','2026-07-19 21:00:00+00','quarter_final','AT&T Stadium','Dallas'),
    ('W69','W70','2026-07-20 18:00:00+00','quarter_final','SoFi Stadium','Los Angeles'),
    ('W71','W72','2026-07-20 21:00:00+00','quarter_final','Hard Rock Stadium','Miami');

  -- Halve finales (22-23 juli)
  INSERT INTO matches ("homeTeamPlaceholder","awayTeamPlaceholder","scheduledAt",phase,stadium,city) VALUES
    ('W73','W74','2026-07-22 21:00:00+00','semi_final','MetLife Stadium','New York/New Jersey'),
    ('W75','W76','2026-07-23 21:00:00+00','semi_final','Rose Bowl','Los Angeles');

  -- Derde plaats (26 juli)
  INSERT INTO matches ("homeTeamPlaceholder","awayTeamPlaceholder","scheduledAt",phase,stadium,city) VALUES
    ('Verliezer HF1','Verliezer HF2','2026-07-26 20:00:00+00','third_place','Hard Rock Stadium','Miami');

  -- Finale (19 juli — MetLife)
  INSERT INTO matches ("homeTeamPlaceholder","awayTeamPlaceholder","scheduledAt",phase,stadium,city) VALUES
    ('Winnaar HF1','Winnaar HF2','2026-07-19 20:00:00+00','final','MetLife Stadium','New York/New Jersey');

END $$;
