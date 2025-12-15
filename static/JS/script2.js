$(document).ready(function () {
    $('form').on('submit', function (e) {
        e.preventDefault();
        alert('Gracias por tu mensaje, trataré de estar en contacto pronto.');
        this.reset();
    });
});
