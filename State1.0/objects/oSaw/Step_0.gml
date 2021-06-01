/// @description 



if (sign(sawDirection) > 0)
{
	if (x < sawTarget)
	{
		hSawSpeed = sawSpeedMax*sawDirection;
		x += hSawSpeed;
	}	
	else
	{
		if (sawStopCounter > 20)
		{
			sawStopCounter = 0;
			sawDirection = -sawDirection;
		}
		sawStopCounter++;
	}	
}
else if (sign(sawDirection) < 0)
{
	if (x > xstart)
	{
		hSawSpeed = sawSpeedMax*sawDirection;
		x += hSawSpeed;
	}	
	else
	{
		if (sawStopCounter > 20)
		{
			sawStopCounter = 0;
			sawDirection = -sawDirection;
		}
		sawStopCounter++;
	}
}



