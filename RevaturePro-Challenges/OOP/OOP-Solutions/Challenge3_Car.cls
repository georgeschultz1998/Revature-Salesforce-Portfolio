public class Car extends Vehicle {
    private Integer steeringRotation;
    private Integer tireRotation;
    private Integer gear;

    public Integer getTireRotation() {
        return tireRotation;
    }

    public Integer getGear() {
        return gear;
    }

    public Car() {
        super();
        this.steeringRotation = 0;
        this.tireRotation = 0;
        this.gear = 0;
        this.media.add(Medium.LAND);
    }

    public override void Turn(Integer amount) {
        if (amount >= -1440 && amount <= 1440) {
            this.steeringRotation += amount;
            this.tireRotation += amount / 16;
        }
    }
}
