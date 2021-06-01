/// @description Control menu

// Ease items in
menuX += (menuXTarget - menuX) / menuSpeed;

// Keyboard controls
if (menuControl)
{
	if (keyboard_check_pressed(vk_up))
	{
		menuCursor++;
		if (menuCursor >= menuItems) menuCursor = 0;
	}
	if (keyboard_check_pressed(vk_down))
	{
		menuCursor--;
		if (menuCursor < 0) menuCursor = (menuItems - 1);
	}
	if (keyboard_check_pressed(vk_enter))
	{
		menuXTarget = guiWidth + 200; // head off screen right
		menuCommitted = menuCursor;
		Screenshake(4, 30);
		menuControl = false;
	}
}

if (menuX > (guiWidth + 150)) && (menuCommitted != -1)
{
	switch (menuCommitted)
	{
		case 2: default: SlideTransition(TRANS_MODE.GOTO, rOne); break;
		case 0: game_end(); break;
		
	}
}