CREATE TABLE "public"."report_image" ("id" uuid NOT NULL DEFAULT gen_random_uuid(), "link" varchar NOT NULL, "report" uuid NOT NULL, PRIMARY KEY ("id") , FOREIGN KEY ("report") REFERENCES "public"."report"("id") ON UPDATE restrict ON DELETE cascade);
CREATE EXTENSION IF NOT EXISTS pgcrypto;
