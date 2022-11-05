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


// Instanciamos la clase
class Gestion {
    // El constructor de la clase recibe los datos
    constructor(token, estado) {
        this.token = token;
        this.estado = estado;
    }

// El metodo verificacionCamposVacios verifica que el token no este vacio ni que sea menor a 6 caracteres o mayor a 6 caracteres
    verificacionCamposVacios() {
        if (this.token == 0 || this.token.length < 6 || this.token.length > 6) {
            return false;
        } else if (this.token.length === 6 ){
            return true;
        }
    }

    // El metodo enviarDatos envia los datos al servidor por el metodo POST
    gestion() {
        // Esto no lee bien si es ingreso o salida
        console.log(this.estado)
        console.log(this.token)
            // Creamos un objeto FormData para enviar los datos al servidor
            let datosEstado = new FormData();
            datosEstado.append('token', this.token);
            datosEstado.append('ingreso', this.estado);
        fetch(url, {
            method: 'POST',
            body: datosEstado,
            mode: 'no-cors', // <---
            cache: 'default',
        })
        // Recibimos la respuesta del servidor en json
            .then(res => res.text())
            .then(data => {
                console.log(data)
                   // Si la respuesta es correcta mostramos un mensaje de exito
                   if (data == true  || data == 1 || data == '1') {
                    Swal.fire({
                        title: 'Felicidades!',
                        text: `Cambio de estado exitoso`,
                        imageWidth: 600,
                        imageHeight: 300,
                        imageAlt: 'Felicidades!',
                    })
                    // Si la respuesta es incorrecta mostramos un mensaje de error
                } else {
                    Swal.fire({
                        title: 'Error!',
                        text: `A ocurrido un Error`,
                        imageWidth: 600,
                        imageHeight: 300,
                        imageAlt: 'Error!',
                    })
                }
            })
    }
}

// Cuando se carga la pagina, se activa esta funcion 
window.onload = () => {
    // Recibimos el codigo del servidor del localStorage
    let codigo = localStorage.getItem('codigo');
    // Creamos un objeto FormData para enviar los datos
    let datos = new FormData();
    // Agregamos los datos al objeto FormData
    datos.append('codigo', codigo);
    fetch(url2, {
        method: 'POST',
        body: datos
    })
    // Recibimos la respuesta del servidor en json
        .then(res => res.json())
        // Recibimos todas las cocheras asociadas al proveedor y lo mostramos en pantalla
        .then(data => {
            data.map((cochera) => {
                return (
                    cocheras.innerHTML += `<option value="${cochera.cod_estac}">${cochera.direccion}</option>`
                )
            })
        })
}


// Cuando se hace click en submit, se activa esta funcion
login.onsubmit = (e) => {
    e.preventDefault();

    // Instanciamos la clase
    const gestion = new Gestion(token, estado);
    // Verificamos que los campos sean validos
    const verificacion = gestion.verificacionCamposVacios();

    // Si devuelve false, significa que hay campos vacios y mandamos una alerta
    if (!verificacion) {
        document.getElementById("error").innerHTML = "Todos los campos son obligatorios";
        setTimeout(() => {
            document.getElementById("error").innerHTML = "";
        }, 1000);
     // Si devuelve true, significa que los campos estan completos y procedemos a enviar los datos
    } else {
        // Llamamos a la funcion gestion y le pasamos los datos
        gestion.gestion()
    }
}




