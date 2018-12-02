<template>
  <div class="wrapper_dashboard">
    <div class="container">
      <div>
        <ul class="progressbar">
          <li  :class="{ active: stage.status === 'done' }" :key="stage.id" v-for="stage in sortedStages"> 
            <div @mouseover="changeTab(stage)"  :class="{ progressbar_dot_active: stage.status === 'done', progressbar_dot_orange: stage.status === 'active' }" class="progressbar_dot">  </div>
            <div class="progressbar_active_tab"> {{ text_truncate(stage.title, 30) }}  </div>
            <transition name="fade" mode="out-in">
              <div v-if="stage.id === activeTab.id" class="progressbar_triangle" >  </div>
            </transition>
          </li>
        </ul>
      </div>


        <transition name="fade" mode="out-in">
          <div class="dashboard__info" :key="activeTab.id">
            <div class="dashboard__main">
              <h2 class="dashboard__header"> {{ activeTab.title }} </h2>
              <p class="dashboard__description"> {{ activeTab.description }} </p>
            </div>
            <div class="dashboard__secondary">
              <div v-if="activeTab.photo" class="dashboard__secondary-photo" :style="{'background-image': 'url(http://172.21.47.224:8081/api/image/' + activeTab.photo  + ')'}">
              </div>
              <div class="dashboard__secondary-photo-2" :style="{'background-image': 'url(' + updateImage()  +  '+ )'}" >
              </div>
            </div>
          </div>   
        </transition> 
    </div>
  </div>
</template>


<script>
export default {
  props: ['stages', 'house', 'houseComplex'],
  data() {
    return {
      activeTab: this.stages.find(element => { return element.status === 'active' }),
    }
  },
  methods: {
    changeTab(stage) {
      if (stage.id === this.activeTab.id || stage.status === 'not_started')  {

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
    setTimeout(() => {
      this.updateImage()
    }, 1000);
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
  }
}
</script>




