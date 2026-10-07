public with sharing class childRecordControllerContact {
    
@AuraEnabled(cacheable=true)
public static List<sObject> getRelatedRecords ( Id recordId,String childObjectApiName, String fieldsList, 
                                                String LookupFieldApiName, integer LimitSize){
   String soql = 'SELECT'
   + fieldsList + 
   ' From '+
   childObjectApiName +
   ' WHERE '+
   LookupFieldApiName +
   ' = :recordId' +
   ' LIMIT '+LimitSize;
   System.debug(soql);

   return Database.query(soql);
}
  
}