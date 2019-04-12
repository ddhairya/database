
SELECT	*
FROM [companydb].[dbo].[emp]

			
SELECT	*
FROM	[employee].[dbo].salary


SELECT	*
FROM [companydb].[dbo].[emp] AS ctbl
INNER JOIN [employee].dbo.salary AS etbl
ON	ctbl.id = etbl.emp_id


SELECT	*
FROM [companydb].[dbo].[emp] AS ctbl
	OUTER APPLY(
					SELECT	TOP 1 *
					FROM	[employee].[dbo].salary AS etbl
					ORDER BY etbl.revision_date DESC
	) AS OT

/*
	SELECT	*
	FROM	dbname.table1name
		OUTER APPLY(
						SELECT	TOP 1 *
						FROM	dbname.table2name
		) AS aliasname

*/
SELECT	ctbl.id,
		ctbl.name,
		ctbl.join_date,
		OT.salary,
		OT.revision_date
FROM [companydb].[dbo].[emp] AS ctbl
	OUTER APPLY(
					SELECT	TOP 1 *
					FROM	[employee].[dbo].salary AS etbl
					ORDER BY etbl.revision_date DESC
	) AS OT