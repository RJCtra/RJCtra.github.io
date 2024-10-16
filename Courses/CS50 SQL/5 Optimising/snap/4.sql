SELECT "u"."username" FROM "users" "u"
    JOIN "messages" "m" ON "u"."id" = "m"."to_user_id"
    GROUP BY "m"."to_user_id"
    ORDER BY COUNT("m"."to_user_id") DESC, "u"."username"
LIMIT 1;



