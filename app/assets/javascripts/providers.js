/* global Vue */

document.addEventListener("DOMContentLoaded", function(event) { 
 var app = new Vue({
   el: '#app',
   data: {
     providers: [],
     zipcodes: [],
     sortAttribute: 'last_name',
     sortAscending: true,
     lastNameFilter: '',
     specialtyFilter: '',
     zipcodeFilter: '',
     key: '',
     radius: '50'
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

      refreshPage: function() {
        location.reload();
      },

      setValidZipcode: function() { 
        if(this.zipcodeFilter.length === 5) {
          $.get("https://www.zipcodeapi.com/rest/" + this.key + "/radius.json/" + this.zipcodeFilter + "/" + this.radius + "/km?minimal", function(result) {
             this.zipcodes = result.zip_codes; 
         }.bind(this));
        } 
      },

      filter: function(provider) {
        if(this.zipcodes.length > 0){
          var validZipcode = this.zipcodes.indexOf(provider.zipcode) > -1;
        } else {
          var validZipcode = provider.zipcode; 
        }
        var validlastName = provider.last_name.toLowerCase().indexOf(this.lastNameFilter.toLowerCase()) > -1;
        var validSpecialty = provider.specialty.toLowerCase().indexOf(this.specialtyFilter.toLowerCase()) > -1;
        return validlastName && validSpecialty && validZipcode 
      }

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
