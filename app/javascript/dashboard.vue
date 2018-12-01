<template>
  <div class="container">
    <div>
      <ul class="progressbar">
        <!-- class="active" -->
        <!-- <div class="progressbar_active_tab">  </div> -->
        <li  :class="{ active: stage.status === 'done' }" :key="stage.id" v-for="stage in sortedStages"> 
          <div  @mouseover="changeTab(stage)" :class="{ progressbar_dot_active: stage.status === 'done' }" class="progressbar_dot">  </div>
          <div v-if="stage.id === activeTab.id" class="progressbar_active_tab"> {{ activeTab.title }}  </div>
        </li>
      </ul>
    </div>

    <div class="dashboard__info">
      <div class="dashboard__main">
        <h2 class="dashboard__header"> {{ activeTab.title }} </h2>
        <p class="dashboard__description"> {{ activeTab.description }}  </p>
      </div>
      <div class="dashboard__secondary">
        <div class="dashboard__secondary-photo">
        </div>
        <div class="dashboard__secondary-photo-2">
        </div>
      </div>
    </div>
  </div>
</template>


<script>
export default {
  props: ['stages', 'house', 'houseComplex'],
  data() {
    return {
      activeTab: this.stages.find(element => { return element.status === 'active' })
    }
  },
  methods: {
    changeTab(stage) {
      if (stage.id === this.activeTab.id || stage.status === 'not_started')  {

      }
      else {
        this.activeTab = stage
      }
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
  }
}
</script>
