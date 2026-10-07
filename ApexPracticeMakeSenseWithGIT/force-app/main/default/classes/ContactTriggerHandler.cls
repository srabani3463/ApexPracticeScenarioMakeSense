public class ContactTriggerHandler {
/**Develop an Apex Trigger that will update the Contact Phone Value to Contact Fax every time a Contact is updated.
    Public Static Void UpdateContactFax(List<Contact> NewContactList, Map<id, Contact> oldMapContact){
        // get the old value
        // get the new value
        // upadate the value

        For(Contact con:NewContactList ){
           contact oldContact = oldMapContact.get(con.id);
            if(con.phone !=  oldContact.Phone ){
                con.Fax = con.Phone;
                
            }
            
        }
    }**/
    Public Static void UpdateContactRltOpportunity(List<Contact> ConList){
        
    }
}