package lk.sliit.carservicemanagementgp99.projectname.servlet;


public class Appointments {

    private String id;
    private String customerId;
    private String vehicleType;
    private String serviceType;
    private String date;
    private String time;
    private boolean approved;

    public Appointments(String id, String customerId, String vehicleType,
                        String serviceType, String date, String time, boolean approved) {
        this.id = id;
        this.customerId = customerId;
        this.vehicleType = vehicleType;
        this.serviceType = serviceType;
        this.date = date;
        this.time = time;
        this.approved = approved;
    }


    public String getId() { return id; }
    public String getCustomerId() { return customerId; }
    public void setCustomerId(String customerId) { this.customerId = customerId; }
    public String getVehicleType() { return vehicleType; }
    public void setVehicleType(String vehicleType) { this.vehicleType = vehicleType; }
    public String getServiceType() { return serviceType; }
    public void setServiceType(String serviceType) { this.serviceType = serviceType; }
    public String getDate() { return date; }
    public void setDate(String date) { this.date = date; }
    public String getTime() { return time; }
    public void setTime(String time) { this.time = time; }
    public boolean isApproved() { return approved; }
    public void setApproved(boolean approved) { this.approved = approved; }
}
