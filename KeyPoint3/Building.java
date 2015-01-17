package KeyPoint3;

public class Building {

    private final int rooms;
    private final int bathrooms;
    private final int kitchens;
    private final int waitrooms;
    private final int diningrooms;
    private final int floors;
    private final int diagnosticCenter;
    private final int traumaCenter;
    private final int dentalCenter;
    private final int residenceCenter;
    private final int parking;

    public static class Builder {

        private int rooms;
        private int bathrooms;

        private int kitchens = 0;
        private int waitrooms = 0;
        private int diningrooms = 0;
        private int floors = 0;
        private int diagnosticCenter = 0;
        private int traumaCenter = 0;
        private int dentalCenter = 0;
        private int residenceCenter = 0;
        private int parking = 0;

        public Builder(int rooms, int bathrooms) {
            this.rooms = rooms;
            this.bathrooms = bathrooms;

        }

        public Builder waitrooms(int value) {
            this.waitrooms = value;
            return this;
        }

        public Builder kitchens(int value) {
            this.kitchens = value;
            return this;
        }

        public Builder diningrooms(int value) {
            this.diningrooms = value;
            return this;
        }

        public Builder floors(int value) {
            this.floors = value;
            return this;
        }

        public Builder diagnosticCenter(int value) {
            this.diagnosticCenter = value;
            return this;
        }

        public Builder traumaCenter(int value) {
            this.traumaCenter = value;
            return this;
        }

        public Builder dentalCenter(int value) {
            this.dentalCenter = value;
            return this;
        }

        public Builder residenceCenter(int value) {
            this.dentalCenter = value;
            return this;
        }

        public Builder parking(int value) {
            this.parking = value;
            return this;
        }

        public Building build() {
            return new Building(this);
        }

    }

    private Building(Builder builder) {
        rooms = builder.rooms;
        bathrooms = builder.bathrooms;
        waitrooms = builder.waitrooms;
        kitchens = builder.kitchens;
        diningrooms = builder.diningrooms;
        floors = builder.floors;
        traumaCenter = builder.traumaCenter;
        dentalCenter = builder.dentalCenter;
        residenceCenter = builder.residenceCenter;
        parking = builder.parking;
        diagnosticCenter = builder.diagnosticCenter;
    }

    public String toString() {
        return "rooms:" + rooms + " bathrooms:" + bathrooms + " waitrooms:"
                + waitrooms + " kitchens:" + kitchens + " diningrooms:"
                + diningrooms + " Floors:" + floors + " traumaCenter:" + traumaCenter
                + " dentalCenter:" + dentalCenter + " residenceCenter:" + residenceCenter + " parking:" + parking
                +" diagnosticCenter:"+diagnosticCenter;
    }

}
