-- WK 2026 Teams seed — correcte FIFA-loting
-- Bron: ESPN.nl / FIFA officieel speelschema
-- 48 teams, 12 groepen (A t/m L)

INSERT INTO teams ("nameNl", "nameEn", "isoCode", "flagEmoji", "group") VALUES

-- Groep A (Mexico-Stad, Guadalajara, Monterrey)
('Mexico',        'Mexico',       'MX',  '🇲🇽', 'A'),
('Zuid-Afrika',   'South Africa', 'ZA',  '🇿🇦', 'A'),
('Zuid-Korea',    'South Korea',  'KR',  '🇰🇷', 'A'),
('Tsjechië',      'Czech Republic','CZ', '🇨🇿', 'A'),

-- Groep B (Toronto, San Francisco, Los Angeles, Vancouver, Seattle)
('Canada',               'Canada',               'CA',  '🇨🇦', 'B'),
('Bosnië & Herzegovina', 'Bosnia & Herzegovina', 'BA',  '🇧🇦', 'B'),
('Qatar',                'Qatar',                'QA',  '🇶🇦', 'B'),
('Zwitserland',          'Switzerland',          'CH',  '🇨🇭', 'B'),

-- Groep C (New York/NJ, Boston, Philadelphia, Miami, Atlanta)
('Brazilië',  'Brazil',   'BR',  '🇧🇷',              'C'),
('Marokko',   'Morocco',  'MA',  '🇲🇦',              'C'),
('Haïti',     'Haiti',    'HT',  '🇭🇹',              'C'),
('Schotland', 'Scotland', 'SCO', '🏴󠁧󠁢󠁳󠁣󠁴󠁿', 'C'),

-- Groep D (Los Angeles, Vancouver, San Francisco, Seattle)
('VS',         'USA',       'US',  '🇺🇸', 'D'),
('Paraguay',   'Paraguay',  'PY',  '🇵🇾', 'D'),
('Australië',  'Australia', 'AU',  '🇦🇺', 'D'),
('Turkije',    'Turkey',    'TR',  '🇹🇷', 'D'),

-- Groep E (Houston, Philadelphia, Toronto, Kansas City, New York/NJ)
('Duitsland',  'Germany',       'DE',  '🇩🇪', 'E'),
('Curaçao',    'Curaçao',       'CW',  '🇨🇼', 'E'),
('Ivoorkust',  'Ivory Coast',   'CI',  '🇨🇮', 'E'),
('Ecuador',    'Ecuador',       'EC',  '🇪🇨', 'E'),

-- Groep F (Dallas, Monterrey, Houston, Kansas City)
('Nederland',  'Netherlands', 'NL',  '🇳🇱', 'F'),
('Japan',      'Japan',       'JP',  '🇯🇵', 'F'),
('Zweden',     'Sweden',      'SE',  '🇸🇪', 'F'),
('Tunesië',    'Tunisia',     'TN',  '🇹🇳', 'F'),

-- Groep G (Seattle, Los Angeles, Vancouver)
('België',       'Belgium',     'BE',  '🇧🇪', 'G'),
('Egypte',       'Egypt',       'EG',  '🇪🇬', 'G'),
('Iran',         'Iran',        'IR',  '🇮🇷', 'G'),
('Nieuw-Zeeland','New Zealand', 'NZ',  '🇳🇿', 'G'),

-- Groep H (Atlanta, Miami, Houston, Guadalajara)
('Spanje',        'Spain',        'ES',  '🇪🇸', 'H'),
('Kaapverdië',    'Cape Verde',   'CV',  '🇨🇻', 'H'),
('Saoedi-Arabië', 'Saudi Arabia', 'SA',  '🇸🇦', 'H'),
('Uruguay',       'Uruguay',      'UY',  '🇺🇾', 'H'),

-- Groep I (New York/NJ, Boston, Philadelphia, Toronto)
('Frankrijk',  'France',   'FR',  '🇫🇷', 'I'),
('Senegal',    'Senegal',  'SN',  '🇸🇳', 'I'),
('Irak',       'Iraq',     'IQ',  '🇮🇶', 'I'),
('Noorwegen',  'Norway',   'NO',  '🇳🇴', 'I'),

-- Groep J (San Francisco, Kansas City, Dallas)
('Argentinië',  'Argentina', 'AR',  '🇦🇷', 'J'),
('Algerije',    'Algeria',   'DZ',  '🇩🇿', 'J'),
('Oostenrijk',  'Austria',   'AT',  '🇦🇹', 'J'),
('Jordanië',    'Jordan',    'JO',  '🇯🇴', 'J'),

-- Groep K (Houston, Mexico-Stad, Guadalajara, Miami, Atlanta)
('Portugal',   'Portugal',          'PT',  '🇵🇹', 'K'),
('Congo DR',   'DR Congo',          'CD',  '🇨🇩', 'K'),
('Oezbekistan','Uzbekistan',        'UZ',  '🇺🇿', 'K'),
('Colombia',   'Colombia',          'CO',  '🇨🇴', 'K'),

-- Groep L (Dallas, Toronto, Boston, New York/NJ, Philadelphia)
('Engeland',  'England',  'EN',  '🏴󠁧󠁢󠁥󠁮󠁧󠁿', 'L'),
('Kroatië',   'Croatia',  'HR',  '🇭🇷',              'L'),
('Ghana',     'Ghana',    'GH',  '🇬🇭',              'L'),
('Panama',    'Panama',   'PA',  '🇵🇦',              'L');
