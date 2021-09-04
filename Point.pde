class Point {
    PVector pos, prev;
    boolean locked;

    Point(PVector pos, boolean locked) {
        this.pos = pos;
        prev = pos.copy();
        this.locked = locked;
    }

    Point(PVector pos) {
        this.pos = pos;
        prev = pos.copy();
    }

    void update() {
        if (locked) return;

        PVector ppos = pos.copy();
        PVector acc = new PVector(0, G * delta);
        PVector vel = PVector.sub(pos, prev).add(acc);
        pos.add(vel);
        prev = ppos;

        if (pos.x < 0) pos.x = 0;
        if (pos.y < 0) pos.y = 0;
        if (pos.x > width) pos.x = width;
        if (pos.y > height) pos.y = height;
    }

    void draw() {
        stroke(0);
        if (locked) stroke(0, 255, 0);
        if (this.equals(selectedPoint)) stroke(255, 0, 0);
        strokeWeight(pointWidth);
        point(pos.x, pos.y);
    }
}