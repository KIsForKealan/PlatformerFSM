// @arg mode sets transition mode between NEXT, RESTART, GOTO
// @arg targetRoom sets room when using GOTO mode

function SlideTransition(_mode, _targetRoom){
	with(oTransition)
	{
		mode =_mode;
		if (argument_count > 1)
		{
			target = _targetRoom;	
		}
		
	}
}