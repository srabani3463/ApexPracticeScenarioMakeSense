trigger DuplicatePreventionLead on Lead (before insert) {
      Set<String> NewCompanyNameSet = New Set<String> ();
    Set<String> NewEmailSet = New Set<String>();
    
   // Map<Id, Lead> newMap = New Map<id, Lead>();
    
    For (Lead NewleadRec:Trigger.new){
        if(!string.isBlank(NewleadRec.Company)){
           NewCompanyNameSet.add(NewleadRec.Company); 
        } 
        if(!string.isBlank(NewleadRec.Email)){
            NewEmailSet.add(NewleadRec.Email);
        }
        // this is existing lead.
       List<Lead> ExistingLeadRecord = [Select id,Name, Email, Company
                                        From Lead 
                                        where Email IN:NewEmailSet AND
                                         Company IN:NewCompanyNameSet  ];
   
    for(Lead Newlead:Trigger.new){// compare new record
        for(Lead ExistingLead :ExistingLeadRecord ){ // compare previous record
            if(Newlead.Email == ExistingLead.Email && Newlead.Company == ExistingLead.Company  ){
                Newlead.addError('Duplicate Lead Found On Company  '+ ': '+ Newlead.Company +
                                 '--' +Newlead.Email +'on Email'  + ': '+ ' Comapny Duplicate '+ Newlead.Company  );
                } 
            }
            
        }
    }
}