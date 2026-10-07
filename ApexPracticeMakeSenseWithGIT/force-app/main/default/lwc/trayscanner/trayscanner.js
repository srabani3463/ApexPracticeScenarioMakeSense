import { LightningElement, track } from 'lwc';
import getTrayBySerial from '@salesforce/apex/TrayController.getTrayBySerial';
export default class TrayScanner extends LightningElement {
    @track serial = '';
    @track tray;
    handleSerialChange(event) {
        this.serial = event.target.value;
    }
    handleSearch() {
        getTrayBySerial({ serialNumber: this.serial })
            .then(result => {
                this.tray = result;
            })
            .catch(error => {
                console.error(error);
            });
    }
}