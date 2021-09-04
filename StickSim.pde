/* TODO: ADD COMMENTS 
         NEATEN PROGRAM
         NICE UI
*/

int delta, prevMillis;
float G = 0.1;

boolean stick, locked, updating;

ArrayList<Point> points;
ArrayList<Stick> sticks;
Point selectedPoint;
int pointWidth = 25;
int numUpdates = 10000;

void setup() {
    size(800, 600);
    points = new ArrayList<>();
    sticks = new ArrayList<>();

    prevMillis = millis();
}

void draw() {
    background(255);

    if (updating) {
        for (Point p : points) {
            p.update();
        }

        for (int i = 0; i < numUpdates; i++) {
            for (Stick s : sticks) {
                s.update();
            }
        }
    }

    for (Stick s : sticks) {
        s.draw();
    }

    for (Point p : points) {
        p.draw();
    }

    delta = millis() - prevMillis;
    prevMillis = millis();
}

void mouseReleased() {
    PVector mPos = new PVector(mouseX, mouseY);
    if (stick) {

        /* 
            If in stick placing mode, find the closest point, if the click is within the circle,
            then that point is selected. If there is already a point selected, draw a line
            between the two points first.

            If not in stick placing mode, just add a new point where the mouse was clicked.
        */
        if (points.size() == 0) return;
        Point c = points.get(0);
        for (Point p : points) {
            if (mPos.dist(p.pos) < mPos.dist(c.pos)) c = p;
        }
        if (mPos.dist(c.pos) < pointWidth) {
            if (selectedPoint != null) {
                Stick s = new Stick(selectedPoint, c);
                sticks.add(s);
            }
            selectedPoint = c;
        } else {
            selectedPoint = null;
        }

    } else {
        Point p = new Point(mPos, locked);
        points.add(p);
        selectedPoint = p;
    }
}

void keyReleased() {
    selectedPoint = null;
    if (key == 'l') {
        locked = !locked;
        println("Changed lock status");
    } else if (key == 's') {
        stick = !stick;
        println("Changed stick status");
    } else if (key == 'u') {
        updating = !updating;
        println("Changed updating status");
    }
}