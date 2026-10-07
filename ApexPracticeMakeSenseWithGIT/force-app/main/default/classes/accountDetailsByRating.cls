public class accountDetailsByRating {

    // Devide the accounts by rating
    // rating is key and account details is value
    Public static Map<String, List<Account>> accountByRating(){
        
        Map<String, List<Account>> mapAccList = new Map <String, List<Account>>();
        
       List<Account> accList = [Select Id, Name, Rating from Account];
        //system.debug('The list of account :'+accList);
        For(Account acc: accList){
            system.debug('The list of account First ::'+acc);
            if(mapAccList.containsKey(acc.Rating)){
                list<Account> newAccListcontainrating = mapAccList.get(acc.Rating);
                newAccListcontainrating.add(acc);
                system.debug('The list of account nwe Second :::'+newAccListcontainrating);
            }
            else{
                mapAccList.put(acc.Rating,new List<Account> {acc});
                system.debug('The list of account nwe Third ::::'+mapAccList);
            }
            
        }
        return mapAccList;
    }
    
}