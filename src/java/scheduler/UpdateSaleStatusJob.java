/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package scheduler;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

/**
 *
 * @author ASUS
 */
public class UpdateSaleStatusJob implements Job{
    @Override
    public void execute(JobExecutionContext context) throws JobExecutionException {
        try {
            
            URL url = new URL("http://localhost:9999/Project/updateSaleStatus");
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("GET");
            connection.getResponseCode();
            connection.disconnect();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
