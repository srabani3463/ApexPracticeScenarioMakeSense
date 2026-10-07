import { LightningElement } from 'lwc';

export default class ChildEventTrigger extends LightningElement {
    selectedProduct={};

    handleFiringEvent(){

        this.selectedProduct = {id:1,  name:'Gilly Cooley'};
        // this is where custom event come into the picture to send this data to parent.
        //child level: student raised his hand.c/childComponentOne
        // you create the custom event now you create the variable to to work
        //  this event and store the value in avariable.
       this.dispatchEvent( 
    new CustomEvent('sendproductselected',{
            detail:{
                selectedProduct :this.selectedProduct,
                timestamp: new Date().toISOString(),
                selectedBy: 'Srabani'

            
            }
            
        
        })
    );

}}
    
    // now is time to raised your hand to desptch. the paper