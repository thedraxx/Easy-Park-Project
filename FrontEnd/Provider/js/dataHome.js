let xhr = new XMLHttpRequest();
let url = 'http://localhost/Easy-Park/FrontEnd/Provider/php/dataHome.php';
let url2 = 'http://localhost/Easy-Park/FrontEnd/Provider/php/ObtenerCochera.php';
const login = document.getElementById("login");
let token = document.getElementById("token");
let estado = document.getElementById("estado");
let cocheras = document.getElementById("cocheras");
token.addEventListener('input', updateValueToken)
estado.addEventListener('input', updateValueEstado)
cocheras.addEventListener('click', updateValueCochera)


function updateValueToken(e) {
    token = e.target.value
}
function updateValueEstado(e) {
    estado = e.target.value
}

function updateValueCochera(e) {
    cocheras = e.target.value
}

class Gestion {
    constructor(token, estado,cocheras) {
        this.token = token;
        this.estado = estado;
        this.cocheras = cocheras;
    }

    verificacionCamposVacios() {
        if (this.token == '' || this.estado == '' || this.cocheras == '') {
            return false;
        } else {
            return true;
        }
    }

    gestion(datos) {
        fetch(url, {
            method: 'POST',
            body: datos
        })
            .then(res => res.json())
            .then(data => {
                console.log(data)
                if (data != false) {
                    Swal.fire({
                        title: 'Genial!',
                        text: `El vehiculo con la patente ${data.patente} ingreso el ${data.ingreso} y sale el ${data.salida}`,
                        imageWidth: 600,
                        imageHeight: 300,
                        imageAlt: 'Felicidades!',
                    })
                } else if (data === false) {
                    Swal.fire({
                        title: 'Error!',
                        text: `El vehiculo con la patente solicitada no se encuentra en el estacionamiento`,
                        imageWidth: 600,
                        imageHeight: 300,
                        imageAlt: 'Error!',
                    })
                } if (data === 404) {
                    Swal.fire({
                        title: 'Error!',
                        text: `No hay mas espacio en el estacionamiento`,
                        imageWidth: 600,
                        imageHeight: 300,
                        imageAlt: 'Error!',
                    })
                }
            })
    }
}

window.onload = () => {
    let codigo = localStorage.getItem('codigo');
    let datos = new FormData();
    datos.append('codigo', codigo);
    fetch(url2, {
        method: 'POST',
        body: datos
    })
        .then(res => res.json())
        .then(data => {
            data.map( (cochera) => { 
                return(
                    cocheras.innerHTML += `<option value="${cochera.cod_estac}">${cochera.direccion}</option>`
                )
            })
        })
}


login.onsubmit = (e) => {
    e.preventDefault();

    const gestion = new Gestion(token, estado);
    const verificacion = gestion.verificacionCamposVacios();

    if (!verificacion) {
        document.getElementById("error").innerHTML = "Todos los campos son obligatorios";
        setTimeout(() => {
            document.getElementById("error").innerHTML = "";
        }, 1000);
    } else {
        var datos = new FormData(login)
        gestion.gestion(datos)
    }
}




