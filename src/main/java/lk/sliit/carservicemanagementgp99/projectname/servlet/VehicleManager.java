package lk.sliit.carservicemanagementgp99.projectname.servlet;

import lk.sliit.carservicemanagementgp99.projectname.servlet.Vehicle;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.UncheckedIOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.Collections;
import java.util.LinkedList;
import java.util.List;
import java.util.ListIterator;
import java.util.Objects;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.concurrent.locks.ReentrantReadWriteLock;
import java.util.stream.Collectors;

public class VehicleManager {
    private static final Logger LOGGER = Logger.getLogger(VehicleManager.class.getName());
    private static final String DIRECTORY = "C:\\Users\\ASUS\\Desktop\\ProjectFile";
    private static final String VEHICLE_FILE = Paths.get(DIRECTORY, "vehicle_data.txt").toString();
    private static final String BACKUP_FILE  = Paths.get(DIRECTORY, "vehicle_data_backup.txt").toString();

    private final LinkedList<Vehicle> vehicles = new LinkedList<>();
    private final ReentrantReadWriteLock rwLock = new ReentrantReadWriteLock();

    public VehicleManager() {
        ensureDirectoryExists();
        loadVehicles();
    }

    private void ensureDirectoryExists() {
        Path dirPath = Paths.get(DIRECTORY);
        try {
            if (!Files.exists(dirPath)) {
                Files.createDirectories(dirPath);
                LOGGER.info("Created directory: " + DIRECTORY);
            }
        } catch (IOException e) {
            LOGGER.log(Level.SEVERE, "Cannot create directory: " + DIRECTORY, e);
            throw new RuntimeException("Cannot create directory: " + DIRECTORY, e);
        }
    }


    public List<Vehicle> getVehicles() {
        rwLock.readLock().lock();
        try {
            return Collections.unmodifiableList(new LinkedList<>(vehicles));
        } finally {
            rwLock.readLock().unlock();
        }
    }


    public List<Vehicle> getVehiclesByOwner(String ownerName) {
        if (ownerName == null) return Collections.emptyList();
        rwLock.readLock().lock();
        try {
            return vehicles.stream()
                    .filter(v -> v.getOwner() != null
                            && ownerName.equalsIgnoreCase(v.getOwner()))
                    .sorted()
                    .collect(Collectors.toUnmodifiableList());
        } finally {
            rwLock.readLock().unlock();
        }
    }

    public void addVehicle(Vehicle v) {
        if (v == null) throw new IllegalArgumentException("Vehicle cannot be null");
        rwLock.writeLock().lock();
        try {
            for (Vehicle ex : vehicles) {
                if (ex.getNumberPlate().equalsIgnoreCase(v.getNumberPlate())) {
                    throw new IllegalArgumentException("Vehicle with number plate "
                            + v.getNumberPlate() + " already exists");
                }
            }
            vehicles.add(v);
            sortVehicles();
            persistAll();
            createBackup();
        } catch (IOException e) {
            LOGGER.log(Level.SEVERE, "Failed to add vehicle", e);
            throw new UncheckedIOException(e);
        } finally {
            rwLock.writeLock().unlock();
        }
    }

    public boolean updateVehicle(String originalPlate, Vehicle updated) {
        if (updated == null) throw new IllegalArgumentException("Updated vehicle cannot be null");
        rwLock.writeLock().lock();
        try {
            ListIterator<Vehicle> it = vehicles.listIterator();
            while (it.hasNext()) {
                Vehicle curr = it.next();
                if (curr.getNumberPlate().equalsIgnoreCase(originalPlate)) {
                    if (!originalPlate.equalsIgnoreCase(updated.getNumberPlate())) {
                        for (Vehicle v : vehicles) {
                            if (v.getNumberPlate().equalsIgnoreCase(updated.getNumberPlate())) {
                                throw new IllegalArgumentException("Another vehicle with number plate "
                                        + updated.getNumberPlate() + " already exists");
                            }
                        }
                    }
                    it.set(updated);
                    sortVehicles();
                    persistAll();
                    createBackup();
                    return true;
                }
            }
            return false;
        } catch (IOException e) {
            LOGGER.log(Level.SEVERE, "Failed to update vehicle", e);
            throw new UncheckedIOException(e);
        } finally {
            rwLock.writeLock().unlock();
        }
    }

