/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb
import Vue from 'vue/dist/vue.esm'
import Vuex from 'vuex'
import TurbolinksAdapter from 'vue-turbolinks'

import App from '../app.vue'

Vue.use(Vuex)
Vue.use(TurbolinksAdapter)

Vue.component('app', App)
Vue.component('vue-word-form', {

})

window.store = new Vuex.Store({
  state: {
    words: []
  },

  mutations: {
    addWord(state, data){

    },
    editing(state, data){

    }
  }
})

document.addEventListener('turbolinks:load', function(){
  const app = new Vue({
    data: window.store,
    el: '[data-behavior="vue"]',
    store: window.store
  })
})
