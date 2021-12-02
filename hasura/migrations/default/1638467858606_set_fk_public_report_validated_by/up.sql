alter table "public"."report" drop constraint "report_validated_by_fkey",
  add constraint "report_validated_by_fkey"
  foreign key ("validated_by")
  references "public"."user"
  ("id") on update restrict on delete set null;
