IF NOT EXISTS (SELECT * FROM sys.external_file_formats WHERE name = 'SynapseDelimitedTextFormat') 
	CREATE EXTERNAL FILE FORMAT [SynapseDelimitedTextFormat] 
	WITH ( FORMAT_TYPE = DELIMITEDTEXT ,
	       FORMAT_OPTIONS (
			 FIELD_TERMINATOR = ',',
			 USE_TYPE_DEFAULT = FALSE
			))
GO

IF NOT EXISTS (SELECT * FROM sys.external_data_sources WHERE name = 'iafs_iadatalake2_dfs_core_windows_net') 
	CREATE EXTERNAL DATA SOURCE [iafs_iadatalake2_dfs_core_windows_net] 
	WITH (
		LOCATION = 'abfss://iafs@iadatalake2.dfs.core.windows.net', 
		TYPE = HADOOP 
	)
GO

CREATE EXTERNAL TABLE staging_empmaster (
	[EmployeeID] bigint,
	[LastName] nvarchar(4000),
	[FirstName] nvarchar(4000)
	)
	WITH (
	LOCATION = 'publicempmaster.txt',
	DATA_SOURCE = [iafs_iadatalake2_dfs_core_windows_net],
	FILE_FORMAT = [SynapseDelimitedTextFormat]
	)
GO


SELECT TOP 100 * FROM dbo.staging_empmaster
GO