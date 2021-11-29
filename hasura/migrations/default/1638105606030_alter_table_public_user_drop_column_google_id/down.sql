alter table "public"."user" add constraint "User_google_id_key" unique (google_id);
alter table "public"."user" alter column "google_id" drop not null;
alter table "public"."user" add column "google_id" varchar;
