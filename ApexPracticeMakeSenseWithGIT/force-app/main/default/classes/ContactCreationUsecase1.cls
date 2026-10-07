public class ContactCreationUsecase1 {
    
    Public Static void createContact(string ftname, string lastname, string phone){
        
        List<contact> conlist = new List<contact>();
           contact con = new contact();
          con.firstName = ftname;
           con.LastName = lastname;
           con.Phone = phone;
        conlist.add(con);
        insert conlist;
        system.debug('Check the contact created or not' +conlist);
    }
     // Write a method that calculate the simple intrest for a given principle, intrest and time and return the SI as a result
    public Decimal pricipalCalculation(Integer P, Integer I, Integer T ){
             Decimal SI = P*I*T/100;
         System.debug('interest is '+SI);
        return SI;
       
    }
}