package lk.sliit.carservicemanagementgp99.projectname.manager;

import lk.sliit.carservicemanagementgp99.projectname.model.Invoice;

import lk.sliit.carservicemanagementgp99.projectname.model.AdditionalCostItem;


import java.io.*;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

public class InvoiceManager {
    private List<Invoice> invoiceList;
    private final String filePath;

    public InvoiceManager(String filePath) {
        this.filePath = filePath;
        this.invoiceList = new LinkedList<>();
        loadInvoices();
    }
    public void addInvoice(Invoice invoice) {
        invoiceList.add(invoice);
        saveInvoiceToFile(invoice);
    }

    public List<Invoice> getAllInvoices() {
        return new LinkedList<>(invoiceList);
    }
    public Invoice getInvoiceById(String invoiceId) {
        for (Invoice invoice : invoiceList) {
            if (invoice.getInvoiceId().equals(invoiceId)) {
                return invoice;
            }
        }
        return null;
    }

    public void addAdditionalCostToInvoice(String invoiceId, AdditionalCostItem item) {
        Invoice invoice = getInvoiceById(invoiceId);
        if (invoice != null) {
            invoice.setAdditionalCost(item);
            rewriteAllInvoices();
        }
    }

    private void loadInvoices() {
        invoiceList.clear();
        File file = new File(filePath);
        if(!file.exists()) { return; }

        try (BufferedReader br = new BufferedReader(new FileReader(file))) {
            String line;
            while((line = br.readLine()) != null) {
                String[] parts = line.split(",");
                if(parts.length != 5) continue;
                Invoice invoice = new Invoice(parts[0], parts[1], parts[2], Double.parseDouble(parts[3]), parts[4]);

                invoiceList.add(invoice);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void saveInvoiceToFile(Invoice invoice) {
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(filePath, true))) {
            bw.write(invoice.getInvoiceId() + "," + invoice.getCustomerName() + "," +
                    invoice.getServiceId() + "," + invoice.getBaseAmount());

            bw.newLine();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    public void rewriteAllInvoices() {
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(filePath, false))) {
            for (Invoice invoice : invoiceList) {
                bw.write(invoice.getInvoiceId() + "," + invoice.getCustomerName() + "," +
                        invoice.getServiceId() + "," + invoice.getTotalAmount() + "," + invoice.getSpecificServiceType());
                bw.newLine();;
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public List<Invoice> searchInvoices(String query) {
        List<Invoice> result = new LinkedList<>();
        for (Invoice invoice : invoiceList) {
            if (invoice.getCustomerName().toLowerCase().contains(query.toLowerCase()) ||
                    invoice.getServiceId().toLowerCase().contains(query.toLowerCase())) {
                result.add(invoice);
            }
        }
        return result;
    }

}
