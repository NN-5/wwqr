PRINT 'Bit';

DECLARE @bit1 Bit = 2;
DECLARE @bit2 Bit = 7659346;
DECLARE @bit3 Bit = -23142141;
DECLARE @bit4 Bit = 54346363;
DECLARE @bit5 Bit = 11111;

PRINT @bit1;
PRINT @bit2;
PRINT @bit3;
PRINT @bit4;
PRINT @bit5;



PRINT 'TinyInt';

DECLARE @tinyint1 TinyInt = 0;
DECLARE @tinyint2 TinyInt = 1;
DECLARE @tinyint3 TinyInt = 1;
DECLARE @tinyint4 TinyInt = 1;
DECLARE @tinyint5 TinyInt = 0;

PRINT @tinyint1;
PRINT @tinyint2;
PRINT @tinyint3;
PRINT @tinyint4;
PRINT @tinyint5;




PRINT 'SmallInt';

DECLARE @smallint1 SmallInt = 32767;
DECLARE @smallint2 SmallInt = 1;
DECLARE @smallint3 SmallInt = 0;
DECLARE @smallint4 SmallInt = 3;
DECLARE @smallint5 SmallInt = 6;

PRINT @smallint1;
PRINT @smallint2;
PRINT @smallint3;
PRINT @smallint4;
PRINT @smallint5;




PRINT 'Int'

DECLARE @int1 Int = 2147483647;
DECLARE @int2 Int = 21;
DECLARE @int3 Int = 21647;
DECLARE @int4 Int = 483647;
DECLARE @int5 Int = 217;

PRINT @int1;
PRINT @int2;
PRINT @int3;
PRINT @int4;
PRINT @int5;



PRINT 'Bigint';

DECLARE @bigint1 Bigint = 9223372036854775807;
DECLARE @bigint2 Bigint = 907;
DECLARE @bigint3 Bigint = 5807;
DECLARE @bigint4 Bigint = 9223507;
DECLARE @bigint5 Bigint = 4775807;

PRINT @bigint1;
PRINT @bigint2;
PRINT @bigint3;
PRINT @bigint4;
PRINT @bigint5;




PRINT 'Float'

DECLARE @float1 float(24) = 482.3;
DECLARE @float2 float(24) = 1214782.23;
DECLARE @float3 float(24) = 782.13;
DECLARE @float4 float(24) = 1282.3;
DECLARE @float5 float(24) = 1782.1;

PRINT @float1;
PRINT @float2;
PRINT @float3;
PRINT @float4;
PRINT @float5;
							




PRINT 'Decimal / Numeric'

DECLARE @decimal1 Decimal(5, 3);
DECLARE @decimal2 Decimal(5, 3);
DECLARE @decimal3 Decimal(5, 3);
DECLARE @decimal4 Decimal(5, 3);
DECLARE @decimal5 Decimal(5, 3);

SET @decimal1 = 5;
SET @decimal2 = 12;
SET @decimal3 = 1.42;
SET @decimal4 = 8;
SET @decimal5 = 1.42;

PRINT @decimal1;
PRINT @decimal2;
PRINT @decimal3;
PRINT @decimal4;
PRINT @decimal5;
 
SET @decimal1 = 1;
SET @decimal2 = 1;
SET @decimal3 = 2;
SET @decimal4 = 4;
SET @decimal5 = 9;

PRINT @decimal1;
PRINT @decimal2;
PRINT @decimal3;
PRINT @decimal4;
PRINT @decimal5;

SET @decimal1 = 1;
SET @decimal2 = 2;
SET @decimal3 = 3;
SET @decimal4 = 4;
SET @decimal5 = 5;

PRINT @decimal1;
PRINT @decimal2;
PRINT @decimal3;
PRINT @decimal4;
PRINT @decimal5;







PRINT 'SmallMoney';

DECLARE @smoney1 SmallMoney = 1;
DECLARE @smoney2 SmallMoney = 0;
DECLARE @smoney3 SmallMoney = 1;
DECLARE @smoney4 SmallMoney = 0;
DECLARE @smoney5 SmallMoney = 1;

