-- WK 2026 Wedstrijdschema — correcte ESPN/FIFA data
-- Alle tijden in UTC (ESPN-tijden zijn CET/CEST = UTC+2, dus -2u)
-- WK start 11 juni 2026, finale 19 juli 2026
-- Stadia: Azteca (MEX), AKRON (GDL), Monterrey (MTY),
--   MetLife (NJ), AT&T (DAL), SoFi (LA), Rose Bowl (LA),
--   Hard Rock (MIA), Levi's (SF), Gillette (BOS),
--   Lincoln Financial (PHI), Arrowhead (KC),
--   BC Place (VAN), BMO Field (TOR), Lumen Field (SEA),
--   NRG (HOU), Mercedes-Benz (ATL)

DO $$
DECLARE
  -- Groep A
  mx UUID; za UUID; kr UUID; cz UUID;
  -- Groep B
  ca UUID; ba UUID; qa UUID; ch UUID;
  -- Groep C
  br UUID; ma UUID; ht UUID; sco UUID;
  -- Groep D
  us UUID; py UUID; au UUID; tr UUID;
  -- Groep E
  de UUID; cw UUID; ci UUID; ec UUID;
  -- Groep F
  nl UUID; jp UUID; se UUID; tn UUID;
  -- Groep G
  be UUID; eg UUID; ir UUID; nz UUID;
  -- Groep H
  es UUID; cv UUID; sa UUID; uy UUID;
  -- Groep I
  fr UUID; sn UUID; iq UUID; no UUID;
  -- Groep J
  ar UUID; dz UUID; at UUID; jo UUID;
  -- Groep K
  pt UUID; cd UUID; uz UUID; co UUID;
  -- Groep L
  en UUID; hr UUID; gh UUID; pa UUID;
