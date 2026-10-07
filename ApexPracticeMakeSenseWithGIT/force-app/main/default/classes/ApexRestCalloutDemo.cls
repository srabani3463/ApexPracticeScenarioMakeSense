public class ApexRestCalloutDemo {

    public static void getUsersFromExternalSystem() {
        // GET user

       /* Http httpObj = new Http();
        HttpRequest req = new HttpRequest();

        req.setEndpoint('https://reqres.in/api/users');
        req.setMethod('GET');

        req.setHeader('Content-Type', 'application/json');
        req.setHeader('x-api-key', 'free_user_3HUrEVZRL0RuWuiuCTmm4Bcw1ze');

        HttpResponse res = httpObj.send(req);

        System.debug('Status Code: ' + res.getStatusCode());
        System.debug('Response Body: ' + res.getBody());*/
        
        // Create User
        HTTP httpObj = new HTTP();
        HttpRequest req = new HttpRequest();
        
        req.setEndpoint('https://reqres.in/api/users');
        req.setHeader('Content-Type', 'application/json');
        req.setHeader('x-api-key', 'free_user_3HUrEVZRL0RuWuiuCTmm4Bcw1ze');
         req.setMethod('POST');
        req.setBody('{"name":"Srabani", "Job":"Engineer"}');
        
        HTTPResponse res = new HTTPResponse();
        res= httpObj.send(req);
        System.debug('responsebody----'+res.getBody());
    }
}