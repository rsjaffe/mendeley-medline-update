#!/usr/bin/gawk -f
function rtrim(s) { sub(/[ \t\r\n]+$/, "", s); return s }
BEGIN {
  FIELDWIDTHS = "6 150"
}

$1 == "PMID- " {
  PMID = rtrim($2)
  next
}

$1 == "MH  - " {
  gsub(/,/, ":", $2)
  gsub(/\*/, "", $2)
  print PMID ",\"" rtrim($2) "\""
  next
}

{next}