    public boolean deleteVehicle(String numberPlate) {
        rwLock.writeLock().lock();
        try {
            boolean removed = vehicles.removeIf(v ->
                    v.getNumberPlate().equalsIgnoreCase(numberPlate)
            );
            if (removed) {
                sortVehicles();
                persistAll();
                createBackup();
            }
            return removed;
        } catch (IOException e) {
            LOGGER.log(Level.SEVERE, "Failed to delete vehicle", e);
            throw new UncheckedIOException(e);
        } finally {
            rwLock.writeLock().unlock();
        }
    }

    public Vehicle getVehicle(String plate) {
        if (plate == null || plate.trim().isEmpty()) return null;
        rwLock.readLock().lock();
        try {
            for (Vehicle v : vehicles) {
                if (v.getNumberPlate().equalsIgnoreCase(plate.trim())) {
                    return v;
                }
            }
            return null;
        } finally {
            rwLock.readLock().unlock();
        }
    }

    private void loadVehicles() {
        rwLock.writeLock().lock();
        try {
            vehicles.clear();
            Path filePath = Paths.get(VEHICLE_FILE);
            if (!Files.exists(filePath)) {
                LOGGER.info("No vehicle data file found, starting fresh");
                return;
            }

            try (BufferedReader in = Files.newBufferedReader(filePath)) {
                String line;
                int lineNum = 0;
                while ((line = in.readLine()) != null) {
                    lineNum++;
                    line = line.trim();
                    if (line.isEmpty()) continue;
                    String[] f = line.split(",", -1);
                    if (f.length != 9) {
                        LOGGER.warning("Bad record at line " + lineNum + ": " + line);
                        continue;
                    }
                    try {
                        Vehicle v = new Vehicle(
                                f[0].trim(),
                                f[1].trim(),
                                f[2].trim(),
                                f[3].trim(),
                                Integer.parseInt(f[4].trim()),
                                f[5].trim(),
                                Integer.parseInt(f[6].trim()),
                                f[7].trim(),
                                f[8].trim()
                        );
                        vehicles.add(v);
                    } catch (NumberFormatException nfe) {
                        LOGGER.log(Level.WARNING,
                                "Number parse error at line " + lineNum + ": " + line, nfe);
                    }
                }
                LOGGER.info("Loaded " + vehicles.size() + " vehicles");
            }
        } catch (IOException e) {
            LOGGER.log(Level.SEVERE, "Failed to load vehicles", e);
            throw new UncheckedIOException(e);
        } finally {
            rwLock.writeLock().unlock();
        }
    }

    private void persistAll() throws IOException {
        Path tmp = Paths.get(VEHICLE_FILE + ".tmp");
        try (BufferedWriter out = Files.newBufferedWriter(tmp)) {
            for (Vehicle v : vehicles) {
                out.write(format(v));
                out.newLine();
            }
        }
        Files.move(tmp, Paths.get(VEHICLE_FILE), StandardCopyOption.REPLACE_EXISTING);
    }

    private void createBackup() throws IOException {
        Path src = Paths.get(VEHICLE_FILE);
        if (Files.exists(src)) {
            Files.copy(src, Paths.get(BACKUP_FILE), StandardCopyOption.REPLACE_EXISTING);
            LOGGER.info("Backup created");
        }
    }

    public boolean restoreFromBackup() {
        rwLock.writeLock().lock();
        try {
            Path backup = Paths.get(BACKUP_FILE);
            if (!Files.exists(backup)) return false;
            Files.copy(backup, Paths.get(VEHICLE_FILE), StandardCopyOption.REPLACE_EXISTING);
            loadVehicles();
            return true;
        } catch (IOException e) {
            LOGGER.log(Level.SEVERE, "Failed to restore backup", e);
            throw new UncheckedIOException(e);
        } finally {
            rwLock.writeLock().unlock();
        }
    }

    private void sortVehicles() {
        vehicles.sort(null);
    }

    private String format(Vehicle v) {
        return String.join(",",
                Objects.toString(v.getRegistrationNumber(), ""),
                Objects.toString(v.getNumberPlate(), ""),
                Objects.toString(v.getVehicleType(), ""),
                Objects.toString(v.getOwner(), ""),
                String.valueOf(v.getMileage()),
                Objects.toString(v.getModel(), ""),
                String.valueOf(v.getYear()),
                Objects.toString(v.getAppointment(), ""),
                Objects.toString(v.getServiceType(), "")
        );
    }
}
