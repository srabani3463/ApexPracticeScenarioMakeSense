public with sharing class listApexClassUseCaseMakeSense {


    public static void listuseCase1() {
        //1. Create a List to store the names of all accounts retrived from query.
    List<String> accountName = new List<String>();
    List<Account> acclist = [Select id , name from account Limit 20];
      For(Account acc: accList){
        if(acc.Name !=Null){
            accountName.add(acc.Name);

        }       
      System.debug(accountName.size());
    System.debug(accountName);

    } 
    // Add unique id to email in contact email field.
    }
Public Static void useCaseTwo(){
    Set<String> EmailAddress = New Set<String>();
    For(Contact con:[Select id, name, Email From Contact where Email !=Null]){
        
        EmailAddress.add(con.Email);
    }
    System.debug('The size of Email'+EmailAddress.size());
    System.debug (EmailAddress);
}
Public Static Void useCaseThree(){

    List<Decimal> opportunityAmount = New List<Decimal>(); 

        For(Opportunity opp: [SELECT Id, Name, StageName, Amount
FROM Opportunity
WHERE StageName NOT IN ('Closed Lost', 'Closed Won') AND amount !=Null]){
            opportunityAmount.add(opp.Amount);
        }
        System.debug('The amount total size  '+opportunityAmount.size());
        System.debug(opportunityAmount);
}
 // Write s set to store unique account id from a list of contacts associate with accounts.

 Public Static void useCase4(){
    Set<Id> AccountId = new Set<Id> ();
    
    List<Contact> Conlist = [Select id, Name, Account.Name, AccountId from contact Where AccountId !=null];
    For(Contact con: ConList){
        AccountId.add(con.AccountId);

    }
    System.debug('Conatact associate with account size'+AccountId.size());
     System.debug(AccountId);  
 }
}