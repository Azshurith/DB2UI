<template>
  <div class="p-4">
    <h1 class="text-2xl font-bold">Nuxt Headless Blog</h1>
    <ul>
      <li v-for="post in posts" :key="post.id">
        <h2 class="text-xl">{{ post.title }}</h2>
        <p>{{ post.content }}</p>
      </li>
    </ul>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue';
import { useRuntimeConfig } from '../node_modules/nuxt/dist/app';
const posts = ref([]);
const config = useRuntimeConfig();

onMounted(async () => {
  const res = await fetch(`http://localhost:${config.public.express}/api/posts`)
  posts.value = await res.json()
})
</script>
