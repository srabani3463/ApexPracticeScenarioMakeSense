import { LightningElement } from 'lwc';
import {NavigationMixin}  from 'lightning/navigation';

export default class NavigationMixinPossibilities extends NavigationMixin (LightningElement) {

    

    navigateToRecordPage(){
        this[NavigationMixin.Navigate]({
        type: 'standard__recordPage',
        attributes : {
            recordId:'001gK00000GT4gXQAT',
            objectAPIName: 'Account',
            actionName: 'view'
        }
})


    }
  navigateToWeb(){
    this[NavigationMixin.Navigate]({
        type: 'standard__webPage',
        attributes : {
            url: 'https://www.youtube.com/@salesforcemakessense'
        }
})


 }
 navigateToTab(){
    this[NavigationMixin.Navigate]({
        type: 'standard__navItemPage',
        attributes : {
           
            apiName: 'Course_Enrolment'
        }
})


 }
 navigateToView(){
    this[NavigationMixin.Navigate]({
        type: 'standard__objectPage',
        attributes : {
            recordId:'001gK00000GT4gXQAT',
            objectAPIName: 'Account',
            actionName: 'home'
        }
})



 }
}