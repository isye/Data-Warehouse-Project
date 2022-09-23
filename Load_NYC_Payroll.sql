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

CREATE EXTERNAL TABLE staging_nycpayroll (
	[Id] bigint,
	[FiscalYear] bigint,
	[PayrollNumber] bigint,
	[AgencyCode] bigint,
	[AgencyName] nvarchar(4000),
	[EmployeeID] bigint,
	[LastName] nvarchar(4000),
	[FirstName] nvarchar(4000),
	[AgencyStartDate] nvarchar(30),
	[WorkLocationBorough] nvarchar(4000),
	[TitleCode] bigint,
	[TitleDescription] nvarchar(4000),
	[LeaveStatusasofJune30] nvarchar(4000),
	[BaseSalary] float,
	[PayBasis] nvarchar(4000),
	[RegularHours] bigint,
	[RegularGrossPaid] float,
	[OTHours] float,
	[TotalOTPaid] float,
	[TotalOtherPay] float
	)
	WITH (
	LOCATION = 'publicnycpayroll.txt',
	DATA_SOURCE = [iafs_iadatalake2_dfs_core_windows_net],
	FILE_FORMAT = [SynapseDelimitedTextFormat]
	)
GO


SELECT TOP 100 * FROM dbo.staging_nycpayroll
GO