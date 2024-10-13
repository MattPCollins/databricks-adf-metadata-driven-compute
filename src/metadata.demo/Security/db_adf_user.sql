/*
CREATE USER [metadatademodevfactoryuks01] 
FROM EXTERNAL PROVIDER
*/

CREATE ROLE [db_adf_user]
GO

GRANT 
	EXECUTE, 
	SELECT,
	CONTROL,
	ALTER
ON SCHEMA::[demo] TO [db_adf_user]
GO

/*
ALTER ROLE [db_adf_user] 
ADD MEMBER [metadatademodevfactoryuks01];
*/