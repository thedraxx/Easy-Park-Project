let xhr = new XMLHttpRequest();
let url = 'http://localhost/Easy-Park/FrontEnd/Provider/php/dataRegister.php'
const login = document.getElementById("login");
let nombre = document.getElementById("nombre");
let password = document.getElementById("password");
let telefono = document.getElementById("telefono");
let email = document.getElementById("email");
let localidad = document.getElementById("localidad");

nombre.addEventListener('input', updateValueNombre)
password.addEventListener('input', updateValuePassword)
telefono.addEventListener('input', updateValueTelefono)
email.addEventListener('input', updateValueEmail)
localidad.addEventListener('input', updateValueLocalidad)

function updateValueNombre(e) {
    nombre = e.target.value
}
function updateValuePassword(e) {
    password = e.target.value
}
function updateValueTelefono(e) {
    usuario = e.target.value
}
function updateValueLocalidad(e) {
    localidad = e.target.value
}
function updateValueEmail(e) {
    email = e.target.value
}
class Person {
    constructor(
        nombre,
        password,
        usuario,
        localidad,
        email,
        domicilio,
        plazas) {
        this.nombre = nombre;
        this.password = password;
        this.usuario = usuario;
        this.localidad = localidad;
        this.email = email;
        this.domicilio = domicilio;
        this.plazas = plazas;
    }

    // Verifican que los campos sean validos si lo es retorna true sino false
    verificacionCamposVacios() {
        if (this.nombre === "" || this.password === "" || this.usuario === "" || this.localidad === "" || this.email === "" || this.domicilio === "" || this.plazas === "") {
            return false;
        } else {
            return true
        }
    }

    // Esto Envia los datos al servidor por el metodo POST
    enviarDatos(datos) {
        fetch(url, {
            method: 'POST',
            body: datos
        })
            // Recibe una respuesta del servidor en formato JSON
            .then(res => res.json())
            .then(data => {
                // Si la respuesta es igual a ERROR NO SE PUDO REGISTRAR muestra un mensaje de error
                if (data === 'ERROR NO SE PUDO REGISTRAR') {
                    document.getElementById("error").innerHTML = "ERROR NO SE PUDO REGISTRAR";
                    setTimeout(() => {
                        document.getElementById("error").innerHTML = "";
                    }, 3000);
                }
                // Si la respuesta es distinta a esos mensaje entonces se registro correctamente y lo envia al Home
                else {
                    window.location.href = "http://localhost/Easy-Park/FrontEnd/Provider/pages/Home.html";
                }
            })
    }
}

// Evento click del boton
login.onsubmit = (e) => {
    e.preventDefault();
    // Instanciamos la clase
    const persona = new Person(
        nombre,
        password,
        telefono,
        email,
        localidad,
    );
    // Verificamos que los campos no esten vacios
    const verificacion = persona.verificacionCamposVacios();

    // Si la verificacion me devuelve un false significa que hay campos vacios y muestra un mensaje
    if (!verificacion) {
        document.getElementById("error").innerHTML = "Todos los campos son obligatorios";
        setTimeout(() => {
            document.getElementById("error").innerHTML = "";
        }, 2000);
        // Si todo sale bien sigue adelante
    } else {
        // Creamos un objeto FormData para enviar los datos
        let datos = new FormData(login)
        // Enviamos los datos
        persona.enviarDatos(datos)
    }
}