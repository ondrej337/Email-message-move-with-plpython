CREATE OR REPLACE FUNCTION "mycron"."sql_encoding"("var" text)
  RETURNS "pg_catalog"."text" AS $BODY$
	select encode(var::bytea, 'base64');
$BODY$
  LANGUAGE sql VOLATILE
  COST 100
