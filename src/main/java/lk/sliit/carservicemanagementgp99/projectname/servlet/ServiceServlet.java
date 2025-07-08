package lk.sliit.carservicemanagementgp99.projectname.servlet;

import lk.sliit.carservicemanagementgp99.projectname.Vehicle;
import lk.sliit.carservicemanagementgp99.projectname.model.*;
import lk.sliit.carservicemanagementgp99.projectname.manager.ServiceManager;
import lk.sliit.carservicemanagementgp99.projectname.manager.InvoiceManager;
import lk.sliit.carservicemanagementgp99.projectname.VehicleManager;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@WebServlet("/service")
public class ServiceServlet extends HttpServlet {
    private ServiceManager serviceManager;
    private InvoiceManager invoiceManager;
    private VehicleManager vehicleManager;

    private static final SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

    public void init() throws ServletException {
        // Update these paths to your actual PC absolute file paths
        String servicePath = "C:\\Users\\ASUS\\Desktop\\ProjectFile\\services.txt";
        String invoicePath = "C:\\Users\\ASUS\\Desktop\\ProjectFile\\invoices.txt";

        serviceManager = new ServiceManager(servicePath);
        invoiceManager = new InvoiceManager(invoicePath);
        vehicleManager = new VehicleManager();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("addService".equals(action)) {
            try {
                String numberPlate = request.getParameter("numberPlate");
                Vehicle vehicle = vehicleManager.getVehicle(numberPlate);
                if (vehicle == null) {
                    request.setAttribute("error", "Vehicle not found for plate: " + numberPlate);
                    request.getRequestDispatcher("service.jsp").forward(request, response);
                    return;
                }
                String customerName = vehicle.getOwner();
                Date date = sdf.parse(request.getParameter("date"));
                double cost = Double.parseDouble(request.getParameter("cost"));
                String serviceId = "SRV-" + System.currentTimeMillis();
                String status = request.getParameter("status");
                String serviceType = request.getParameter("serviceType");
                String specificServiceType = request.getParameter("specificServiceType");
                Service service;
                if ("Regular".equalsIgnoreCase(serviceType)) {
                    service = new RegularService(serviceId, customerName, date, cost, status, specificServiceType, numberPlate);
                } else {
                    service = new MajorRepair(serviceId, customerName, date, cost, status, specificServiceType, numberPlate);
                }

                serviceManager.addService(service);


                String invoiceId = "INV-" + System.currentTimeMillis();
                Invoice invoice = new Invoice(invoiceId, customerName, serviceId, cost, specificServiceType);
                invoiceManager.addInvoice(invoice);

                request.setAttribute("message", "Service and Invoice added successfully!");
            } catch (Exception e) {
                request.setAttribute("error", "Failed to add service: " + e.getMessage());
            }
            request.getRequestDispatcher("service.jsp").forward(request, response);
        }


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String view = request.getParameter("view");

        if ("tracker".equals(view)) {
            List<Service> services = serviceManager.getAllServicesSortedByDate();
            request.setAttribute("services", services);
            request.getRequestDispatcher("service_tracker.jsp").forward(request, response);
        } else if ("services".equals(view)) {
            List<Service> services = serviceManager.getAllServicesSortedByDate();
            request.setAttribute("services", services);
            request.getRequestDispatcher("service.jsp").forward(request, response);
        } else if ("invoices".equals(view)) {
            String search = request.getParameter("search");
            List<Invoice> invoices = (search != null && !search.trim().isEmpty())
                    ? invoiceManager.searchInvoices(search.trim())
                    : invoiceManager.getAllInvoices();

            request.setAttribute("invoices", invoices);
            request.setAttribute("services", serviceManager.getAllServices());
            request.getRequestDispatcher("invoice.jsp").forward(request, response);
        } else if ("editInvoice".equals(view)) {
            String invoiceId = request.getParameter("invoiceId");
            Invoice invoice = invoiceManager.getInvoiceById(invoiceId);
            if (invoice != null) {
                request.setAttribute("invoice", invoice);
                request.getRequestDispatcher("edit_invoice.jsp").forward(request, response);
            } else {
                request.setAttribute("error", "Invoice not found!");
                request.getRequestDispatcher("invoice.jsp").forward(request, response);
            }
        } else if ("details".equals(view)) {
            String invoiceId = request.getParameter("invoiceId");
            Invoice invoice = invoiceManager.getInvoiceById(invoiceId);
            if (invoice != null) {
                request.setAttribute("invoice", invoice);
                request.getRequestDispatcher("invoice_details.jsp").forward(request, response);
            } else {
                request.setAttribute("error", "Invoice not found!");
                request.getRequestDispatcher("invoice.jsp").forward(request, response);
            }
        }
    }
}