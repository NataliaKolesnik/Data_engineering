CREATE TABLE "laureates" (
  "id" int PRIMARY KEY,
  "laureate_type_id" int,
  "full_name" varchar,
  "sex_id" int,
  "birth_ind_date" date,
  "birth_city_id" int,
  "birth_country_id" int,
  "death_date" date,
  "death_city_id" int,
  "death_country_id" int,
  "organization_id" int,
  "country_id" int
);

CREATE TABLE "nobe_prize" (
  "id" int PRIMARY KEY,
  "year" int,
  "laureate_id" int,
  "category_prize_id" int,
  "motivation" text,
  "prize_share" real
);

CREATE TABLE "cities" (
  "id" int PRIMARY KEY,
  "name_city" varchar,
  "region" varchar,
  "population" int,
  "latitude" real,
  "longitude" real
);

CREATE TABLE "countries" (
  "id" int PRIMARY KEY,
  "name_country" varchar,
  "region_2ch" varchar,
  "region_3ch" varchar,
  "phone_cod" int,
  "currency_id" int,
  "continent_id" int,
  "population" real,
  "area" real,
  "coastline" real,
  "net_migration" real,
  "infant_mortality" real,
  "gdp" real,
  "literacy" real,
  "phones" real,
  "arable" real,
  "crops" real,
  "other" real,
  "climate_id" int,
  "birthrate" real,
  "deathrat" real,
  "agriculture" real,
  "industry" real,
  "service" real
);

CREATE TABLE "sex" (
  "id" int PRIMARY KEY,
  "type_sex" varchar
);

CREATE TABLE "laureate_type" (
  "id" int PRIMARY KEY,
  "name_laureate_type" varchar
);

CREATE TABLE "category_prize" (
  "id" int PRIMARY KEY,
  "name_category_prize" varchar
);

CREATE TABLE "organizations" (
  "id" int PRIMARY KEY,
  "organization_name" varchar,
  "organization_city" int,
  "organization_country" int
);

CREATE TABLE "currencies" (
  "id" int PRIMARY KEY,
  "name_currency" varchar
);

CREATE TABLE "continents" (
  "id" int PRIMARY KEY,
  "name_continent" varchar
);

CREATE TABLE "climate_zones" (
  "id" int PRIMARY KEY,
  "climate_zone" int
);

ALTER TABLE "laureates" ADD FOREIGN KEY ("birth_city_id") REFERENCES "cities" ("id");

ALTER TABLE "laureates" ADD FOREIGN KEY ("birth_country_id") REFERENCES "countries" ("id");

ALTER TABLE "laureates" ADD FOREIGN KEY ("death_city_id") REFERENCES "cities" ("id");

ALTER TABLE "laureates" ADD FOREIGN KEY ("death_country_id") REFERENCES "countries" ("id");

ALTER TABLE "laureates" ADD FOREIGN KEY ("sex_id") REFERENCES "sex" ("id");

ALTER TABLE "laureates" ADD FOREIGN KEY ("laureate_type_id") REFERENCES "laureate_type" ("id");

ALTER TABLE "laureates" ADD FOREIGN KEY ("organization_id") REFERENCES "organizations" ("id");

ALTER TABLE "laureates" ADD FOREIGN KEY ("country_id") REFERENCES "countries" ("id");

ALTER TABLE "nobe_prize" ADD FOREIGN KEY ("laureate_id") REFERENCES "laureates" ("id");

ALTER TABLE "nobe_prize" ADD FOREIGN KEY ("category_prize_id") REFERENCES "category_prize" ("id");

ALTER TABLE "countries" ADD FOREIGN KEY ("currency_id") REFERENCES "currencies" ("id");

ALTER TABLE "countries" ADD FOREIGN KEY ("continent_id") REFERENCES "continents" ("id");

ALTER TABLE "countries" ADD FOREIGN KEY ("climate_id") REFERENCES "climate_zones" ("id");

ALTER TABLE "organizations" ADD FOREIGN KEY ("organization_city") REFERENCES "cities" ("id");

ALTER TABLE "organizations" ADD FOREIGN KEY ("organization_country") REFERENCES "countries" ("id");
