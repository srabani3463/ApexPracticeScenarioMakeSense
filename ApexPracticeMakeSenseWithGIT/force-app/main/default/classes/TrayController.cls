public with sharing class TrayController {

    
    public static Surgical_Tray__c getTrayBySerial(String serialNumber) {
        return [
            SELECT Id, Name, Serial_Number__c, Tray_Image__c, Tray_Type__c,
                (SELECT Id, Name, Instrument_Name__c, Type__c,
                        Required_Quantity__c, Received_Quantity__c,
                        Damaged_Quantity__c, Repaired_Quantity__c,
                        QC_Passed__c, Exchanged_Quantity__c
                 FROM Tray_Instruments__r)
            FROM Surgical_Tray__c
            WHERE Serial_Number__c = :serialNumber
            LIMIT 1
        ];
    }
}