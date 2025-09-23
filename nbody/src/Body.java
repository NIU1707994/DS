/******************************************************************************
 *  Compilation:  javac Body.java
 *  Execution:    java Body
 *  Dependencies: Vector.java StdDraw.java
 *
 *  Implementation of a 2D Body with a position, velocity and mass.
 *
 *
 ******************************************************************************/

public class Body {
    private Vector position;           // position
    private Vector velocity;           // velocity
    private Vector acceleration;
    private final double mass;        // mass
    private double G = 6.67e-11;

    public Body(Vector r, Vector v, double mass) {
        this.position = r;
        this.velocity = v;
        this.mass = mass;
    }

    public Body(Vector r, Vector v, double mass, double gravity) {
        this.position = r;
        this.velocity = v;
        this.mass = mass;
        this.G = gravity;
    }

    public void move(Vector f, double dt) {
        Vector a = f.scale(1/mass);
        velocity = velocity.plus(a.scale(dt));
        position = position.plus(velocity.scale(dt));
    }

    public Vector forceFrom(Body b) {
        Body a = this;
        Vector delta = b.position.minus(a.position);
        double dist = delta.magnitude();
        double magnitude = (G * a.mass * b.mass) / (dist * dist);
        return delta.direction().scale(magnitude);
    }

    public Vector getPosition() {
        return position;
    }

    @Override
    public String toString() {
        return "position "+ position.toString()+", velocity "+ velocity.toString() + ", mass "+mass;
    }

    public double getMass() {
        return mass;
    }

    public Vector getVelocity() {
        return velocity;
    }

    public Vector getAcceleration()
    {
        return acceleration;
    }

    public void setPosition(Vector newPosition) {
        position = newPosition;
    }

    public void setVelocity(Vector newVelocity) {
        velocity = newVelocity;
    }

    public void setAcceleration(Vector a) {
        acceleration = a;
    }
}
