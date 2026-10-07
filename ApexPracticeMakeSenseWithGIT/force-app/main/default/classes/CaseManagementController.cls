public  Without Sharing class CaseManagementController {
    // to call the apex class the apex should be invocable method.
    @invocableMethod(label= 'Case Status For Agent User' 
        Description ='Please invoke the case status when user enter the case number example 001 ')
    Public static List<string>  getStatus(List<string> CaseNumber){
      List<case> cases = [Select id, Status from Case where  CaseNumber=: CaseNumber[0] Limit 1];
        if(cases.size()>0){
            return new List<string> {cases[0].Status}; 
                }else{
                    return new List<String> {'case Number is not valid'};
                }
    }
}