# mendeley-medline-update
Update Mendeley keywords from medline (pubmed)

In Windows, the Mendeley database is at %localappdata%\Mendeley Ltd\Mendeley Desktop\yourname@gmail.com@www.mendeley.com.sqlite where you replace *yourname@gmail.com* with the email you used to register Mendeley.

Use DB Browser for SQLite to access the Mendeley database.

Steps to update Mendeley database.

1. Run the code in get-pmids.sql to obtain a text file listing all the PMIDs in the database.
2. Use [Batch Entrez](https://www.ncbi.nlm.nih.gov/sites/batchentrez), using the Database Pubmed to obtain a listing of all the references.
3. Change the format of the results to *Medline*, then select *send to file*.
4. Run pmid-keywords.awk with the file saved in step 3, and output to a file named pmd.csv.
5. Either run update-keywords.sql to update the database or, in DB Browser, import the csv file and go through each of the sql statements one-by-one to update the database.
6. To flag references without a PMID, run notmedline.awk on the file saved in step 3, output to a csv file. Import into the database with the table name pmnotmedline. Then run update-nopmid.sql.

