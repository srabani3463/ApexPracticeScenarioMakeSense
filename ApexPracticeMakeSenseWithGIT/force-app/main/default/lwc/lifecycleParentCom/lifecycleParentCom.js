import { LightningElement } from 'lwc';

export default class LifecycleParentCom extends LightningElement {
    constructor(){
        super();
        {
        console.log('parent--Constructor is called');
        }


    }
    connectedCallback(){
    console.log('Parent--Connected call back is fired');

    }
    renderedCallback(){
       console.log('Parent--render call back is fired');

    }
    disconnectedCallback(){
        console.log('Parent--Component is done with what it was supposed to be');

    }
    errorCallback(){
      console.log(stack+'------'+trace);
    }
}