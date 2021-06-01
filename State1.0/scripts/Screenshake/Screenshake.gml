// _magnitude = strength of shake / distance range
// _frames = length of shake in frames (60 = 1 second)

function Screenshake(_magnitude, _frames){
	with (oCamera)
	{
		if (_magnitude > shakeRemain)
		{
			shakeMagnitude = _magnitude;
			shakeRemain = shakeMagnitude;
			shakeLength = _frames;
		}
	}
}