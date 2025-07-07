package lk.sliit.carservicemanagementgp99.projectname.model;

public class AdditionalCostItem {
    private String description;
    private double amount;

    public AdditionalCostItem(String description, double amount) {
        this.description = description;
        this.amount = amount;
    }

    public String getDescription() { return description; }
    public double getAmount() { return amount; }

    public void setDescription(String description) { this.description = description; }
    public void setAmount(double amount) { this.amount = amount; }
}
