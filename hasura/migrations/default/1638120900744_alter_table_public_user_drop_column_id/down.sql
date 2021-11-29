comment on column "public"."user"."id" is E'The User model is for information such as the user\'s name and email address.  Email address is optional, but if one is specified for a User then it must be unique.';
alter table "public"."user" alter column "id" drop not null;
alter table "public"."user" add column "id" varchar;
