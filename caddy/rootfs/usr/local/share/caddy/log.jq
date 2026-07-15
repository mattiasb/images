{ "panic":"<1>"
, "fatal":"<2>"
, "error":"<3>"
, "warn": "<4>"
, "info": "<6>"
, "debug":"<7>"
}[.level]
+ (if .logger then .logger + ": " else "" end)
+ .msg
