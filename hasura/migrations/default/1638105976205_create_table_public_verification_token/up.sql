CREATE TABLE "public"."verification_token" ("token" varchar NOT NULL, "expires" timestamptz NOT NULL, "identifier" varchar NOT NULL, PRIMARY KEY ("token") , UNIQUE ("token"));
