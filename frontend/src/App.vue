<template>
  <main class="main-content">
    <PageAside />
    <OrdersTable />
  </main>
</template>

<script>
import PageAside from './components/PageAside.vue';
import OrdersTable from './components/OrdersTable.vue';

export default {
  name: 'App',
  components: {
    PageAside,
    OrdersTable,
  },
}
</script>

<style>
  html, body {
    margin: 0;
    padding: 0;
    border: 0;
    box-sizing: border-box;
  }

  #app {
    font-family: Avenir, Helvetica, Arial, sans-serif;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
    color: #2c3e50;
  }

  .main-content {
    display: flex;
    width: 100%;
    min-height: 100vh;
  }
</style>
