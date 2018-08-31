<template>
  <div id="collection-form">
    <div class="modal-body">
      <input v-model="title" class="form-control"></input>
    </div>
    <div class="modal-footer">
      <button @click="save" type="button" class="btn btn-primary">Save changes</button>
    </div>
  </div>
</template>
<script>
export default {
  name: "collection-form",
  data: () => ({
    title: ''
  }),
  methods: {
    save: function() {
      var data = new FormData
      data.append("reading", this.name)
      Rails.ajax({
        url: '/readings',
        type: "POST",
        data: data,
        dataType: "json",
        success: (data) => {
          console.log("hey")
        }
      })
    }
  }
}
</script>
<style lang="scss" scoped>
</style>
