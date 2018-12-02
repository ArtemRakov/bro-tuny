<template>
  <div>
     <vue-easy-pie-chart
        :percent="70"
        :rotate="0"
        :scale-color="0"
        :size="200"
        :line-width="10"
        class="dashboard__piechart"
        font-size="38px"
        line-cap="round"
        bar-color="#F4580F"

     ></vue-easy-pie-chart>
  </div>
</template>

<script>
  import VueEasyPieChart from 'vue-easy-pie-chart'
  import 'vue-easy-pie-chart/dist/vue-easy-pie-chart.css'
export default {
    props: ['progress'],
    components:{ VueEasyPieChart }
}
</script>