# Copyright 2026, Mattias Bengtsson <mattias.jc.bengtsson@gmail.com>
# SPDX-License-Identifier: GPL-3.0-only

{ "panic": "<1>"
, "fatal": "<2>"
, "error": "<3>"
, "warn":  "<4>"
, "info":  "<6>"
, "debug": "<7>"
, "trace": "<7>"
}[.level]
+ .msg
+ (if .error then ": " + .error else "" end)
