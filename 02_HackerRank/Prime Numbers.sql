DECLARE @n INT=3
DECLARE @d INT
DECLARE @p INT
DECLARE @primes VARCHAR (1000)=''

WHILE @n <= 1000
	BEGIN
		SET @d = 2

		WHILE @d <= 1000
			BEGIN
				IF @d = @n SET @d = @d + 1
				ELSE
					BEGIN
						IF @n % @d = 0	BREAK
						ELSE SET @d = @d + 1
					END
			
			SET @primes = @primes + CAST(@n AS varchar) + '&'
			END
	
	SET @n = @n + 1
	END

PRINT @primes

