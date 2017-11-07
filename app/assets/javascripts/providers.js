/* global Vue */
document.addEventListener("DOMContentLoaded", function(event) { 
 var app = new Vue({
   el: '#app',
   data: {
     providers: []
   },
   mounted: function() {
      $.get('/api/v1/providers.json', function(result) {
         this.providers = result; 
      }.bind(this));
   },
   methods: {

      // function formatPhone(obj) {
      //             var numbers = obj.value.replace(/\D/g, ''),
      //         char = { 0: '(', 3: ') ', 6: ' - ' };
      //             obj.value = '';
      //             for (var i = 0; i < numbers.length; i++) {
      //                 obj.value += (char[i] || '') + numbers[i];
      //             }
      //         }

   },
   computed: {

   }
 });
});