BEGIN
  SELECT id INTO mx  FROM teams WHERE "isoCode"='MX';
  SELECT id INTO za  FROM teams WHERE "isoCode"='ZA';
  SELECT id INTO kr  FROM teams WHERE "isoCode"='KR';
  SELECT id INTO cz  FROM teams WHERE "isoCode"='CZ';
  SELECT id INTO ca  FROM teams WHERE "isoCode"='CA';
  SELECT id INTO ba  FROM teams WHERE "isoCode"='BA';
  SELECT id INTO qa  FROM teams WHERE "isoCode"='QA';
  SELECT id INTO ch  FROM teams WHERE "isoCode"='CH';
  SELECT id INTO br  FROM teams WHERE "isoCode"='BR';
  SELECT id INTO ma  FROM teams WHERE "isoCode"='MA';
  SELECT id INTO ht  FROM teams WHERE "isoCode"='HT';
  SELECT id INTO sco FROM teams WHERE "isoCode"='SCO';
  SELECT id INTO us  FROM teams WHERE "isoCode"='US';
  SELECT id INTO py  FROM teams WHERE "isoCode"='PY';
  SELECT id INTO au  FROM teams WHERE "isoCode"='AU';
  SELECT id INTO tr  FROM teams WHERE "isoCode"='TR';
  SELECT id INTO de  FROM teams WHERE "isoCode"='DE';
  SELECT id INTO cw  FROM teams WHERE "isoCode"='CW';
  SELECT id INTO ci  FROM teams WHERE "isoCode"='CI';
  SELECT id INTO ec  FROM teams WHERE "isoCode"='EC';
  SELECT id INTO nl  FROM teams WHERE "isoCode"='NL';
  SELECT id INTO jp  FROM teams WHERE "isoCode"='JP';
  SELECT id INTO se  FROM teams WHERE "isoCode"='SE';
  SELECT id INTO tn  FROM teams WHERE "isoCode"='TN';
  SELECT id INTO be  FROM teams WHERE "isoCode"='BE';
  SELECT id INTO eg  FROM teams WHERE "isoCode"='EG';
  SELECT id INTO ir  FROM teams WHERE "isoCode"='IR';
  SELECT id INTO nz  FROM teams WHERE "isoCode"='NZ';
  SELECT id INTO es  FROM teams WHERE "isoCode"='ES';
  SELECT id INTO cv  FROM teams WHERE "isoCode"='CV';
  SELECT id INTO sa  FROM teams WHERE "isoCode"='SA';
  SELECT id INTO uy  FROM teams WHERE "isoCode"='UY';
  SELECT id INTO fr  FROM teams WHERE "isoCode"='FR';
  SELECT id INTO sn  FROM teams WHERE "isoCode"='SN';
  SELECT id INTO iq  FROM teams WHERE "isoCode"='IQ';
  SELECT id INTO no  FROM teams WHERE "isoCode"='NO';
  SELECT id INTO ar  FROM teams WHERE "isoCode"='AR';
  SELECT id INTO dz  FROM teams WHERE "isoCode"='DZ';
  SELECT id INTO at  FROM teams WHERE "isoCode"='AT';
  SELECT id INTO jo  FROM teams WHERE "isoCode"='JO';
  SELECT id INTO pt  FROM teams WHERE "isoCode"='PT';
  SELECT id INTO cd  FROM teams WHERE "isoCode"='CD';
  SELECT id INTO uz  FROM teams WHERE "isoCode"='UZ';
  SELECT id INTO co  FROM teams WHERE "isoCode"='CO';
  SELECT id INTO en  FROM teams WHERE "isoCode"='EN';
  SELECT id INTO hr  FROM teams WHERE "isoCode"='HR';
  SELECT id INTO gh  FROM teams WHERE "isoCode"='GH';
  SELECT id INTO pa  FROM teams WHERE "isoCode"='PA';

  -- ============================================================
  -- GROEPSFASE SPEELDAG 1
  -- ============================================================

  -- Groep A: 11-12 juni
  INSERT INTO matches (home_team_id,away_team_id,"scheduledAt",phase,"group",stadium,city) VALUES
    (mx, za, '2026-06-11 19:00:00+00','group','A','Estadio Azteca','Mexico-Stad'),
    (kr, cz, '2026-06-12 02:00:00+00','group','A','Estadio AKRON','Guadalajara');

  -- Groep B: 12-13 juni
  INSERT INTO matches (home_team_id,away_team_id,"scheduledAt",phase,"group",stadium,city) VALUES
    (ca, ba, '2026-06-12 19:00:00+00','group','B','BMO Field','Toronto'),
    (qa, ch, '2026-06-13 19:00:00+00','group','B','Levi''s Stadium','San Francisco');

  -- Groep D: 13 juni
  INSERT INTO matches (home_team_id,away_team_id,"scheduledAt",phase,"group",stadium,city) VALUES
    (us, py, '2026-06-13 01:00:00+00','group','D','SoFi Stadium','Los Angeles'),
    (au, tr, '2026-06-13 04:00:00+00','group','D','BC Place','Vancouver');

  -- Groep C: 13-14 juni
  INSERT INTO matches (home_team_id,away_team_id,"scheduledAt",phase,"group",stadium,city) VALUES
    (br, ma, '2026-06-13 22:00:00+00','group','C','MetLife Stadium','New York/New Jersey'),
    (ht, sco,'2026-06-14 01:00:00+00','group','C','Gillette Stadium','Boston');

  -- Groep E: 14 juni
  INSERT INTO matches (home_team_id,away_team_id,"scheduledAt",phase,"group",stadium,city) VALUES
    (de, cw, '2026-06-14 17:00:00+00','group','E','NRG Stadium','Houston'),
    (ci, ec, '2026-06-14 23:00:00+00','group','E','Lincoln Financial Field','Philadelphia');

  -- Groep F: 14-15 juni
  INSERT INTO matches (home_team_id,away_team_id,"scheduledAt",phase,"group",stadium,city) VALUES
    (nl, jp, '2026-06-14 20:00:00+00','group','F','AT&T Stadium','Dallas'),
    (se, tn, '2026-06-15 02:00:00+00','group','F','Estadio Monterrey','Monterrey');

  -- Groep H: 15 juni
  INSERT INTO matches (home_team_id,away_team_id,"scheduledAt",phase,"group",stadium,city) VALUES
    (es, cv, '2026-06-15 16:00:00+00','group','H','Mercedes-Benz Stadium','Atlanta'),
    (sa, uy, '2026-06-15 22:00:00+00','group','H','Hard Rock Stadium','Miami');

  -- Groep G: 15-16 juni
  INSERT INTO matches (home_team_id,away_team_id,"scheduledAt",phase,"group",stadium,city) VALUES
    (be, eg, '2026-06-15 19:00:00+00','group','G','Lumen Field','Seattle'),
    (ir, nz, '2026-06-16 01:00:00+00','group','G','SoFi Stadium','Los Angeles');

  -- Groep J: 16 juni
  INSERT INTO matches (home_team_id,away_team_id,"scheduledAt",phase,"group",stadium,city) VALUES
    (at, jo, '2026-06-16 04:00:00+00','group','J','Levi''s Stadium','San Francisco'),
    (fr, sn, '2026-06-16 19:00:00+00','group','I','MetLife Stadium','New York/New Jersey');

  -- Groep I: 16 juni
  INSERT INTO matches (home_team_id,away_team_id,"scheduledAt",phase,"group",stadium,city) VALUES
    (iq, no, '2026-06-16 22:00:00+00','group','I','Gillette Stadium','Boston');

  -- Groep J: 17 juni
  INSERT INTO matches (home_team_id,away_team_id,"scheduledAt",phase,"group",stadium,city) VALUES
    (ar, dz, '2026-06-17 01:00:00+00','group','J','Arrowhead Stadium','Kansas City');

  -- Groep K: 17 juni
  INSERT INTO matches (home_team_id,away_team_id,"scheduledAt",phase,"group",stadium,city) VALUES
    (pt, cd, '2026-06-17 17:00:00+00','group','K','NRG Stadium','Houston'),
    (en, hr, '2026-06-17 20:00:00+00','group','L','AT&T Stadium','Dallas');

  -- Groep L: 17-18 juni
  INSERT INTO matches (home_team_id,away_team_id,"scheduledAt",phase,"group",stadium,city) VALUES
    (gh, pa, '2026-06-17 23:00:00+00','group','L','BMO Field','Toronto'),
    (uz, co, '2026-06-18 02:00:00+00','group','K','Estadio Azteca','Mexico-Stad');

  -- ============================================================
  -- GROEPSFASE SPEELDAG 2
  -- ============================================================

  -- Groep A: 18-19 juni
  INSERT INTO matches (home_team_id,away_team_id,"scheduledAt",phase,"group",stadium,city) VALUES
    (cz, za, '2026-06-18 16:00:00+00','group','A','Mercedes-Benz Stadium','Atlanta'),
    (ca, qa, '2026-06-18 22:00:00+00','group','B','BC Place','Vancouver'),
    (ch, ba, '2026-06-18 19:00:00+00','group','B','SoFi Stadium','Los Angeles'),
    (mx, kr, '2026-06-19 01:00:00+00','group','A','Estadio AKRON','Guadalajara');

  -- Groep D: 19 juni
  INSERT INTO matches (home_team_id,away_team_id,"scheduledAt",phase,"group",stadium,city) VALUES
    (tr, py, '2026-06-19 04:00:00+00','group','D','Levi''s Stadium','San Francisco'),
    (us, au, '2026-06-19 19:00:00+00','group','D','Lumen Field','Seattle');

  -- Groep C: 19-20 juni
  INSERT INTO matches (home_team_id,away_team_id,"scheduledAt",phase,"group",stadium,city) VALUES
    (sco,ma, '2026-06-19 22:00:00+00','group','C','Gillette Stadium','Boston'),
    (br, ht, '2026-06-20 01:00:00+00','group','C','Lincoln Financial Field','Philadelphia');

  -- Groep F: 20 juni
  INSERT INTO matches (home_team_id,away_team_id,"scheduledAt",phase,"group",stadium,city) VALUES
    (tn, jp, '2026-06-20 04:00:00+00','group','F','Estadio Monterrey','Monterrey'),
    (nl, se, '2026-06-20 17:00:00+00','group','F','NRG Stadium','Houston');

  -- Groep E: 20-21 juni
  INSERT INTO matches (home_team_id,away_team_id,"scheduledAt",phase,"group",stadium,city) VALUES
    (de, ci, '2026-06-20 20:00:00+00','group','E','BMO Field','Toronto'),
    (ec, cw, '2026-06-21 00:00:00+00','group','E','Arrowhead Stadium','Kansas City');

  -- Groep G: 21-22 juni
  INSERT INTO matches (home_team_id,away_team_id,"scheduledAt",phase,"group",stadium,city) VALUES
    (be, ir, '2026-06-21 19:00:00+00','group','G','SoFi Stadium','Los Angeles'),
    (nz, eg, '2026-06-22 01:00:00+00','group','G','BC Place','Vancouver');

  -- Groep H: 21-22 juni
  INSERT INTO matches (home_team_id,away_team_id,"scheduledAt",phase,"group",stadium,city) VALUES
    (es, sa, '2026-06-21 16:00:00+00','group','H','Mercedes-Benz Stadium','Atlanta'),
    (uy, cv, '2026-06-21 22:00:00+00','group','H','Hard Rock Stadium','Miami');

  -- Groep I: 22-23 juni
  INSERT INTO matches (home_team_id,away_team_id,"scheduledAt",phase,"group",stadium,city) VALUES
    (fr, iq, '2026-06-22 21:00:00+00','group','I','Lincoln Financial Field','Philadelphia'),
    (no, sn, '2026-06-23 00:00:00+00','group','I','MetLife Stadium','New York/New Jersey');

  -- Groep J: 22-23 juni
  INSERT INTO matches (home_team_id,away_team_id,"scheduledAt",phase,"group",stadium,city) VALUES
    (ar, at, '2026-06-22 17:00:00+00','group','J','AT&T Stadium','Dallas'),
    (jo, dz, '2026-06-23 03:00:00+00','group','J','Levi''s Stadium','San Francisco');

  -- Groep K: 23-24 juni
  INSERT INTO matches (home_team_id,away_team_id,"scheduledAt",phase,"group",stadium,city) VALUES
    (pt, uz, '2026-06-23 17:00:00+00','group','K','NRG Stadium','Houston'),
    (co, cd, '2026-06-24 02:00:00+00','group','K','Estadio AKRON','Guadalajara');

  -- Groep L: 23-24 juni
  INSERT INTO matches (home_team_id,away_team_id,"scheduledAt",phase,"group",stadium,city) VALUES
    (en, gh, '2026-06-23 20:00:00+00','group','L','Gillette Stadium','Boston'),
    (pa, hr, '2026-06-23 23:00:00+00','group','L','BMO Field','Toronto');

  -- ============================================================
  -- GROEPSFASE SPEELDAG 3 (simultaan per groep)
  -- ============================================================

  -- Groep B: 24 juni (simultaan)
  INSERT INTO matches (home_team_id,away_team_id,"scheduledAt",phase,"group",stadium,city) VALUES
    (ch, ca, '2026-06-24 19:00:00+00','group','B','BC Place','Vancouver'),
    (ba, qa, '2026-06-24 19:00:00+00','group','B','Lumen Field','Seattle');

  -- Groep A: 25 juni (simultaan)
  INSERT INTO matches (home_team_id,away_team_id,"scheduledAt",phase,"group",stadium,city) VALUES
    (cz, mx, '2026-06-25 01:00:00+00','group','A','Estadio Azteca','Mexico-Stad'),
    (za, kr, '2026-06-25 01:00:00+00','group','A','Estadio Monterrey','Monterrey');

  -- Groep E: 25 juni (simultaan)
  INSERT INTO matches (home_team_id,away_team_id,"scheduledAt",phase,"group",stadium,city) VALUES
    (ec, de, '2026-06-25 20:00:00+00','group','E','MetLife Stadium','New York/New Jersey'),
    (cw, ci, '2026-06-25 20:00:00+00','group','E','Lincoln Financial Field','Philadelphia');

  -- Groep F: 25-26 juni (simultaan)
  INSERT INTO matches (home_team_id,away_team_id,"scheduledAt",phase,"group",stadium,city) VALUES
    (jp, se, '2026-06-25 23:00:00+00','group','F','AT&T Stadium','Dallas'),
    (tn, nl, '2026-06-25 23:00:00+00','group','F','Arrowhead Stadium','Kansas City');

  -- Groep C: 24 juni (simultaan)
  INSERT INTO matches (home_team_id,away_team_id,"scheduledAt",phase,"group",stadium,city) VALUES
    (sco,br, '2026-06-24 22:00:00+00','group','C','Hard Rock Stadium','Miami'),
    (ma, ht, '2026-06-24 22:00:00+00','group','C','Mercedes-Benz Stadium','Atlanta');

  -- Groep D: 26 juni (simultaan)
  INSERT INTO matches (home_team_id,away_team_id,"scheduledAt",phase,"group",stadium,city) VALUES
    (tr, us, '2026-06-26 02:00:00+00','group','D','SoFi Stadium','Los Angeles'),
    (py, au, '2026-06-26 02:00:00+00','group','D','Levi''s Stadium','San Francisco');

  -- Groep I: 26 juni (simultaan)
  INSERT INTO matches (home_team_id,away_team_id,"scheduledAt",phase,"group",stadium,city) VALUES
    (no, fr, '2026-06-26 19:00:00+00','group','I','Gillette Stadium','Boston'),
    (sn, iq, '2026-06-26 19:00:00+00','group','I','BMO Field','Toronto');

  -- Groep G: 27 juni (simultaan)
  INSERT INTO matches (home_team_id,away_team_id,"scheduledAt",phase,"group",stadium,city) VALUES
    (eg, ir, '2026-06-27 03:00:00+00','group','G','Lumen Field','Seattle'),
    (nz, be, '2026-06-27 03:00:00+00','group','G','BC Place','Vancouver');

  -- Groep H: 27 juni (simultaan)
  INSERT INTO matches (home_team_id,away_team_id,"scheduledAt",phase,"group",stadium,city) VALUES
    (cv, sa, '2026-06-27 00:00:00+00','group','H','NRG Stadium','Houston'),
    (uy, es, '2026-06-27 00:00:00+00','group','H','Estadio AKRON','Guadalajara');

  -- Groep L: 27 juni (simultaan)
  INSERT INTO matches (home_team_id,away_team_id,"scheduledAt",phase,"group",stadium,city) VALUES
    (pa, en, '2026-06-27 21:00:00+00','group','L','MetLife Stadium','New York/New Jersey'),
    (hr, gh, '2026-06-27 21:00:00+00','group','L','Lincoln Financial Field','Philadelphia');

  -- Groep K: 27-28 juni (simultaan)
  INSERT INTO matches (home_team_id,away_team_id,"scheduledAt",phase,"group",stadium,city) VALUES
    (co, pt, '2026-06-27 23:30:00+00','group','K','Hard Rock Stadium','Miami'),
    (cd, uz, '2026-06-27 23:30:00+00','group','K','Mercedes-Benz Stadium','Atlanta');

  -- Groep J: 28 juni (simultaan)
  INSERT INTO matches (home_team_id,away_team_id,"scheduledAt",phase,"group",stadium,city) VALUES
    (dz, at, '2026-06-28 02:00:00+00','group','J','Arrowhead Stadium','Kansas City'),
    (jo, ar, '2026-06-28 02:00:00+00','group','J','AT&T Stadium','Dallas');

  -- ============================================================
  -- KNOCKOUT FASE — Ronde van 32 (29 juni – 6 juli)
  -- Placeholders: teams nog onbekend
  -- ============================================================

  INSERT INTO matches ("homeTeamPlaceholder","awayTeamPlaceholder","scheduledAt",phase,stadium,city) VALUES
    ('1A','2B','2026-06-29 19:00:00+00','round_of_32','MetLife Stadium','New York/New Jersey'),
    ('1B','2A','2026-06-29 22:00:00+00','round_of_32','AT&T Stadium','Dallas'),
    ('1C','2D','2026-06-30 19:00:00+00','round_of_32','SoFi Stadium','Los Angeles'),
    ('1D','2C','2026-06-30 22:00:00+00','round_of_32','Hard Rock Stadium','Miami'),
    ('1E','2F','2026-07-01 19:00:00+00','round_of_32','Levi''s Stadium','San Francisco'),
    ('1F','2E','2026-07-01 22:00:00+00','round_of_32','Gillette Stadium','Boston'),
    ('1G','2H','2026-07-02 19:00:00+00','round_of_32','Lincoln Financial Field','Philadelphia'),
    ('1H','2G','2026-07-02 22:00:00+00','round_of_32','Arrowhead Stadium','Kansas City'),
    ('1I','2J','2026-07-03 19:00:00+00','round_of_32','BC Place','Vancouver'),
    ('1J','2I','2026-07-03 22:00:00+00','round_of_32','BMO Field','Toronto'),
    ('1K','2L','2026-07-04 19:00:00+00','round_of_32','Rose Bowl','Los Angeles'),
    ('1L','2K','2026-07-04 22:00:00+00','round_of_32','Estadio Azteca','Mexico-Stad'),
    ('3e best 1','3e best 2','2026-07-05 19:00:00+00','round_of_32','NRG Stadium','Houston'),
    ('3e best 3','3e best 4','2026-07-05 22:00:00+00','round_of_32','Mercedes-Benz Stadium','Atlanta'),
    ('3e best 5','3e best 6','2026-07-06 19:00:00+00','round_of_32','Lumen Field','Seattle'),
    ('3e best 7','3e best 8','2026-07-06 22:00:00+00','round_of_32','Estadio Monterrey','Monterrey');

  -- ============================================================
  -- Achtste finales / Ronde van 16 (7–10 juli)
  -- ============================================================

  INSERT INTO matches ("homeTeamPlaceholder","awayTeamPlaceholder","scheduledAt",phase,stadium,city) VALUES
    ('W1','W2','2026-07-07 19:00:00+00','round_of_16','MetLife Stadium','New York/New Jersey'),
    ('W3','W4','2026-07-07 22:00:00+00','round_of_16','AT&T Stadium','Dallas'),
    ('W5','W6','2026-07-08 19:00:00+00','round_of_16','SoFi Stadium','Los Angeles'),
    ('W7','W8','2026-07-08 22:00:00+00','round_of_16','Hard Rock Stadium','Miami'),
    ('W9','W10','2026-07-09 19:00:00+00','round_of_16','Levi''s Stadium','San Francisco'),
    ('W11','W12','2026-07-09 22:00:00+00','round_of_16','Gillette Stadium','Boston'),
    ('W13','W14','2026-07-10 19:00:00+00','round_of_16','Lincoln Financial Field','Philadelphia'),
    ('W15','W16','2026-07-10 22:00:00+00','round_of_16','Arrowhead Stadium','Kansas City');

  -- ============================================================
  -- Kwartfinales (11–12 juli)
  -- ============================================================

  INSERT INTO matches ("homeTeamPlaceholder","awayTeamPlaceholder","scheduledAt",phase,stadium,city) VALUES
    ('W17','W18','2026-07-11 19:00:00+00','quarter_final','MetLife Stadium','New York/New Jersey'),
    ('W19','W20','2026-07-11 22:00:00+00','quarter_final','AT&T Stadium','Dallas'),
    ('W21','W22','2026-07-12 19:00:00+00','quarter_final','SoFi Stadium','Los Angeles'),
    ('W23','W24','2026-07-12 22:00:00+00','quarter_final','Hard Rock Stadium','Miami');

  -- ============================================================
  -- Halve finales (14–15 juli)
  -- ============================================================

  INSERT INTO matches ("homeTeamPlaceholder","awayTeamPlaceholder","scheduledAt",phase,stadium,city) VALUES
    ('W25','W26','2026-07-14 22:00:00+00','semi_final','MetLife Stadium','New York/New Jersey'),
    ('W27','W28','2026-07-15 22:00:00+00','semi_final','Rose Bowl','Los Angeles');

  -- ============================================================
  -- Derde-plaatswedstrijd (18 juli)
  -- ============================================================

  INSERT INTO matches ("homeTeamPlaceholder","awayTeamPlaceholder","scheduledAt",phase,stadium,city) VALUES
    ('Verliezer HF1','Verliezer HF2','2026-07-18 20:00:00+00','third_place','Hard Rock Stadium','Miami');

  -- ============================================================
  -- FINALE (19 juli — MetLife Stadium, New York/New Jersey)
  -- ============================================================

  INSERT INTO matches ("homeTeamPlaceholder","awayTeamPlaceholder","scheduledAt",phase,stadium,city) VALUES
    ('Winnaar HF1','Winnaar HF2','2026-07-19 19:00:00+00','final','MetLife Stadium','New York/New Jersey');

END $$;
