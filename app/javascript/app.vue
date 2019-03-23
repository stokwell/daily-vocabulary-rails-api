<template>
  <div id="app">
    <div class="content-wrapper">
      <div class="content-container">

        <div class="column">

        </div>


        <div class="column">

          <div class="card">

            <div class="card-header">
              <p>Type a context of new word for you und select this with click</p>
            </div>

            <div class="card-body">
              <textarea v-on:keyup.enter="submit" v-model="query" class="form-control"></textarea>
            </div>

          </div>

        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios'
export default {
  data: function() {
    return {
      query: ''
    }
  },
  methods: {
    submit: function() {
      axios({
        url: "/workspace/words/search",
        type: "GET",
        params: {
          query: this.query
        },
        headers: {
          'Content-Type': 'application/json'
        },
        success: (response) => {
          console.log(response)
        }
      })
    }
  }

}
</script>

<style scoped>
  textarea {
    border:none;
    padding: none;
  }
</style>
