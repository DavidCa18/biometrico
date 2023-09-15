function Expiracion() {

    $.ajax({
        type: "POST",
        url: "../ServletValidarExpiracion",
        success: function (responseText) {
            console.log(responseText[0].msm);
            if (responseText[0].msm != 'VIGENTE') {
                swal({
                    title: "Licencia Expirada",
                    text: "Estimado Cliente la licencia de la aplicación a expirado,\n para más informacion contactese con la empresa proveedora.",
                    type: "warning",
                    confirmButtonColor: "#DD6B55",
                    confirmButtonText: "Aceptar",
                    closeOnConfirm: false
                }, function () {
                    location.replace('../index.jsp?cerrar=true');
                });
            }

        }
    }).fail(function (xhr, ajaxOptions, thrownError) {
        toastr.error('Error al comprobar expiracion', 'Gestión Expiracion');
    });
}
setInterval(function () {
    Expiracion();
}, 60000);

