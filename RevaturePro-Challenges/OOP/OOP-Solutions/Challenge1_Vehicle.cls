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
}
