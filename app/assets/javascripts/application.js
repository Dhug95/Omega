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
//= require turbolinks
//= require bootstrap
//= require_tree .
//= require jquery 
//= require jquery_ujs

var set_stars = function(form_id, stars) {
    for (i=1; i<=5; i++) {
        if(i <= stars) {
            $('#' + form_id + '_' + i).addClass('on');
        } 
        else {
            $('#' + form_id + '_' + i).removeClass('on');
        }
    }
}


$(function() {
    $('.rating_star').click(function() {
        var star = $(this);
        var form_id = $(this).attr('data-form-id');
        var stars = $(this).attr('data-stars');
        
        
        set_stars(form_id,stars);
        
        $('#' + form_id + '_stars').val(stars);
        
        $.ajax({
            type: "post",
            url: $('#' + form_id).attr('action'),
            data: $('#' + form_id).serialize()
        });
    });
});