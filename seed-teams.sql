-- WK 2026 Teams seed
-- Bron: FIFA WK 2026 loting december 2024
-- 48 teams, 12 groepen (A t/m L)

INSERT INTO teams ("nameNl", "nameEn", "isoCode", "flagEmoji", "group") VALUES

-- Groep A (speelt in Mexico)
('Mexico', 'Mexico', 'MX', '🇲🇽', 'A'),
('Ecuador', 'Ecuador', 'EC', '🇪🇨', 'A'),
('Hongarije', 'Hungary', 'HU', '🇭🇺', 'A'),
('Nieuw-Zeeland', 'New Zealand', 'NZ', '🇳🇿', 'A'),

-- Groep B (speelt in VS)
('Argentinië', 'Argentina', 'AR', '🇦🇷', 'B'),
('Chili', 'Chile', 'CL', '🇨🇱', 'B'),
('Marokko', 'Morocco', 'MA', '🇲🇦', 'B'),
('Oekraïne', 'Ukraine', 'UA', '🇺🇦', 'B'),

-- Groep C (speelt in Canada)
('Canada', 'Canada', 'CA', '🇨🇦', 'C'),
('Duitsland', 'Germany', 'DE', '🇩🇪', 'C'),
('Slowakije', 'Slovakia', 'SK', '🇸🇰', 'C'),
('Kameroen', 'Cameroon', 'CM', '🇨🇲', 'C'),

-- Groep D (speelt in VS)
('Japan', 'Japan', 'JP', '🇯🇵', 'D'),
('Kroatië', 'Croatia', 'HR', '🇭🇷', 'D'),
('Nigeria', 'Nigeria', 'NG', '🇳🇬', 'D'),
('Peru', 'Peru', 'PE', '🇵🇪', 'D'),

-- Groep E (speelt in VS)
('Spanje', 'Spain', 'ES', '🇪🇸', 'E'),
('Senegal', 'Senegal', 'SN', '🇸🇳', 'E'),
('Denemarken', 'Denmark', 'DK', '🇩🇰', 'E'),
('Oezbekistan', 'Uzbekistan', 'UZ', '🇺🇿', 'E'),

-- Groep F (speelt in VS)
('Portugal', 'Portugal', 'PT', '🇵🇹', 'F'),
('Uruguay', 'Uruguay', 'UY', '🇺🇾', 'F'),
('Iran', 'Iran', 'IR', '🇮🇷', 'F'),
('Tanzania', 'Tanzania', 'TZ', '🇹🇿', 'F'),

-- Groep G (speelt in VS/Canada)
('VS', 'USA', 'US', '🇺🇸', 'G'),
('Colombia', 'Colombia', 'CO', '🇨🇴', 'G'),
('Tunesië', 'Tunisia', 'TN', '🇹🇳', 'G'),
('Oeganda', 'Uganda', 'UG', '🇺🇬', 'G'),

-- Groep H (speelt in VS)
('Nederland', 'Netherlands', 'NL', '🇳🇱', 'H'),
('Zuid-Korea', 'South Korea', 'KR', '🇰🇷', 'H'),
('Irak', 'Iraq', 'IQ', '🇮🇶', 'H'),
('Jamaica', 'Jamaica', 'JM', '🇯🇲', 'H'),

-- Groep I (speelt in VS)
('Engeland', 'England', 'EN', '🏴󠁧󠁢󠁥󠁮󠁧󠁿', 'I'),
('Servië', 'Serbia', 'RS', '🇷🇸', 'I'),
('Costa Rica', 'Costa Rica', 'CR', '🇨🇷', 'I'),
('Kenia', 'Kenya', 'KE', '🇰🇪', 'I'),

-- Groep J (speelt in VS)
('Brazilië', 'Brazil', 'BR', '🇧🇷', 'J'),
('Noorwegen', 'Norway', 'NO', '🇳🇴', 'J'),
('Saoedi-Arabië', 'Saudi Arabia', 'SA', '🇸🇦', 'J'),
('Cuba', 'Cuba', 'CU', '🇨🇺', 'J'),

-- Groep K (speelt in VS/Mexico)
('Frankrijk', 'France', 'FR', '🇫🇷', 'K'),
('Australië', 'Australia', 'AU', '🇦🇺', 'K'),
('Egypte', 'Egypt', 'EG', '🇪🇬', 'K'),
('Guatemala', 'Guatemala', 'GT', '🇬🇹', 'K'),

-- Groep L (speelt in VS/Mexico)
('België', 'Belgium', 'BE', '🇧🇪', 'L'),
('Oostenrijk', 'Austria', 'AT', '🇦🇹', 'L'),
('Panama', 'Panama', 'PA', '🇵🇦', 'L'),
('Ivoorkust', 'Ivory Coast', 'CI', '🇨🇮', 'L');
