import { LightningElement } from 'lwc';

export default class ChildToParentEvents extends LightningElement {
     showFinalValue={};
     selectedProduct ={};
     timestamp;
     selectedBy ='Unknown as of now';
    handleProductSelection(event){
        
        const {selectedProduct,timestamp,selectedBy } = event.detail;
            this.selectedProduct = selectedProduct;
        this.timestamp = timestamp;
        this.selectedBy = selectedBy;

    }
}