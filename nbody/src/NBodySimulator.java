public class NBodySimulator {
    private double timeStep;
    private int pauseTime;
    private boolean trace;
    private Universe universe;

    NBodySimulator(Universe universe, double dt, int pt, boolean doTrace)
    {

        this.universe = universe;
        timeStep = dt;
        pauseTime = pt;
        trace = doTrace;
    }

    public void simulate(){
        createCanvas();
        EulerIntegrator eulerIntegrator = new EulerIntegrator(timeStep);
        LeapFrogIntegrator leapFrogIntegrator = new LeapFrogIntegrator(timeStep);
        while (true)
        {
            StdDraw.clear(StdDraw.GRAY);
            eulerIntegrator.move(universe);
            //universe.update(timeStep);
            //leapFrogIntegrator.move(universe);
            drawUniverse();
            StdDraw.show();
            StdDraw.pause(pauseTime);
        }
    }

    private void drawUniverse ()
    {
        int numBodies = universe.getNumBodies();
        if (!trace) {
            for (int i = 0; i < numBodies; i++) {
                Vector position = universe.getBodyPosition(i);
                StdDraw.point(position.cartesian(0), position.cartesian(1));
            }
        }
        else {
            for (int i = 0; i < numBodies; i++) {
                Vector position = universe.getBodyPosition(i);
                StdDraw.setPenColor(StdDraw.WHITE);
                StdDraw.point(position.cartesian(0), position.cartesian(1));
                StdDraw.setPenColor(StdDraw.BLACK);
                StdDraw.point(position.cartesian(0), position.cartesian(1));
            }

        }
        // afegir trace option


    }

    private void createCanvas(){
        StdDraw.setCanvasSize(700, 700);
        StdDraw.enableDoubleBuffering();
        StdDraw.setPenRadius(0.025);
        double radius = universe.getRadius();
        StdDraw.setXscale(-radius, +radius);
        StdDraw.setYscale(-radius, +radius);
    }
}