PRINT @smoney1;
PRINT @smoney2;
PRINT @smoney3;
PRINT @smoney4;
PRINT @smoney5;


PRINT 'Money';

DECLARE @money1 Money = 1;
DECLARE @money2 Money = 0;
DECLARE @money3 Money = 0;
DECLARE @money4 Money = 1;
DECLARE @money5 Money = 0;

PRINT @money1;
PRINT @money2;
PRINT @money3;
PRINT @money4;
PRINT @money5;




PRINT 'Char'

DECLARE @char1 char(5)= 'Hello';
DECLARE @char2 char(5)= 'H2o';
DECLARE @char3 char(5)= 'LOu';
DECLARE @char4 char(5)= 'RY';
DECLARE @char5 char(5)= 'XYeq';

PRINT @char1;
PRINT @char2;
PRINT @char3;
PRINT @char4;
PRINT @char5;



PRINT 'VarChar'

DECLARE @vchar1 varchar(max)='Hello';
DECLARE @vchar2 varchar(max)='1';
DECLARE @vchar3 varchar(max)='2';
DECLARE @vchar4 varchar(max)='3';
DECLARE @vchar5 varchar(max)='5';

PRINT @vchar1;
PRINT @vchar2;
PRINT @vchar3;
PRINT @vchar4;
PRINT @vchar5;



PRINT 'NChar'

DECLARE @Nchar1 Nchar(7) = 'Привет!';
DECLARE @Nchar2 Nchar(7) = 'Как дела?!';
DECLARE @Nchar3 Nchar(7) = 'КУ!';
DECLARE @Nchar4 Nchar(7) = 'ПОШЁЛ ВОН!';
DECLARE @Nchar5 Nchar(7) = 'Пидб!';

PRINT @Nchar1;
PRINT @Nchar2;
PRINT @Nchar3;
PRINT @Nchar4;
PRINT @Nchar5;




PRINT 'NvarChar'

DECLARE @NvarChar1 NvarChar(max) = 'Привет Мир!';
DECLARE @NvarChar2 NvarChar(max) = 'Ппрпрпнрпн!';
DECLARE @NvarChar3 NvarChar(max) = 'Перкиркруекпвьвкп';
DECLARE @NvarChar4 NvarChar(max) = 'рмисаьпвипркеркерк';
DECLARE @NvarChar5 NvarChar(max) = 'Пеекрмркеркеркер!';

PRINT @NvarChar1;
PRINT @NvarChar2;
PRINT @NvarChar3;
PRINT @NvarChar4;
PRINT @NvarChar5;



PRINT 'DateTime'

DECLARE @datetime1 DateTime = CAST('2007-05-08 12:35:29.123' AS DateTime);
DECLARE @datetime6 DateTime = CAST('2007-05-08 12:35:29.123' AS DateTime);
DECLARE @datetime3 DateTime = CAST('2007-05-08 12:35:29.123' AS DateTime);
DECLARE @datetime4 DateTime = CAST('2007-05-08 12:35:29.123' AS DateTime);
DECLARE @datetime5 DateTime = CAST('2007-05-08 12:35:29.123' AS DateTime);

PRINT @datetime1;
PRINT @datetime6;
PRINT @datetime3;
PRINT @datetime4;
PRINT @datetime5;



PRINT 'DateTime2';

DECLARE @datetime2 DateTime2(5) = CAST('2007-05-08 12:35:29.1234567' AS DateTime2)
DECLARE @datetime7 DateTime2(5) = CAST('2007-05-08 12:35:29.1234567' AS DateTime2)
DECLARE @datetime8 DateTime2(5) = CAST('2007-05-08 12:35:29.1234567' AS DateTime2)
DECLARE @datetime9 DateTime2(5) = CAST('2007-05-08 12:35:29.1234567' AS DateTime2)
DECLARE @datetime10 DateTime2(5) = CAST('2007-05-08 12:35:29.1234567' AS DateTime2)

PRINT @datetime2;
PRINT @datetime7;
PRINT @datetime8;
PRINT @datetime9;
PRINT @datetime10;



PRINT 'SmallDateTime';

