<template>
  <aside class="page-aside-wrapper">
    <div class="menu-hero">
      <img src="../assets/logo.svg" alt="cashforce logo" />
    </div>

    <div class="menu-item" v-for="option in menuItemOptions" :key="option.text">
      <div class="selected-item" v-if="option.selected" />
      <div class="menu-item-content">
        <img :src="getImgUrl(option.icon)" :alt="option.alt" />
        <p>{{ option.text }}</p>
      </div>
    </div>
  </aside>
</template>

<script>
  export default {
    data() {
      return {
        menuItemOptions: [{
          text: 'Notas fiscais',
          icon: 'shake-hands.svg',
          alt: 'shake hands icon',
          selected: true,
        }],
      }
    },
    methods: {
      getImgUrl(image) {
        return require(`../assets/${image}`)
      },
    }
  }
</script>

<style>
  .page-aside-wrapper {
    min-height: 100vh;
    width: 15%;
    left: 0px;
    top: 0px
  }

  .menu-hero {
    display: flex;
    align-items: center;
    justify-content: flex-start;
    margin-left: 10%;
    width: 80%;
    height: 80px;
  }

  .menu-item {
    display: flex;
    align-items: center;
    justify-content: flex-start;
    padding: 0px;
    width: 100%;
    height: 64px;
  }
  
  .menu-item-content {
    display: flex;
    justify-content: flex-start;
    align-items: center;
    width: 80%;
    margin-left: 10%;
  }

  .menu-item-content img {
    margin-right: 5%;
  }

  .selected-item {
    background-color: #00AD8C;
    width: 4px;
    height: 100%;
    position: relative;
    left: 0;
    border-radius: 5px;
  }
</style>
