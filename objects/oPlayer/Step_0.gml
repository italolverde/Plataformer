// Inputs de movimento
rightKey = keyboard_check( vk_right );
leftKey = keyboard_check( vk_left );
jumpKeyPressed = keyboard_check_pressed( vk_up );

//Direção
moveDir = rightKey - leftKey

// Horizontal spd

xspd = moveDir * moveSpd

	// Horizontal collision
	var _subPixel = 0.5;
	if place_meeting(x + xspd, y, oWall) {
	
		// checar colisão além do pixel perfect
		var _pixelCheck = _subPixel * sign(xspd)
		while !place_meeting(x + _pixelCheck, y, oWall) {
			x += _pixelCheck
		}
	
		// Colisão acontecendo
		xspd = 0;
	}

	// Mover
	x += xspd;



// Vertical spd
	// Gravidade
	if (yspd + grav >= termVel) { 
		yspd = termVel 
	} else { 
		yspd += grav 
		}
	
	// Pulo
	if jumpKeyPressed && place_meeting(x, y+1, oWall){
		yspd = jspd;
	}
	
	// Vertical collision
	if place_meeting(x, y + yspd, oWall) {
	
		// checar colisão pixel perfect
		var _pixelCheck = _subPixel * sign(yspd)
		while !place_meeting(x, y + _pixelCheck, oWall) {
			y += _pixelCheck
		}
		
		// Colisão acontecendo
		yspd = 0;
	}
	// Mover
	y += yspd
