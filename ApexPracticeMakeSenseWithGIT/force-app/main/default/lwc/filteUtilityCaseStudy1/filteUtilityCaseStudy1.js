import { LightningElement } from 'lwc';

export default class FilteUtilityCaseStudy1 extends LightningElement {
    // all theese variables are filetr option or field value.
   searchText='';
   category = 'ALL';
   sortBy = 'NAME_ASC';

   columns = [
    {label: 'Name', fieldName: 'name', type: 'text'},
    {label: 'Category', fieldName: 'category', type: 'text'},
    {label: 'Score', fieldName: 'score', type: 'number'}
   ];
   items = [
    {id:'1', name: 'LWC Masterclass', category: 'Learning', score: 90},
    {id:'2', name: 'All AI', category: 'Learning', score: 85},
    {id:'3', name: 'Workout', category: 'Lifestyle', score: 80},
    {id:'4', name: 'Eating Habits', category: 'Lifestyle', score: 80},
    {id: '5',name: 'Get Job', category: 'career', score: 100}
   ]
    









    get categoryOptions(){
        return [
            { label: 'ALL', value: 'ALL' },
            { label: 'Learning', value: 'Learning' },
            { label: 'Lifestyle', value: 'Lifestyle' },
            { label: 'career', value: 'career' }
        ];
    }
 get sortOptions(){
    return [{ label: 'Name [A-Z] ', value: 'NAME_ASC' },
         { label: 'Name [Z-A]', value: 'NAME_DESC' }]
 };
 handleSearchChange(event) {
        this.searchText = event.target.value;
    }
     handleCategoryChange(event) {
        this.category = event.detail.value;
    }
    handleSortChange(event) {
        this.sortBy = event.detail.value;
    }
    get filterdata(){
        // add our logic search, filter and sort
        const textToSearch = (this.searchText || '').toLowerCase();

         let result = this.items.filter(item=>{
            const textMatch = item.name.toLowerCase().includes(textToSearch);
            const categoryMatch = this.category === 'ALL'|| item.category == this.category;

            return textMatch && categoryMatch

         });
         result = [...result].sort((a, b) => {
            switch(this.sortBy){
                case 'NAME_ASC':
                    return a.name.localeCompare(b.name);
               case 'NAME_DESC':
                return b.name.localeCompare(a.name);
            }       
            });
         return result;

    }
}