DECLARE @smalldatetime1 SmallDateTime = CAST('2007-05-08 12:35:29' AS SmallDateTime)
DECLARE @smalldatetime2 SmallDateTime = CAST('2007-05-08 12:35:29' AS SmallDateTime)
DECLARE @smalldatetime3 SmallDateTime = CAST('2007-05-08 12:35:29' AS SmallDateTime)
DECLARE @smalldatetime4 SmallDateTime = CAST('2007-05-08 12:35:29' AS SmallDateTime)
DECLARE @smalldatetime5 SmallDateTime = CAST('2007-05-08 12:35:29' AS SmallDateTime)


PRINT @smalldatetime1;
PRINT @smalldatetime2; 
PRINT @smalldatetime3; 
PRINT @smalldatetime4; 
PRINT @smalldatetime5; 




PRINT 'DateTimeOffSet';

DECLARE @dateTimeOffSet1 DateTimeOffSet(5) = CAST('2007-05-08 12:35:29.1234567 +12:15' AS DateTimeOffSet)
DECLARE @dateTimeOffSet2 DateTimeOffSet(5) = CAST('2007-05-08 12:35:29.1234567 +12:15' AS DateTimeOffSet)
DECLARE @dateTimeOffSet3 DateTimeOffSet(5) = CAST('2007-05-08 12:35:29.1234567 +12:15' AS DateTimeOffSet)
DECLARE @dateTimeOffSet4 DateTimeOffSet(5) = CAST('2007-05-08 12:35:29.1234567 +12:15' AS DateTimeOffSet)
DECLARE @dateTimeOffSet5 DateTimeOffSet(5) = CAST('2007-05-08 12:35:29.1234567 +12:15' AS DateTimeOffSet)


PRINT @dateTimeOffSet1;
PRINT @dateTimeOffSet2;
PRINT @dateTimeOffSet3;
PRINT @dateTimeOffSet4;
PRINT @dateTimeOffSet5;



PRINT 'Date';

DECLARE @date1 Date = CAST('2007-05-08 12:35:29.1234567' AS Date)
DECLARE @date2 Date = CAST('2007-05-08 12:35:29.1234567' AS Date)
DECLARE @date3 Date = CAST('2007-05-08 12:35:29.1234567' AS Date)
DECLARE @date4 Date = CAST('2007-05-08 12:35:29.1234567' AS Date)
DECLARE @date5 Date = CAST('2007-05-08 12:35:29.1234567' AS Date)


PRINT @date1;
PRINT @date2;
PRINT @date3;
PRINT @date4;
PRINT @date5;


PRINT 'Time';

DECLARE @time1 Time(5) = CAST('2007-05-08 12:35:29.1234567' AS Time);
DECLARE @time2 Time(5) = CAST('2007-05-08 12:35:29.1234567' AS Time);
DECLARE @time3 Time(5) = CAST('2007-05-08 12:35:29.1234567' AS Time);
DECLARE @time4 Time(5) = CAST('2007-05-08 12:35:29.1234567' AS Time);
DECLARE @time5 Time(5) = CAST('2007-05-08 12:35:29.1234567' AS Time);


PRINT @time1;
PRINT @time2;
PRINT @time3;
PRINT @time4;
PRINT @time5;



PRINT 'Binary'

DECLARE @binary1 Binary(1) = 16;
DECLARE @binary2 Binary(1) = 1;
DECLARE @binary3 Binary(1) = 0;
DECLARE @binary4 Binary(1) = 1;
DECLARE @binary5 Binary(1) = 0;

PRINT @binary1;
PRINT @binary2;
PRINT @binary3;
PRINT @binary4;
PRINT @binary5;



PRINT 'VarBinary'

DECLARE @varBinary1 VarBinary(max) = 1;
DECLARE @varBinary2 VarBinary(max) = 0;
DECLARE @varBinary3 VarBinary(max) = 0;
DECLARE @varBinary4 VarBinary(max) = 1;
DECLARE @varBinary5 VarBinary(max) = 0;

PRINT @varBinary1;
PRINT @varBinary2;
PRINT @varBinary3;
PRINT @varBinary4;
PRINT @varBinary5;

