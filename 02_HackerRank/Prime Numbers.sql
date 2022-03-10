DECLARE @n INT=3
DECLARE @d INT
DECLARE @p INT
DECLARE @primes VARCHAR (8000)='2'
DECLARE @is_prime VARCHAR =''

WHILE @n <= 1000
	BEGIN
		SET @d = 2
			WHILE @d <= 1000
			BEGIN
			SET @is_prime ='T'
				IF @n <> @d AND @n % @d = 0
					BEGIN 
						SET @is_prime ='F'
						BREAK
					END
			SET @d = @d + 1
			END
	IF @is_prime = 'T' 
		BEGIN
			SET @primes = @primes + '&' + CAST(@n AS varchar) 
		END
	SET @n = @n+1
	END

PRINT @primes
