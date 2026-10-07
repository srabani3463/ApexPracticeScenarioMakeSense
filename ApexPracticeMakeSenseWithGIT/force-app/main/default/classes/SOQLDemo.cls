public class SOQLDemo {
    
    Public Static Void searchAccount(String AccountName){
        List<Account> getAccountName = [Select id, Name, Industry From Account Where Name LIKE : ('%'+AccountName+'%')];
       
            System.debug('All The Account Details'+getAccountName);
        }
    Public Static Void polymorphicQueryDemo(String AccountRelateddetails){
        List<Account> relatedDetAssociateWithAccount = [SELECT Id, name,(Select id, firstname, lastname,AccountId from contacts), 
                                                        (select Id,StageName,amount,AccountId  from Opportunities ), 
                                                        (select Id, Status,AccountId from Cases ) FROM Account
                                                        Where Name LIKE : ('%'+AccountRelateddetails+'%')];
        System.debug('All the related details'+relatedDetAssociateWithAccount);
        
    }
    // List of Contact without Account
    Public static void SoqlForLoopDemo(){
        List <Contact> conlist = new list<Contact>();
        For(Contact con:[Select id, firstname, lastname, accountid from contact where accountid=null]){
            conlist.add(con);
        }
        System.debug('Contact Without Account'+conlist);
        // List Of Contact With Account Details.
        List<Contact> ConwithAccount = new List<Contact>();
        For(Contact c: [Select id, Firstname, Lastname, AccountId from Contact where AccountId !=null]){
          ConwithAccount.add(c);
        }
        System.debug('Account With Contact'+ConwithAccount);
        // account with minimum one contact.
        List<Account> AccountwithminContact = New List<Account>();
        For (Account ac : [Select id, name, industry From Account 
                           where Id IN(select accountid from contact where accountid !=null)   ]){
                             AccountwithminContact.add(ac);    
                            }
        System.debug('Account with minimum one contact'+AccountwithminContact);
    }
}