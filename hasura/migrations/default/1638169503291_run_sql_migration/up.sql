CREATE OR REPLACE VIEW "public"."profile" AS 
 SELECT "user".name,
    "user".image,
    "user".created_at,
    "user".id
   FROM "user";
