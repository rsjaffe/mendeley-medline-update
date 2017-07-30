#!/usr/bin/gawk -f
function rtrim(s) { sub(/[ \t\r\n]+$/, "", s); return s }
BEGIN {
  FIELDWIDTHS = "6 150"
}

$1 == "PMID- " {
  PMID = rtrim($2)
  next
}

$1 == "STAT- " && rtrim($2) == "PubMed-not-MEDLINE" {
  print PMID
  next
}

{next}
