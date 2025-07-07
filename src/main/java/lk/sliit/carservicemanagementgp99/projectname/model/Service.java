package lk.sliit.carservicemanagementgp99.projectname.model;

import java.util.Date;

public abstract class Service {
    private String serviceId;
    private String customerName;
    private Date date;
    private double cost;
    protected String status;
    private String specificServiceType;
    private String numberPlate;

    public Service(String serviceId, String customerName, Date date, double cost, String status, String specificServiceType, String numberPlate) {
        this.serviceId = serviceId;
        this.customerName = customerName;
        this.date = date;
        this.cost = cost;
        this.status = status;
        this.specificServiceType = specificServiceType;
        this.numberPlate = numberPlate;
    }


    public String getServiceId() { return serviceId; }
    public String getCustomerName() { return customerName; }
    public Date getDate() { return date; }
    public double getCost() { return cost; }

    public String getFormattedDate() {
        java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd");
        return sdf.format(this.date);
    }
    public String getStatus() { return status; }
    public String getSpecificServiceType() { return specificServiceType; }
    public String getNumberPlate() { return numberPlate; }

    public void setStatus(String status) {
        this.status = status;
    }

    public void setNumberPlate(String numberPlate) {
        this.numberPlate = numberPlate;
    }
    public abstract String getServiceType();
}
