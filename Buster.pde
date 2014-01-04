class Buster {
	float center, x, y, w, h;
	boolean hasTarget = false;
	Ghost currentTarget = null;
	// ---Data ^^
	Buster() {
		w = 50;
		h = 50;	
		x = width/2 - w/2;
		y = height - h;
		center = x + w/2;
	} // ----constructor
	void move() {
		if(keyPressed) {
			if(key == 'a' || key == 'A') {
				x -= 3; // move ghost buster left if A is pressed
				center = x + 25; // update center position
			}
			if(key == 'd' || key == 'D') {
				x += 3; // move ghost buster right if D is pressed
				center = x + 25; // update center position
			}
		}
	}
	void display() {
		noStroke();
		fill(175);
		rect(x, y, w, h); // Ghost buster position
	}
	void findTarget() { // detects if there is a ghost under a mouse pointer and saves the last ghost
		int targetID = -1; // save the array pointer to the hovered ghost
		for(int i = 0; i < ghost_.length; i++) { // loop through all the ghosts
			if(ghost_[i].hasMouse == true) {
				targetID = i; // if there is a hovered ghost save it's array pointer
			}
		}
		if (targetID == -1) { // -1 means there were no hovered ghosts detected
			currentTarget = null;
			//println("There is no target.");
		}
		else {
			currentTarget = ghost_[targetID]; // set Buster's current target to a ghost
			//println("This is the Current Target: " + currentTarget);
		}
	}
	void beam() { // draw beam - more layers = colorful beam
		if(currentTarget != null) {
			strokeWeight(10);
			stroke(245, random(100,200), 0);
			line(center, height - 50, currentTarget.centerX, currentTarget.centerY);
			strokeWeight(5);
			stroke(245, random(100,200), 0);
			line(center, height - 50, currentTarget.centerX, currentTarget.centerY);
			strokeWeight(2);
			stroke(245, random(100,200), 0);
			line(center, height - 50, currentTarget.centerX, currentTarget.centerY);
			//println("This is the Current Target: " + currentTarget);
		}
		else {
			//println("There is no target");
		}
	}
	 // functions ----
}