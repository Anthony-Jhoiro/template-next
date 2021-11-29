alter table "public"."account"
  add constraint "account_user_id_fkey"
  foreign key ("user_id")
  references "public"."user"
  ("id") on update restrict on delete cascade;
