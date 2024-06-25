public class Car extends Vehicle {
    private Integer steeringRotation;
    private Integer tireRotation;
    private Integer gear;

    public Car() {
        super();
        this.steeringRotation = 0;
        this.tireRotation = 0;
        this.gear = 0;
        this.getMedia().add(Medium.LAND);
    }

    public Car(Integer speed, Integer occupants, String name, Integer capacity) {
        super(speed, occupants, name, capacity);
        this.steeringRotation = 0;
        this.tireRotation = 0;
        this.gear = 0;
        this.getMedia().add(Medium.LAND);
    }

    public Integer getTireRotation() {
        return tireRotation;
    }

    public Integer getGear() {
        return gear;
    }

    public override void Accelerate(Integer amount) {
        super.Accelerate(amount);
        this.gear = (Integer)Math.ceil(0.4444 * Math.sqrt(this.getSpeed()));
    }

    public override void Turn(Integer degrees) {
        this.steeringRotation += degrees;
        if (this.steeringRotation < -1440) {
            this.steeringRotation = -1440;
        } else if (this.steeringRotation > 1440) {
            this.steeringRotation = 1440;
        }
        this.tireRotation = degrees / 16;
        if (this.tireRotation < -90) {
            this.tireRotation = -90;
        } else if (this.tireRotation > 90) {
            this.tireRotation = 90;
        }
    }
}
