$(document).ready(function () {
    const imagenes = $(".miniatura");
    let indiceActual = 0;

    function mostrarModal(index) {
        const src = $(imagenes[index]).attr("src");
        const img = $("#imagenGrande");
        
        img.attr("src", src);
        
        // FORZAR estilos inline para evitar interferencias de Bootstrap
        img[0].style.cssText = "max-width: 85vw !important; max-height: 75vh !important; width: auto !important; height: auto !important; object-fit: contain !important; display: block !important; border-radius: 8px !important; margin: 0 auto !important;";
        
        $("#modal").css("display", "flex").hide().fadeIn();
        indiceActual = index;
    }

    $(".miniatura").click(function () {
        const index = imagenes.index(this);
        mostrarModal(index);
    });

    $("#siguiente").click(function (e) {
        e.stopPropagation();
        indiceActual = (indiceActual + 1) % imagenes.length;
        const src = $(imagenes[indiceActual]).attr("src");
        const img = $("#imagenGrande");
        
        img.fadeOut(200, function () {
            $(this).attr("src", src);
            // FORZAR estilos inline
            this.style.cssText = "max-width: 85vw !important; max-height: 75vh !important; width: auto !important; height: auto !important; object-fit: contain !important; display: block !important; border-radius: 8px !important; margin: 0 auto !important;";
            $(this).fadeIn(200);
        });
    });

    $("#anterior").click(function (e) {
        e.stopPropagation();
        indiceActual = (indiceActual - 1 + imagenes.length) % imagenes.length;
        const src = $(imagenes[indiceActual]).attr("src");
        const img = $("#imagenGrande");
        
        img.fadeOut(200, function () {
            $(this).attr("src", src);
            // FORZAR estilos inline
            this.style.cssText = "max-width: 85vw !important; max-height: 75vh !important; width: auto !important; height: auto !important; object-fit: contain !important; display: block !important; border-radius: 8px !important; margin: 0 auto !important;";
            $(this).fadeIn(200);
        });
    });

    $(".cerrar").click(function (e) {
        e.stopPropagation();
        $("#modal").fadeOut();
    });

    // Cerrar al hacer clic fuera del contenido del modal
    $("#modal").click(function (e) {
        if (!$(e.target).closest(".modal-content").length) {
            $("#modal").fadeOut();
        }
    });

    // Navegación con teclado
    $(document).on("keydown", function(e) {
        if ($("#modal").is(":visible")) {
            if (e.key === "ArrowRight") {
                $("#siguiente").click();
            } else if (e.key === "ArrowLeft") {
                $("#anterior").click();
            } else if (e.key === "Escape") {
                $("#modal").fadeOut();
            }
        }
    });
});
