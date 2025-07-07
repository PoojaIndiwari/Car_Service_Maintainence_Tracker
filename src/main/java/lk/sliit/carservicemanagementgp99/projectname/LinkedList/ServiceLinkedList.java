package lk.sliit.carservicemanagementgp99.projectname.LinkedList;
import lk.sliit.carservicemanagementgp99.projectname.model.Service;
import java.util.LinkedList;
import java.util.List;

public class ServiceLinkedList {
    private LinkedList<Service> serviceList;

    public ServiceLinkedList() {
        this.serviceList = new LinkedList<>();
    }

    public void addService(Service service) {
        serviceList.add(service);
    }

    public Service getServiceById(String serviceId) {
        for (Service s : serviceList) {
            if (s.getServiceId().equals(serviceId)) {
                return s;
            }
        }
        return null;
    }

    public List<Service> getAllServicesSortedByDate() {
        LinkedList<Service> sorted = new LinkedList<>(serviceList);
        for(int i = 0; i < sorted.size() - 1; i++) {
            int minIdx = i;
            for(int j = i + 1; j < sorted.size(); j++) {
                if(sorted.get(j).getDate().before(sorted.get(minIdx).getDate())) {
                    minIdx = j;
                }
            }
            Service temp = sorted.get(i);
            sorted.set(i, sorted.get(minIdx));
            sorted.set(minIdx, temp);
        }
        return sorted;
    }

    public List<Service> getAllServices() {
        return serviceList;
    }

    public void updateServiceStatus(String serviceId, String status) {
        for(Service s : serviceList) {
            if(s.getServiceId().equals(serviceId)) {
                s.setStatus(status);
                break;
            }
        }
    }

    public void clearList() {
        serviceList.clear();
    }
}
