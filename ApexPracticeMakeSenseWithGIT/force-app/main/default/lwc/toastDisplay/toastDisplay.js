import { LightningElement } from 'lwc';
import createAccountWithName from "@salesforce/apex/ToastController.createAccountWithName";
import { ShowToastEvent } from "lightning/platformShowToastEvent";


export default class ToastDisplay extends LightningElement {
 
    accountName;

    
   handleNameChange(event){
    this.accountName = event.detail.value;
   }
   handleAccCreation(){
        console.log(this.accountName);
        createAccountWithName({accountName: this.accountName})
        .then(()=>{
      console.log('Account is Created');
      this.showNotification();
        })
        .catch(error=>{
            console.log(error.body.message)
            // show error notification
            this.showErrorNotification();
        })
    }
        showNotification() {
    const evt = new ShowToastEvent({
      title: 'Success',
      message:'Your Account is Successfully Created',
      variant : "success"
      
    });
    this.dispatchEvent(evt);
  }

  showErrorNotification() {
    const evt = new ShowToastEvent({
      title: 'Error',
      message:'Something Went Wrong',
      variant : "error"
      
    });
    this.dispatchEvent(evt);
  }
    }

    // i want to call the apex create account and show the notification to user.