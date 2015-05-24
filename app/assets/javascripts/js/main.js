/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function() {
    filterReload();
})

function filterReload() {
    $(".toggle-bar").click(function() {
        var target = $(this).data("toggle-target");
        $(".toggle-target").not("*[data-toggle-id='" + target + "']").hide();
        $("*[data-toggle-id='" + target + "']").slideToggle();
    })
}