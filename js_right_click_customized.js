$(document).mousedown(function(event) {
        if(event.which == 3){
            alert('Right Mouse button pressed.');
        }  
});

jQuery(document).ready(function(){
    // Disable context menu on images by right clicking
    for(i=0;i<document.images.length;i++) {
        document.images[i].onmousedown = protect;
    }
});

function protect (e) {
    //alert('Right mouse button not allowed!');
    this.oncontextmenu = function() {return false;};
}