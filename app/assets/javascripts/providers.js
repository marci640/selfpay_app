/* global Vue */
document.addEventListener("DOMContentLoaded", function(event) { 
 var app = new Vue({
   el: '#app',
   data: {
     providers: [],
     sortAttribute: 'last_name',
     sortAscending: true,
     lastNameFilter: '',
     specialtyFilter: '',
     stateFilter: '',
     cityFilter: ''
   },

   mounted: function() {
      $.get('/api/v1/providers.json', function(result) {
         this.providers = result; 
      }.bind(this));
   },
   methods: {

      setSortAttribute: function(inputAttribute) {
         if(inputAttribute !== this.sortAttribute) {
            this.sortAscending = true; 
         } else {
            this.sortAscending = !this.sortAscending; 
         }
         this.sortAttribute = inputAttribute; 
      },

      filter: function(provider){
         var validCity = provider.city.toLowerCase().indexOf(this.cityFilter.toLowerCase()) > -1;
         var validState = provider.state.toLowerCase().indexOf(this.stateFilter.toLowerCase()) > -1;
         var validlastName = provider.last_name.toLowerCase().indexOf(this.lastNameFilter.toLowerCase()) > -1;
         var validSpecialty = provider.specialty.toLowerCase().indexOf(this.specialtyFilter.toLowerCase()) > -1;
         return validCity && validlastName && validState && validSpecialty;
      },

   },
   computed: {
      modifiedProviders: function() {
         return this.providers.sort(function(provider1, provider2) {
            if (this.sortAscending) {
               return provider1[this.sortAttribute].localeCompare(provider2[this.sortAttribute]);
            } else {
               return provider2[this.sortAttribute].localeCompare(provider1[this.sortAttribute]);
            }
         }.bind(this));
      }

   }
 });
});
