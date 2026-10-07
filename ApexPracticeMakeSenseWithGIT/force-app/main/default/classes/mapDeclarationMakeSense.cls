public with sharing class mapDeclarationMakeSense {


    public Static void declarationOnMap() {

        // Basic Declaration

        Map<Integer, String> basicMapDeclaration = new Map<Integer,String>();

        basicMapDeclaration.put(1,'Role1');
        basicMapDeclaration.put(2,'Role2');
        basicMapDeclaration.put(3,'Role3');
        System.debug('Basic Declaration Of map : '+basicMapDeclaration);
    

    // Basic Declaration With Values

    Map<String, String> mapDeclarationWithValues = new Map<String, String>{
        'Item1'=> 'Rice',
        'Item2'=> 'Dal',
        'Item3'=> 'Curry'

    };
    System.debug('Map declaration with Values : '+mapDeclarationWithValues);
    // Declaration with queries.

    Map<Id, Opportunity> mapDeclarationwithSoql = 
    new Map<Id, Opportunity>([Select Id, Name, StageName From Opportunity limit 5 ]);
    
    System.debug('Map Declaration With Soql :'+mapDeclarationwithSoql);
 // find how many opportunity are there.

 integer numberofopp = mapDeclarationwithSoql.size();

 System.Debug('Number of Opportunity : '+ numberofopp);

 // Loop through keys

 For(id oppId:mapDeclarationwithSoql.keySet()  ){
    System.debug('The id in opp or key : '+oppId);
 }
 // Find the Id where the opp name is = 'Find me on The loop' and stsge is Closed Lost
 // Loop through values
   For(Opportunity oppValues:mapDeclarationwithSoql.values() ){
    if(oppValues.Name == 'Find me on The loop' && oppValues.StageName == 'Closed Lost'){
        System.debug('The id of following Opportunity  33  : '+oppValues.Id);
    }
    System.debug(' The values in the opp : '+oppValues);
    System.debug(' The values in the stage opp : '+oppValues.StageName);

    for(Id OpportunityId:  mapDeclarationwithSoql.keySet()){
        opportunity opp = mapDeclarationwithSoql.get(OpportunityId);
        if(Opp.Name == 'Find me on the loop' && Opp.StageName =='Closed Lost'){
            System.debug('The Id :  '+Opp);
        }
       

    }
}
    

}
// how to work with list 
 Public Static Void mapLoopWithList(){
    
    List<Opportunity> oppList = [Select id, Name, StageName From Opportunity where StageName ='Closed Lost'];
     
    Map<id, Opportunity> mapOpp = new Map<id, Opportunity> (oppList);
  System.debug('The map value :'+mapOpp);


    

}
}