import { LightningElement } from 'lwc';

export default class UseCase2ErrorHandling extends LightningElement {
 name;
 email;
 phone;
 age;

 errors =[];
 [
{ fieldName: '', errorMessage: ''}
 ];
 
  
 handleChange(event){
// hold all the input value by using one method call dataset.
    const field = event.target.dataset.field;
    this[field] = event.target.value;
     console.log(' The value change in the input '+ field +':' +this[field]);

 }
 validate(){
    // if anyfield missing throw an error
    // if age is greater than 100 throw an error
    //if name is special character throw an error
  const errs = [];
  if(!this.name || !this.email){
    errs.push({fieldName: 'name' ,errorMessage :"Name field is required"});
    errs.push({fieldName: 'email', errorMessage :"Email field is required"});
  }
  if(this.age > 100 || this.age <= 15){
    errs.push({fieldName: 'age', errorMessage:'Age cannot exceed 100 and not less than 15'})
  }
  return errs;
 }
  handleSubmit(){
    this.errors = this.validate();
    if(this.errors.length){

    }
    else{
        console.log('Submit the form successfully ');
        this.resetFields();
    }
  }
  resetFields(){
    this.name;
    this.phone;
    this.email;
    this.age;
  }
}