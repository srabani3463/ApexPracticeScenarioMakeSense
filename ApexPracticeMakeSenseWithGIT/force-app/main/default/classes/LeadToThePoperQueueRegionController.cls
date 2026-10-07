public with sharing class LeadToThePoperQueueRegionController {
    // Getting the id from the agent 
    Public class WrapperRequest{
        @invocableVariable (required=true description='Pass the   Firstname or region  given by the user')
            public String FirstName;
    }
    // getting response from the agent
Public class WrapperResponse{
        @invocableVariable ( description='Show the message to the UI')
            public string Message;
}
    // this us the name we can see on agent action to invoke the apex class
    @InvocableMethod (label='Lead Assign ' description='Rout The Lead to The Proper Queue as per region Assign Team ')
    
// Response is always list.
Public static List<WrapperResponse> transferLead(List<WrapperRequest> requests){
    List<WrapperResponse> returnResponse = new List<WrapperResponse>();
    Lead objLead = [Select Id, Region__c, FirstName from Lead WHERE FirstName= :requests[0].FirstName LIMIT 1 ];
    // find the queue
    Group queue = [Select Id from Group where Type= 'Queue' AND Name = :objLead.Region__c Limit 1];
    objLead.OwnerId = queue.Id;	
    update objLead;
    
    WrapperResponse response = new WrapperResponse();
    response.Message = 'Lead: '+objLead.FirstName + 'is Successfully transfer to the ' + objLead.Region__c + 'team';
    returnResponse.add( response );
    return returnResponse;

}  
}