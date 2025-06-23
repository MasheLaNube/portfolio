$(document).ready(function () {
    const imagenes = $(".miniatura");
    let indiceActual = 0;

    function mostrarModal(index) {
        const src = $(imagenes[index]).attr("src");
        $("#imagenGrande").attr("src", src);
        $("#modal").fadeIn();
        indiceActual = index;
    }

    $(".miniatura").click(function () {
        const index = imagenes.index(this);
        mostrarModal(index);
    });

    $("#siguiente").click(function () {
        indiceActual = (indiceActual + 1) % imagenes.length;
        const src = $(imagenes[indiceActual]).attr("src");
        $("#imagenGrande").fadeOut(function () {
        $(this).attr("src", src).fadeIn();
        });
    });

    $("#anterior").click(function () {
        indiceActual = (indiceActual - 1 + imagenes.length) % imagenes.length;
        const src = $(imagenes[indiceActual]).attr("src");
        $("#imagenGrande").fadeOut(function () {
        $(this).attr("src", src).fadeIn();
        });
    });

    $(".cerrar").click(function () {
        $("#modal").fadeOut();
    });

    // Cerrar al hacer clic fuera del contenido del modal
    $("#modal").click(function (e) {
        if (!$(e.target).closest(".modal-content").length) {
        $("#modal").fadeOut();
        }
    });
});
