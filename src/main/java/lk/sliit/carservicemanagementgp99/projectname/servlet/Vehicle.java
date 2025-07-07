package lk.sliit.carservicemanagementgp99.projectname.servlet;

import java.io.Serializable;
import java.util.Objects;

public class Vehicle implements Serializable, Comparable<Vehicle> {
    private static final long serialVersionUID = 1L;

    private String registrationNumber;
    private String numberPlate;
    private String vehicleType;
    private String owner;
    private int mileage;
    private String model;
    private int year;
    private String appointment;
    private String serviceType;


    public Vehicle(String registrationNumber,
                   String numberPlate,
                   String vehicleType,
                   String owner,
                   int mileage,
                   String model,
                   int year,
                   String appointment,
                   String serviceType) {
        this.registrationNumber = registrationNumber;
        this.numberPlate       = numberPlate;
        this.vehicleType       = vehicleType;
        this.owner             = owner;
        this.mileage           = mileage;
        this.model             = model;
        this.year              = year;
        this.appointment       = appointment;
        this.serviceType       = serviceType;
    }


    public String getRegistrationNumber() {
        return registrationNumber;
    }
    public void setRegistrationNumber(String registrationNumber) {
        this.registrationNumber = registrationNumber;
    }

    public String getNumberPlate() {
        return numberPlate;
    }
    public void setNumberPlate(String numberPlate) {
        this.numberPlate = numberPlate;
    }

    public String getVehicleType() {
        return vehicleType;
    }
    public void setVehicleType(String vehicleType) {
        this.vehicleType = vehicleType;
    }

    public String getOwner() {
        return owner;
    }
    public void setOwner(String owner) {
        this.owner = owner;
    }

    public int getMileage() {
        return mileage;
    }
    public void setMileage(int mileage) {
        this.mileage = mileage;
    }

    public String getModel() {
        return model;
    }
    public void setModel(String model) {
        this.model = model;
    }

    public int getYear() {
        return year;
    }
    public void setYear(int year) {
        this.year = year;
    }

    public String getAppointment() {
        return appointment;
    }
    public void setAppointment(String appointment) {
        this.appointment = appointment;
    }

    public String getServiceType() {
        return serviceType;
    }
    public void setServiceType(String serviceType) {
        this.serviceType = serviceType;
    }


    @Override
    public int compareTo(Vehicle other) {
        if (other == null) return 1;
        return this.numberPlate
                .compareToIgnoreCase(other.numberPlate);
    }


    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Vehicle)) return false;
        Vehicle that = (Vehicle) o;
        return this.numberPlate != null
                && that.numberPlate != null
                && this.numberPlate.equalsIgnoreCase(that.numberPlate);
    }

    @Override
    public int hashCode() {
        return Objects.hash(
                numberPlate == null ? "" : numberPlate.toLowerCase()
        );
    }

    @Override
    public String toString() {
        return "Vehicle{" +
                "regNo='" + registrationNumber + '\'' +
                ", plate='" + numberPlate + '\'' +
                ", type='" + vehicleType + '\'' +
                ", owner='" + owner + '\'' +
                ", mileage=" + mileage +
                ", model='" + model + '\'' +
                ", year=" + year +
                ", appointment='" + appointment + '\'' +
                ", serviceType='" + serviceType + '\'' +
                '}';
    }
}
