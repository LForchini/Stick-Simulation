class Stick {
    Point pointA, pointB;
    float length;

    Stick(Point pointA, Point pointB) {
        this.pointA = pointA;
        this.pointB = pointB;
        length = pointA.pos.copy().dist(pointB.pos.copy());
    }

    void update() {
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