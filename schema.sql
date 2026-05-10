-- WK Pool 2026 — database schema
-- Run as: psql -U wkpool_admin -d wkpool_staging -f schema.sql

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE EXTENSION IF NOT EXISTS "citext";

-- Enums
CREATE TYPE user_role AS ENUM ('admin', 'player');
CREATE TYPE account_status AS ENUM ('active', 'suspended', 'deleted');
CREATE TYPE preferred_language AS ENUM ('nl', 'en');
CREATE TYPE world_cup_group AS ENUM ('A','B','C','D','E','F','G','H','I','J','K','L');
CREATE TYPE match_phase AS ENUM ('group','round_of_32','round_of_16','quarter_final','semi_final','third_place','final');
CREATE TYPE match_status AS ENUM ('scheduled','live','finished','postponed');

-- Users
CREATE TABLE users (
  id               UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  email            CITEXT NOT NULL UNIQUE,
  "passwordHash"   TEXT,
  "firstName"      TEXT NOT NULL,
  "lastName"       TEXT NOT NULL,
  role             user_role NOT NULL DEFAULT 'player',
  status           account_status NOT NULL DEFAULT 'active',
  "preferredLanguage" preferred_language NOT NULL DEFAULT 'nl',
  "avatarUrl"      TEXT,
  "totpEnabled"    BOOLEAN NOT NULL DEFAULT FALSE,
  "totpSecret"     TEXT,
  "lastLoginAt"    TIMESTAMPTZ,
  "createdAt"      TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  "updatedAt"      TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  "deletedAt"      TIMESTAMPTZ
);

-- Teams
CREATE TABLE teams (
  id           UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  "nameNl"     TEXT NOT NULL UNIQUE,
  "nameEn"     TEXT NOT NULL UNIQUE,
  "isoCode"    CHAR(2) NOT NULL UNIQUE,
  "flagEmoji"  TEXT,
  "group"      world_cup_group,
  eliminated   BOOLEAN NOT NULL DEFAULT FALSE
);

-- Matches
CREATE TABLE matches (
  id                    UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  "externalId"          TEXT,
  home_team_id          UUID REFERENCES teams(id),
  away_team_id          UUID REFERENCES teams(id),
  "homeTeamPlaceholder" TEXT,
  "awayTeamPlaceholder" TEXT,
  "scheduledAt"         TIMESTAMPTZ NOT NULL,
  phase                 match_phase NOT NULL,
  "group"               TEXT,
  stadium               TEXT,
  city                  TEXT,
  status                match_status NOT NULL DEFAULT 'scheduled',
  "homeScore"           INT,
  "awayScore"           INT,
  "minutesPlayed"       INT,
  "createdAt"           TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  "updatedAt"           TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- Predictions
CREATE TABLE predictions (
  id          UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id     UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  match_id    UUID NOT NULL REFERENCES matches(id) ON DELETE CASCADE,
  "homeScore" INT NOT NULL,
  "awayScore" INT NOT NULL,
  points      INT,
  "createdAt" TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  "updatedAt" TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  UNIQUE(user_id, match_id)
);

-- Indexes
CREATE INDEX idx_matches_scheduled_at ON matches("scheduledAt");
CREATE INDEX idx_matches_status ON matches(status);
CREATE INDEX idx_predictions_user ON predictions(user_id);
CREATE INDEX idx_predictions_match ON predictions(match_id);
