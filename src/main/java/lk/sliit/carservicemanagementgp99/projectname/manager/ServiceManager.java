package lk.sliit.carservicemanagementgp99.projectname.manager;

import lk.sliit.carservicemanagementgp99.projectname.LinkedList.ServiceLinkedList;
import lk.sliit.carservicemanagementgp99.projectname.model.*;
import java.io.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class ServiceManager {
    private final ServiceLinkedList serviceLinkedList;
    private final String filePath;
    private final SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

    public ServiceManager(String filePath) {
        this.filePath = filePath;
        this.serviceLinkedList = new ServiceLinkedList();
        loadService();
    }

    public void addService(Service service) {
        serviceLinkedList.addService(service);
        saveServiceToFile(service);
    }

    public Service getServicebyId(String serviceId) {
        return serviceLinkedList.getServiceById(serviceId);
    }

    public List<Service> getAllServicesSortedByDate() {
        return serviceLinkedList.getAllServicesSortedByDate();
    }

    private void loadService() {
        serviceLinkedList.clearList();
        File file = new File(filePath);
        if(!file.exists()) { return; }

        try(BufferedReader br = new BufferedReader(new FileReader(file))) {
            String line;
            while ((line = br.readLine()) != null){
                String[] parts = line.split(",");
                if(parts.length != 8) continue;
                String type = parts[0];
                String serviceId = parts[1];
                String customerName = parts[2];
                Date date = sdf.parse(parts[3]);
                double cost = Double.parseDouble(parts[4]);
                String status = parts[5];
                String specificServiceType = parts[6];
                String numberPlate = parts[7];

                Service service;
                if("Regular".equals(type)) {
                    service = new RegularService(serviceId, customerName, date, cost, status, specificServiceType, numberPlate);
                } else {
                    service = new MajorRepair(serviceId, customerName, date, cost, status, specificServiceType, numberPlate);
                }
                serviceLinkedList.addService(service);
            }
        } catch (IOException | ParseException e) {
            e.printStackTrace();
        }
    }

    private void saveServiceToFile(Service service) {
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(filePath, true))) {
            bw.write(service.getServiceType() + "," + service.getServiceId() +
                    "," + service.getCustomerName() + "," + sdf.format(service.getDate()) +
                    "," + service.getCost() + "," + service.getStatus() + "," +
                    service.getSpecificServiceType() + "," + service.getNumberPlate());
            bw.newLine();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public List<Service> getAllServices() {
        return serviceLinkedList.getAllServices();
    }

    public void updateServiceStatus(String serviceId, String status) {
        serviceLinkedList.updateServiceStatus(serviceId, status);
        try(BufferedWriter bw = new BufferedWriter(new FileWriter(filePath))) {
            for(Service s : serviceLinkedList.getAllServices()) {
                bw.write(s.getServiceType() + "," + s.getServiceId() + "," +
                        s.getCustomerName() + "," + sdf.format(s.getDate()) + "," +
                        s.getCost() + "," + s.getStatus() + "," +
                        s.getSpecificServiceType() + "," + s.getNumberPlate());
                bw.newLine();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
