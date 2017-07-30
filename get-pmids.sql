list all pmids
SELECT DISTINCT pmid 
FROM   documents 
WHERE  pmid IS NOT NULL 
ORDER BY pmid
