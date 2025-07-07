package lk.sliit.carservicemanagementgp99.projectname.model;

import java.util.ArrayList;
import java.util.List;

public class Invoice {
    private String invoiceId;
    private String customerName;
    private String serviceId;
    private double baseAmount;
    private String specificServiceType;
    private List<lk.sliit.carservicemanagementgp99.projectname.model.AdditionalCostItem> additionalCosts;

    public Invoice(String invoiceId, String customerName, String serviceId, double baseAmount, String specificServiceType) {
        this.invoiceId = invoiceId;
        this.customerName = customerName;
        this.serviceId = serviceId;
        this.baseAmount = baseAmount;
        this.specificServiceType = specificServiceType;
        this.additionalCosts = new ArrayList<>();
    }

    public String getInvoiceId() { return invoiceId; }
    public String getCustomerName() { return customerName; }
    public String getServiceId() { return serviceId; }
    public double getBaseAmount() { return baseAmount; }
    public List<lk.sliit.carservicemanagementgp99.projectname.model.AdditionalCostItem> getAdditionalCosts() { return additionalCosts; }
    public String getSpecificServiceType() { return specificServiceType; }

    public void setAdditionalCost(lk.sliit.carservicemanagementgp99.projectname.model.AdditionalCostItem item) {
        this.additionalCosts.add(item);
    }
    public void setSpecificServiceType(String specificServiceType) { this.specificServiceType = specificServiceType; }

    public double getTotalAmount() {
        double total = baseAmount;
        for(lk.sliit.carservicemanagementgp99.projectname.model.AdditionalCostItem item : additionalCosts) {
            total += item.getAmount();
        }
        return total;
    }

    public void addAdditionalCost(String name, double amount) {
        this.additionalCosts.add(new lk.sliit.carservicemanagementgp99.projectname.model.AdditionalCostItem(name, amount));
    }

    public Object getAmount() {
        return null;
    }
}


