trigger AccountTrigger on Account (before insert, before update, after insert, after update) {
        List<Account> newAccList = Trigger.new; // This is list of account inserted . by trigger.new we can fetch thet record.
    Switch on Trigger.OperationType{
        WHEN BEFORE_INSERT
        {
            For(Account acc:newAccList){
        acc.Name = acc.Name?.toUpperCase();
        if(string.isBlank(acc.Phone)){
            // this error if Ui level display.
            acc.addError('The phone Canot be blank');
  }
           if(string.isBlank(acc.Fax)){
               acc.fax.addError('The Fax Canot be blank');
           }
              if(string.isBlank(acc.Rating)){
                  acc.Rating.addError('The rating Canot be blank');
              }
        //1. If Industry is blank = Education
        if(string.isBlank(acc.Industry)){
            acc.Industry = 'Education';
        }
        //Description = Account Description is blank if Description is nullC*/
        if (string.isBlank(acc.Description)){
            acc.Description = 'Account Description is blank';
            //Apex Trigger 2
//Develop an Apex Trigger so that every time when any account is created or updated then
//Set the Value of the Billing Address is to Shipping Address.
        }
         acc.BillingCity = acc.ShippingCity;
         acc.BillingStreet = acc.ShippingStreet;
         acc.BillingState = acc.ShippingState;
        acc.BillingPostalCode = acc.ShippingPostalCode;
        acc.BillingCountry = acc.ShippingCountry;
    }} 
    
   
    WHEN AFTER_INSERT
{
    AccountTriggerHandler.AccountRelatedTask(trigger.new);
        }}
    //if(trigger.isBefore && Trigger.isInsert){// triger is beforeinsert / first part before/ second part insert.
   
   // if(trigger.isafter && trigger.isInsert){
        
    
   
}