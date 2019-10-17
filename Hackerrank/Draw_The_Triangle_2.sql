set @number = 0;
select repeat('* ',@number := @number + 1)
FROM information_schema.tables WHERE @number <20;
