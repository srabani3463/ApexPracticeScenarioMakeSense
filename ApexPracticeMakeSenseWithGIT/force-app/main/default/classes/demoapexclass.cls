public class demoapexclass {
     Public String FirstName; // This is called class variable
    String LastName='Rekha';
    String Phone = '915165';
    Decimal Salary=6500;
    Public void name(){ // This called Instance Object
        system.debug('im instance object');
        lastname = 'Amit';
        phone = '345123';
        salary = 5000;
        system.debug('My Details are '+ '-'+lastName+ ':' +phone+ '-='  +salary  );
    }
    Public String name(string nameofperson){ // data type is string 
        string message = 'Hello Good Morning '+ ' '+nameofperson; // return type string
         System.debug(message);
        age();// you can call the private method inside the class.
        return message;
        
    }
    public Static string address(){
        string homeaddress = '9968, Hidden Falls Circle';
        System.debug(homeaddress );
        
        return homeaddress;
    }
    Public Static Integer add(integer AA, Integer BB){
        Integer Addition = AA+BB;
        system.debug('Add the value'  +Addition);
        return Addition;
    }
    Private Integer age(){
        integer ageofperson = 35;
        system.debug('The age Amit is '+ '' +ageofperson);
        return ageofperson;
    }
    // default constructor
    Public demoapexclass(){
    } 
    
        // constructor with parameter
        public demoapexclass(String FirstName, String phone,decimal Age){
            this.LastName = FirstName;
            this.phone = phone;
            this.salary = Age;
            system.debug(this.FirstName);
            system.debug(this.phone);
            system.debug(this.salary);
        }
    }