.bail on
CREATE TABLE pmid (field1 BIGINT NOT NULL, field2 VARCHAR NOT NULL)
.mode csv
.import pmid.csv pmid

DELETE
FROM DocumentKeywords
WHERE documentid IN
    (SELECT Documents.id
     FROM pmid
     INNER JOIN Documents ON pmid.field1 = Documents.pmid) ;


INSERT INTO DocumentKeywords
SELECT Documents.id,
       pmid.field2
FROM pmid
INNER JOIN Documents ON pmid.field1 = Documents.pmid ;


UPDATE Documents
SET modified = CAST((julianday('now') - 2440587.5)*86400000 AS INTEGER),
    confirmed = "true"
WHERE EXISTS
    (SELECT field1
     FROM pmid
     WHERE Documents.pmid == pmid.field1) ;

UPDATE DocumentVersion
SET version = CAST((julianday('now') - 2440587.5)*86400000 AS INTEGER)
WHERE EXISTS
    (SELECT field1
     FROM pmid inner join Documents
     WHERE  
	 Documents.pmid == pmid.field1
	 AND
	 DocumentVersion.documentId == Documents.id) ;


DROP TABLE pmid;
.exit
