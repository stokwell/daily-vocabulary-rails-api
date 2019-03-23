
// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery
//= require turbolinks
//= require_tree .

if (window.location.hash == '#_=_'){
    // Check if the browser supports history.replaceState.
    if (history.replaceState) {

        // Keep the exact URL up to the hash.
        var cleanHref = window.location.href.split('#')[0];

        // Replace the URL in the address bar without messing with the back button.
        history.replaceState(null, null, cleanHref);

    } else {

        // Well, you're on an old browser, we can get rid of the _=_ but not the #.
        window.location.hash = '';

    }
}
