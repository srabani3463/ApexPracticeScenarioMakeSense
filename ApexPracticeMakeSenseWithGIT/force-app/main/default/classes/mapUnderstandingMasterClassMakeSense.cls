public with sharing class mapUnderstandingMasterClassMakeSense {


    public static void underStandMap() {

        Map<String, String> roleVsName = new Map<String, String>();

        roleVsName.put('CEO', 'Sampurna');
        roleVsName.put('Advisor', 'Srabani');
        roleVsName.put('Exicutive', 'Kiash');
        roleVsName.put('junior', 'Kanil');

        System.debug('The Executive List:  '+roleVsName);
        System.debug('The Executive List keySet:  '+roleVsName.keySet());
        System.debug('The Executive List Value:  '+roleVsName.values());
        
        String rolesName = roleVsName.get('Exicutive');
        System.debug('The get mehod scenario Exicutive: '+rolesName);
        
        Integer SizeofMap = roleVsName.size();
        System.debug('The exact size of Map is '+SizeofMap);
        
        Boolean keyContains = roleVsName.containsKey('CEO');
            System.debug(' The key Contains or not CEO'+keyContains);
        // In direct we cannot call the vaue in aginst containskey method. By get method we can get the value.
        // in get method we provide the key and get the value. So wev ll check that one.
         if(roleVsName.containsKey('CEO')){
            string thecontainskeyValue = roleVsName.get('CEO') ;
             System.debug('The value exist using get method ContainsKey and he is Part of the Team:  '+thecontainskeyValue );
        }
        List<string> alltheValues = roleVsName.values();
        System.debug('The value of the map : '+alltheValues);
       
          Set<string>allthekeys = roleVsName.keySet();
        System.debug('The Key of the map : '+allthekeys);
        
        Boolean isMapEmpty = roleVsName.isEmpty();
        system.debug('If the map is empty or not? : '+isMapEmpty);
        
       // remove method you should first find the key then remove it.
       System.debug('Before remove the map :'+roleVsName);
       roleVsName.remove('Advisor');
        System.debug('After remove the map :'+roleVsName);
    }

    Public Static Map<String, List<Opportunity>> UnderstandBasicMap(){
     
        // create a map to fetch the data from opportunity name from different stages-- prospective, negotiation, proposal.
     // it looks like this  -- stage negotaion:(opp1, opp4, opp5, opp7) 
     // stage Proposal == proposal ( opp2, opp3, opp4)
     // key is stagename, value is list of opportunity. understand the map what is the key and value first.

         Map<String, List<opportunity>> stageBasedOppMap = new Map<String, List<opportunity>>();
// Now i want to fetch my data and put into my opp list.
         List<Opportunity> oppList = [Select Id, Name, StageName from Opportunity];
         for(Opportunity opp:oppList){
            System.debug('The list from loop : '+opp);
            //if you ll write this it is overlap your value and it gives only one value.
            // but you want list off opp name against stage name.
          if (stageBasedOppMap.containsKey(opp.StageName)){
            list<Opportunity> CurrentoppByStageName = stageBasedOppMap.get(opp.StageName);
            // you get the another list and add to the opportunity.
             CurrentoppByStageName.add(opp);
             stageBasedOppMap.put(opp.StageName,CurrentoppByStageName );
             system.debug('list of total opp  0000000000'+stageBasedOppMap );
          }
          //if key value is only one then it just add one value not over write.
          else{
            stageBasedOppMap.put(opp.StageName,new List<Opportunity> {opp});
            system.debug('only one  of total opp  1111111'+stageBasedOppMap );
          }
         }
          

     return stageBasedOppMap;
    }
    
}