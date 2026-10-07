public with sharing class HospitalTrayController {

    @AuraEnabled(cacheable=true)
    public static List<TrayWrapper> getTrayData(String serialNumber){

        List<TrayWrapper> wrappers = new List<TrayWrapper>();

        List<Tray_Instance__c> trays = [
            SELECT Id, Name, Tray_Type__r.Tray_Image_URL__c
            FROM Tray_Instance__c
            WHERE Name = :serialNumber
        ];

        for(Tray_Instance__c tray : trays){

            TrayWrapper w = new TrayWrapper();
            w.trayId = tray.Id;
            w.serialNumber = tray.Name;
            w.imageUrl = tray.Tray_Type__r.Tray_Image_URL__c;

            w.instruments = [
                SELECT Id, Name, Required_Qty__c
                FROM Tray_Instruments__c
                WHERE Tray_Instance__c = :tray.Id
            ];

            wrappers.add(w);
        }

        return wrappers;
    }

    public class TrayWrapper{

        @AuraEnabled public Id trayId;
        @AuraEnabled public String serialNumber;
        @AuraEnabled public String imageUrl;
        @AuraEnabled public List<Tray_Instruments__c> instruments;

    }
}