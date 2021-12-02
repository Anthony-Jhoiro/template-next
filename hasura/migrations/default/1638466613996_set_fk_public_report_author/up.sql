alter table "public"."report"
  add constraint "report_author_fkey"
  foreign key ("author")
  references "public"."user"
  ("id") on update restrict on delete cascade;
