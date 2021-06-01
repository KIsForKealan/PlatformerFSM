
hSpeed = 0;
vSpeed = 0;
walkSpeed = 4;
hSpeedMaxGround = 8;
hSpeedMaxAir = 10;
vSpeedMaxUp = 12;
vSpeedMaxDown = 8;
vSpeedWallSlide = 2;

jumpForce = 10;

grav = 0.6;

//hAirDrag = 0.95;
//vAirDrag = 0.7;

state = "IDLE";
isGrounded = false;
isTouchingWall = 0;
stickyLetGo = 0;

deathWait = 0;
coyoteCount = 0;
wallJumpBuffer = 0;