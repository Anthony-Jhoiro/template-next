comment on column "public"."account"."user_id" is E'The Account model is for information about OAuth accounts associated with a User. It will usually contain access_token, id_token and other OAuth specific data. TokenSet from openid-client might give you an idea of all the fields.';
alter table "public"."account" alter column "user_id" drop not null;
alter table "public"."account" add column "user_id" varchar;
