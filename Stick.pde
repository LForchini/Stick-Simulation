class Stick {
    Point pointA, pointB;
    float length;

    Stick(Point pointA, Point pointB) {
        this.pointA = pointA;
        this.pointB = pointB;
        length = pointA.pos.copy().dist(pointB.pos.copy());
    }

    void update() {
        /* 
            Adjust each point so that they are the appropriate distance apart.
            For this to work with multiple sticks, the update routine should
            be called multiple times so that an equilibrium can be achieved.
        */

        PVector center = PVector.add(pointA.pos, pointB.pos).div(2);
        PVector dir = PVector.sub(pointA.pos, pointB.pos).normalize();

        if (!pointA.locked) {
            pointA.pos = PVector.add(center, dir.copy().mult(length / 2));
        }
        if (!pointB.locked) {
            pointB.pos = PVector.sub(center, dir.copy().mult(length / 2));
        }
    }

    void draw() {
        stroke(0);
        strokeWeight(3);
        line(pointA.pos.x, pointA.pos.y, pointB.pos.x, pointB.pos.y);
    }
}