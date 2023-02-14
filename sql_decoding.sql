CREATE OR REPLACE FUNCTION "mycron"."sql_decoding"("var" text)
  RETURNS "pg_catalog"."text" AS $BODY$
	select convert_from(decode(var, 'base64'), 'UTF8');
$BODY$
  LANGUAGE sql VOLATILE
  COST 100
