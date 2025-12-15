$(document).ready(function() {
    $('.titulo-virus').on('click', function() {
        $(this).toggleClass('abierto');
        $(this).next('.contenido-virus').slideToggle(300);
    });
});

