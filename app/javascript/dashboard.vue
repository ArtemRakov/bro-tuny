<template>
  <div class="wrapper_dashboard">
    <div class="dashboard__container">
    <h1 class="header_dashboard text-center"> Ход строительства </h1>
      <div class="dashboard__cards">
        <div class="dashboard__stages">
            <ul class="progressbar">
              <li  :class="{ active: stage.status === 'done' }" :key="stage.id" v-for="stage in sortedStages"> 
                <div @mouseover="changeTab(stage)"  :class="{ progressbar_dot_active: stage.status === 'done', progressbar_dot_orange: stage.status === 'active' }" class="progressbar_dot">  </div>
                <div class="progressbar_active_tab"> {{ text_truncate(stage.title, 30) }}  </div>
                <transition name="fade" mode="out-in">
                  <div v-if="stage.id === activeTab.id" class="progressbar_triangle" >  </div>
                </transition>
              </li>
            </ul>


            <transition name="fade" mode="out-in">
              <div class="dashboard__info" :key="activeTab.id">
                <div class="dashboard__main">
                  <h2 class="dashboard__header"> {{ activeTab.title }} </h2>
                  <p class="dashboard__description" v-html="activeTab.description"> </p>
                </div>
                <div class="dashboard__secondary">
                  <div v-if="activeTab.photo" class="dashboard__secondary-photo" :style="{'background-image': 'url(http://172.21.47.224:8081/api/image/' + activeTab.photo  + ')'}">
                  </div>
                  <!-- <div class="dashboard__secondary-photo-2" :style="{'background-image': 'url(' + updateImage()  +  '+ )'}" >
                  </div> -->
                </div>
              </div>   
            </transition> 
        </div>
        <div class="dashboard__house">
          <!-- <div class="dashboard__secondary-photo-2" :style="{'background-image': 'url(http://178.210.43.234:874/avreg-cgi/jpg/image.cgi?camera=2&ab=dmlld2VyOjE1OTc1Mw==&_=1543737832368)'}" > -->
          <!-- </div> -->
          <div class="dashboard__house-top">
            <h3 class="dashboard__house-header"> Информация о доме </h3>
            <p class="dashboard__house-info"> Название: Чайка </p>
            <p class="dashboard__house-info"> Адрес: Чайковского, 10 </p>
            <p class="dashboard__house-info"> Дата окончания: 20.11.2020 </p>
          </div>

          <!-- <div class="dashboard__img"> -->
              <!-- <div class="dashboard__secondary-photo-2" :style="{'background-image': 'url(' + updateImage()  +  '+ )'}" >
              </div>  -->
              <img class="dashboard__picture" src="http://178.210.43.234:874/avreg-cgi/jpg/image.cgi?camera=2&ab=dmlld2VyOjE1OTc1Mw==&_=1543737832368" alt="">
            <!-- <piechart @progress="100"> </piechart> -->
          <!-- </div> -->
        </div>
      </div>
  </div>
  </div>
</template>


<script>

import piechart from './components/Piechart.vue';

export default {
  props: ['stages', 'house', 'houseComplex'],
  data() {
    return {
      activeTab: {},
    }
  },
  methods: {
    changeTab(stage) {
      if (stage.id === this.activeTab.id)  {

      }
      else {
        this.activeTab = stage
      }
    },
    updateImage() {
      return 'http://178.210.43.234:874/avreg-cgi/jpg/image.cgi?camera=2&ab=dmlld2VyOjE1OTc1Mw==&_=1543737832368'
    },
    text_truncate(str, length, ending) {
      if (length == null) {
        length = 100;
      }
      if (ending == null) {
        ending = '...';
      }
      if (str.length > length) {
        return str.substring(0, length - ending.length) + ending;
      } else {
        return str;
      }
    }
  },
  created() {
    const tab = this.stages.find(element => { return element.status === 'active' })
    if (tab == undefined) {
      this.activeTab = this.stages.first
    }
  },
  computed: {
    sortedStages: function() {
      function compare(a, b) {
        if (a.position < b.position)
          return -1;
        if (a.position > b.position)
          return 1;
        return 0;
      }
      return this.stages.sort(compare);
    }
  },
  components: {
    piechart: piechart
  }
}
</script>




