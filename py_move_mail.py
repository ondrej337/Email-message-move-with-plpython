CREATE OR REPLACE FUNCTION "mycron"."py_move_mail"("p_idmail" int4, "p_group" bpchar='A'::bpchar, "p_day" int4=5)
  RETURNS "pg_catalog"."void" AS $BODY$
from imap_tools import MailBox, AND
from datetime import date, timedelta

query = """
						SELECT my.id_mail as idmail, hostname, email, mycron.sql_decoding(password) as passwd, current_box, destination_box, ub.from, subject 
						FROM mycron.usermail my JOIN mycron.userbox ub on my.id_mail=ub.id_mail 
						WHERE my.id_mail = $1 and ub.group = $2
				"""
plan = plpy.prepare(query, ["int","char"])
rv = plpy.execute(plan,[p_idmail,p_group])

with MailBox(rv[0]["hostname"]).login(rv[0]["email"], rv[0]["passwd"]) as mailbox:
  for r in rv:
    mailbox.folder.set(r["current_box"])
    msgs = mailbox.fetch(AND(from_=r["from"], subject=r["subject"], date_gte=date.today() - timedelta(days = p_day)) ,reverse=True)
    for msg in msgs:
      mailbox.move(msg.uid, r["destination_box"])

$BODY$
  LANGUAGE plpython3u VOLATILE
  COST 100
