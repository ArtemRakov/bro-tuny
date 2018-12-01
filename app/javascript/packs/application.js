import "bootstrap";
import Vue from 'vue/dist/vue.esm'

import 'animate.css/animate.min.css'

import Dashboard from '../dashboard.vue'



document.addEventListener('DOMContentLoaded', function () {
  const element = document.querySelector('#dashboard')
  if (element != undefined) {
      const app = new Vue({
          el: element,
          data: {
            house: JSON.parse(element.dataset.house),
            houseComplex: JSON.parse(element.dataset.houseComplex),
            stages: JSON.parse(element.dataset.stages),
          },
          template: "<Dashboard :stages='stages' :house='house' :houseComplex='houseComplex'  />",
          components: { Dashboard }
      })
  }
})
