INSERT OR IGNORE 
INTO DocumentTags 
SELECT     Documents.id , 
           "PubMed-not-MEDLINE" 
FROM       pmnotmedline
INNER JOIN Documents 
ON         pmnotmedline.field1 = Documents.pmid
