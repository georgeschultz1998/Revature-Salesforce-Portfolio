public abstract class Vehicle {
    public enum Medium {
        LAND, AIR, WATER
    }

    private Integer speed;
    public Integer getSpeed() {
        return speed;
    }

    private String name;
    public String getName() {
        return name;
    }

    private Integer occupants;
    public Integer getOccupants() {
        return occupants;
    }

    public static final Integer CAPACITY = 1;
    
    protected List<Medium> media = new List<Medium>();

    public Vehicle() {
        this.speed = 0;
        this.occupants = 1;
        this.name = 'Default';
    }

    public Vehicle(Integer speed, Integer occupants, String name) {
        setSpeed(speed);
        setOccupants(occupants);
        this.name = name;
    }

    public void setSpeed(Integer value) {
        if (value >= 0) {
            this.speed = value;
        }
    }

    public void setOccupants(Integer value) {
        if (value >= 0) {
            this.occupants = value;
        }
    }

    public void setName(String value) {
        this.name = value;
    }

    public void Accelerate(Integer amount) {
        setSpeed(getSpeed() + amount);
    }

    public abstract void Turn(Integer amount);

    public String ToString() {
        return 'Speed: ' + getSpeed() + ', Media: ' + media + ', Name: ' + getName() + ', Occupants: ' + getOccupants();
    }
}

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

    public Car(Integer speed, Integer occupants, String name) {
        super(speed, occupants, name);
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

    public override void Accelerate(Integer amount) {
        super.Accelerate(amount);
        this.gear = (Integer)Math.ceil(0.4444 * Math.sqrt(getSpeed()));
    }
}
