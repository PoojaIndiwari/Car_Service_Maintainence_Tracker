package lk.sliit.carservicemanagementgp99.projectname.model;

import java.util.Date;

public class RegularService extends Service{
    public RegularService(String serviceId, String customerName, Date date, double cost, String status, String specificServiceType, String numberPlate) {
        super(serviceId, customerName, date, cost, status, specificServiceType, numberPlate);
    }

    public String getServiceType() {
        return "Regular";
    }
}
