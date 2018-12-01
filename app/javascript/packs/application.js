import "bootstrap";
import Vue from 'vue/dist/vue.esm'


import Dashboard from '../dashboard.vue'



document.addEventListener('DOMContentLoaded', function () {
  const element = document.querySelector('#dashboard')
  if (element != undefined) {
      const app = new Vue({
          el: element,
          data: {

          },
          template: "<Dashboard  />",
          components: { Dashboard }
      })
  }
})
