

// Get input
key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_space = keyboard_check_pressed(vk_space);

// 1 for right, -1 for left, 0 for stand still
hMove = key_right - key_left;

// Checks
if (place_meeting(x, y+1, oCollision))
	{
		isGrounded = true;
	}
else isGrounded = false;

// +1 for right wall, -1 for left wall, 0 for no wall
isTouchingWall = ((place_meeting(x+1, y, oCollision)) - (place_meeting(x-1, y, oCollision)));


// State
switch (state)
{
	case "IDLE":
		vSpeed += grav;
	// Clamp, collide and move
		hSpeed = clamp(hSpeed, -hSpeedMaxGround, hSpeedMaxGround);
		vSpeed = clamp(vSpeed, -vSpeedMaxUp, vSpeedMaxDown);
		CollisionCheck();
		x += hSpeed;
		y += vSpeed;
		
	// Change states	
		if ((key_space) && (isGrounded))
		{	
			vSpeed = -jumpForce;
			state = "JUMP";	
		}
		else if (hMove != 0)
		{
			state = "MOVE";	
		}
		
		break;
	
	case "MOVE":
	// Apply input
		hSpeed = hMove * walkSpeed;
		vSpeed += grav;
		
	// Clamp, collide and move
		hSpeed = clamp(hSpeed, -hSpeedMaxGround, hSpeedMaxGround);
		vSpeed = clamp(vSpeed, -vSpeedMaxUp, vSpeedMaxDown);
		CollisionCheck();
		x += hSpeed;
		y += vSpeed;
		
		if (isGrounded == true)
		{
			coyoteCount = 0;	
		} else coyoteCount++;
	
	// Change states
		if ((!isGrounded) && (sign(vSpeed) >= 0))
		{
			if (isTouchingWall != 0)
			{
				state = "WALLSLIDE";	
			}
		}
		if ((key_space) && (coyoteCount < 20))
		{
			vSpeed = -jumpForce;
			state = "JUMP";		
		}
		if ((key_space) && (isGrounded))
		{
			vSpeed = -jumpForce;
			state = "JUMP";	
		}
		else if (hMove == 0)
		{
			state = "IDLE";	
		}
		
		break;
		
	case "JUMP":
	// Apply input
		hSpeed = hMove * walkSpeed;
			
		vSpeed += grav;
	// Clamp, collide and move
		hSpeed = clamp(hSpeed, -hSpeedMaxAir, hSpeedMaxAir);
		vSpeed = clamp(vSpeed, -vSpeedMaxUp, vSpeedMaxDown);
		CollisionCheck();
		x += hSpeed;
		y += vSpeed;
	
		if ((!isGrounded) && (sign(vSpeed) >= 0))
		{
			if (isTouchingWall != 0)
			{
				state = "WALLSLIDE";	
			}
		}
		
		if ((isGrounded) && (sign(vSpeed) >= 0))
		{
			state = "MOVE";
		}
		break;
		
	case "WALLSLIDE":
	//stickywall counter blah frames of input before pop off
		if (hMove == -isTouchingWall)
		{
			stickyLetGo++;
			if (stickyLetGo >= 20)
			{
				stickyLetGo = 0;
				hSpeed = hMove * walkSpeed;	
			}
		}
		
	// Clamp final velocites
		vSpeed += grav;
		hSpeed = clamp(hSpeed, -hSpeedMaxAir, hSpeedMaxAir);
		vSpeed = clamp(vSpeed, -vSpeedMaxUp, vSpeedWallSlide);
	// Collide and Move
		CollisionCheck();
		x += hSpeed;
		y += vSpeed;
		
	// Change states
		if (key_space)
		{
			vSpeed = -jumpForce;
			hSpeed = (-isTouchingWall*walkSpeed);
			wallJumpCounter = 0;
			state = "WALLJUMP";
		}
		if ((isTouchingWall == 0) && (!isGrounded))
		{
			state = "JUMP";	
		}
		else if ((isGrounded) && (sign(vSpeed) >= 0))
		{
			state = "MOVE";	
		}
		
		break;
		
		case "WALLJUMP":
	// Buffer for pressing wall jump early
		if (place_meeting(x+(wallJumpBuffer*hMove), y, oCollision )) && (key_space) 
		{
			vSpeed = -jumpForce;
			hSpeed = (-isTouchingWall*walkSpeed);
			wallJumpCounter = 0;
			state = "WALLJUMP";
		}
		
	// Cannot move for blah frames after wall jump
		if (wallJumpCounter < 15)
		{
			wallJumpCounter++;
		}
		else 
		{
			wallJumpCounter = 0;
	// Apply input
			hSpeed = hMove * walkSpeed;
		}
			
		vSpeed += grav;
	// Clamp, collide and move
		hSpeed = clamp(hSpeed, -hSpeedMaxAir, hSpeedMaxAir);
		vSpeed = clamp(vSpeed, -vSpeedMaxUp, vSpeedMaxDown);
		CollisionCheck();
		x += hSpeed;
		y += vSpeed;
	
		if ((!isGrounded) && (sign(vSpeed) >= 0))
		{
			if (isTouchingWall != 0)
			{
				state = "WALLSLIDE";	
			}
		}
		
		if ((isGrounded) && (sign(vSpeed) >= 0))
		{
			state = "MOVE";
		}
		break;
		
		case "DEAD":
		sprite_index = sPlayerDead;
		if (image_index == 7)
		{
			image_speed = 0;	
		}
	// No movement, wait 
	if (deathWait >= 10)
	{
		deathWait = 0;
		
		SlideTransition(TRANS_MODE.GOTO, room);
		
		//state = "IDLE";
		sprite_index = sPlayer;
	}
	else deathWait++;
		break;
}

	








	




