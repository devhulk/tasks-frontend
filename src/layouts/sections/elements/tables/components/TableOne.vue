<script setup>
//Vue Material Kit 2 Pro components
import Table from "@/examples/tables/Table.vue";
import { ref, onBeforeMount} from 'vue';

  let tableData = ref({
  headers: ["Title", "Description", "Status"],
  rows: [],
      })

let url = 'https://task-service-development.up.railway.app/'

function getTasks(url) {
  return fetch(url)
      .then(response => response.json())
      .then(data => {
          tableData.value.rows = data
      })
}

onBeforeMount(() => {
  getTasks(url)
    .then(setInterval(() => {
		getTasks(url)
	}, 3000))

})
  



// table data
</script>
<template>
  <Table v-bind="tableData" />
</template>
