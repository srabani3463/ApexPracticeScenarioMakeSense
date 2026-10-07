import { LightningElement } from 'lwc';
import pictureimage from '@salesforce/resourceUrl/makesense';
// Example :- import TRAILHEAD_LOGO from '@salesforce/resourceUrl/trailhead_logo';"
// show custom label
import SHOWINPROD from '@salesforce/label/c.Show_production';
//show user info
import USER_INFO from '@salesforce/user/Id';

export default class StaticResourceMakeSense extends LightningElement {
   src=pictureimage;

   //showInProd = true;
   label = SHOWINPROD;
    userId=USER_INFO;
    

   get showInProd(){
      return this.label == 'true' ? true: false;
   }
}