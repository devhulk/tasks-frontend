<template>
    <div class="">
        <h1 class="">Fetching from Tasks Web Service</h1>
        <div class="">
            <div v-if="tasks">
                <h3>Tasks</h3>
                <ul class="">
                  <div v-for="task in tasks" :key="task.id" class="container" >
                    <div class="card">
                      <li v-if="!task.status" class="incomplete">{{task.title}}</li>
                      <li v-else class="complete">{{task.title}}</li>
                    </div>
                  </div>
                </ul>
            </div>
        </div>
    </div>
</template>

<script setup>
import { ref } from 'vue';
const tasks = ref(null);
fetch('https://task-service-development.up.railway.app/')
    .then(response => response.json())
    .then(data => tasks.value = data)
    .then(data => console.log(data))
</script>
<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>

.card {
  box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
  transition: 0.3s;
  border-radius: 5px; /* 5px rounded corners */
}

/* On mouse-over, add a deeper shadow */
.card:hover {
  box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
}

/* Add some padding inside the card container */
.container {
  padding: 8px 256px;
}

.incomplete {
  color: red;
}

.complete {
  color: green;
}
h3 {
  margin: 40px 0 0;
}
ul {
  list-style-type: none;
  padding: 0;
}
li {
  display: inline-block;
  margin: 0 10px;
}
a {
  color: #42b983;
}
</style>
