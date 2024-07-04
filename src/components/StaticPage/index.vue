<template>
  <div>
    <h1>Welcome to the Static Page</h1>
    <p>This is some sample text.</p>
    <button @click="navigateToNewPage">Navigate to New Page</button>
  </div>

</template>

<script>
export default {
  name: 'StaticPage',
  // 如果有JavaScript逻辑，可以在这里添加
  methods: {
    navigateToNewPage() {
      this.$router.push('/')
    }
  }
}
</script>

<style scoped>

</style>
