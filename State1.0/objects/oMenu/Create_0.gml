/// @description GUI, Vars, Menu setup

guiWidth = display_get_gui_width();
guiHeight = display_get_gui_height();
guiMargin = 32;

menuX = guiWidth + 200;
menuY = guiHeight - guiMargin;
menuXTarget = guiWidth - guiMargin;
menuSpeed = 25; // lower is faster

menuFont = fText;
menuItemHeight = font_get_size(menuFont);
menuCommitted = -1; // set to a number when an item is selected
menuControl = true; // set false after an option is selected

menu[2] = "New Game";
menu[1] = "Continue";
menu[0] = "Exit";

menuItems = array_length(menu);
menuCursor = 2; // defaults to new game