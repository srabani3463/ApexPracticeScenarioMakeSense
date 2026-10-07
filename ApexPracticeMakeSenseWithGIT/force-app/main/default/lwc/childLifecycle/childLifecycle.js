import { LightningElement } from 'lwc';

export default class ChildLifecycle extends LightningElement {
    constructor(){
        super();
        {
        console.log('Child--Constructor is called');
        }


    }
    connectedCallback(){
    console.log('Child--Connected call back is fired');

    }
    renderedCallback(){
       console.log('Child--render call back is fired');

    }
    disconnectedCallback(){
        console.log('Child--Component is done with what it was supposed to be');

    }
    errorCallback(){
      console.log(stack+'------'+trace);
    }
}