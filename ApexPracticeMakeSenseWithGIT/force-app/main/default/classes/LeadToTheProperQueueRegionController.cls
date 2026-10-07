public with sharing class LeadToTheProperQueueRegionController {

    // Request wrapper
    public class WrapperRequest {
        @InvocableVariable(required=true description='Pass the Firstname or region given by the user')
        public String FirstName;
    }

    // Response wrapper
    public class WrapperResponse {
        @InvocableVariable(description='Show the message to the UI')
        public String Message;
    }

    @InvocableMethod(label='Lead Assignment To The Proper Queue Member' 
                     description='Route the Lead to the Proper Queue as per region and assign team')
    public static List<WrapperResponse> transferLead(List<WrapperRequest> requests) {

        List<WrapperResponse> responses = new List<WrapperResponse>();

        if (requests == null || requests.isEmpty()) {
            return responses;
        }

        for (WrapperRequest req : requests) {

            WrapperResponse res = new WrapperResponse();

            try {
                // Get Lead
                Lead objLead = [
                    SELECT Id, Region__c, FirstName 
                    FROM Lead 
                    WHERE FirstName = :req.FirstName 
                    LIMIT 1
                ];

                if (objLead == null) {
                    res.Message = 'No Lead found with FirstName: ' + req.FirstName;
                    responses.add(res);
                    continue;
                }

                // Get Queue based on Region
                Group queue = [
                    SELECT Id 
                    FROM Group 
                    WHERE Type = 'Queue' 
                    AND Name = :objLead.Region__c 
                    LIMIT 1
                ];

                if (queue == null) {
                    res.Message = 'No Queue found for region: ' + objLead.Region__c;
                    responses.add(res);
                    continue;
                }

                // Assign owner
                objLead.OwnerId = queue.Id;
                update objLead;

                res.Message = 'Lead ' + objLead.FirstName + 
                              ' is successfully transferred to the ' + 
                              objLead.Region__c + ' team.';

            } catch (Exception e) {
                res.Message = 'Error processing Lead ' + req.FirstName + 
                              ': ' + e.getMessage();
            }

            responses.add(res);
        }

        return responses;
    }
}