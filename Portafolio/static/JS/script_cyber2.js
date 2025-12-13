$(document).ready(function() {
    // Validación de formulario
    $('#formularioContacto').on('submit', function(e) {
        e.preventDefault();
        const nombre = $('#nombre').val();
        const correo = $('#correo').val();
        const mensaje = $('#mensaje').val();

        if (nombre && correo && mensaje) {
            $('#form-feedback')
                .text("Mensaje enviado correctamente. ¡Gracias por contactarnos!")
                .css("color", "#00ffe7");
            this.reset();
        } else {
            $('#form-feedback')
                .text("Por favor completa todos los campos.")
                .css("color", "red");
        }
    });
});

// ✅ Esta función queda fuera para que el botón la pueda llamar
function evaluarTest() {
    const p1 = $('#pregunta1').val();
    const p2 = $('#pregunta2').val();
    let score = 0;

    if (p1 === "buena") score++;
    if (p2 === "buena") score++;

    let resultado = "";
    if (score === 2) {
        resultado = "<span style='color: #00ffe7;'>¡Excelente! Estás muy bien informado.</span>";
    } else if (score === 1) {
        resultado = "<span style='color: #ffe600;'>Vas bien, pero puedes mejorar.</span>";
    } else {
        resultado = "<span style='color: red;'>Ups, necesitas aprender más sobre seguridad.</span>";
    }

    $('#resultadoTest').html(resultado);
}

