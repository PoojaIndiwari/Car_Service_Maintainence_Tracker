package lk.sliit.carservicemanagementgp99.projectname;

import java.io.*;
import java.nio.file.*;
import java.util.*;

public class AppointmentManager {
    private static final String FILE_PATH = "C:\\Users\\pooja\\Desktop\\appointment.txt";


    private Path getPath() throws IOException {
        Path path = Paths.get(FILE_PATH);
        Path parent = path.getParent();
        if (parent != null && !Files.exists(parent)) {
            Files.createDirectories(parent);
        }
        if (!Files.exists(path)) {
            Files.createFile(path);
        }
        return path;
    }

    public LinkedList<Appointments> loadAll() throws IOException {
        Path path = getPath();  // now guaranteed to exist
        LinkedList<Appointments> list = new LinkedList<>();
        try (BufferedReader br = Files.newBufferedReader(path)) {
            String line;
            while ((line = br.readLine()) != null) {
                String[] p = line.split(",");
                if (p.length == 7) {
                    list.add(new Appointments(
                            p[0], p[1], p[2], p[3], p[4], p[5],
                            Boolean.parseBoolean(p[6])
                    ));
                }
            }
        }
        return list;
    }

    public void saveAll(List<Appointments> appointments) throws IOException {
        Path path = getPath();  // ensures parent folder & file
        try (BufferedWriter bw = Files.newBufferedWriter(
                path, StandardOpenOption.CREATE, StandardOpenOption.TRUNCATE_EXISTING)) {
            for (Appointments a : appointments) {
                bw.write(String.join(",",
                        a.getId(),
                        a.getCustomerId(),
                        a.getVehicleType(),
                        a.getServiceType(),
                        a.getDate(),
                        a.getTime(),
                        String.valueOf(a.isApproved())
                ));
                bw.newLine();
            }
        }
    }

    public void sortByDateTime(List<Appointments> list) {
        for (int i = 0; i < list.size() - 1; i++) {
            int minIdx = i;
            for (int j = i + 1; j < list.size(); j++) {
                String d1 = list.get(j).getDate() + " " + list.get(j).getTime();
                String d2 = list.get(minIdx).getDate() + " " + list.get(minIdx).getTime();
                if (d1.compareTo(d2) < 0) {
                    minIdx = j;
                }
            }
            Collections.swap(list, i, minIdx);
        }
    }
}

