public abstract class Vehicle {
    public enum Medium { LAND, AIR, WATER }

    private Integer speed;
    private String name;
    private Integer occupants;
    private final Integer capacity;
    private List<Medium> media;

    public Vehicle() {
        this.speed = 0;
        this.occupants = 1;
        this.name = 'Unknown';
        this.capacity = 1;
        this.media = new List<Medium>();
    }

    public Vehicle(Integer speed, Integer occupants, String name, Integer capacity) {
        this.speed = (speed < 0) ? 0 : speed;
        this.occupants = (occupants < 0) ? 1 : occupants;
        this.name = name;
        this.capacity = (capacity < 1) ? 1 : capacity;
        this.media = new List<Medium>();
    }

    public Integer getSpeed() {
        return speed;
    }

    public String getName() {
        return name;
    }

    public Integer getOccupants() {
        return occupants;
    }

    public virtual void Accelerate(Integer amount) {
        this.speed += amount;
        if (this.speed < 0) {
            this.speed = 0;
        }
    }

    public abstract void Turn(Integer degrees);

    public override String ToString() {
        return 'Speed: ' + speed + ', Media: ' + media + ', Name: ' + name + ', Occupants: ' + occupants;
    }

    protected List<Medium> getMedia() {
        return media;
    }
}
