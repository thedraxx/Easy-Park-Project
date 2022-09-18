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

    verificacionCamposVacios() {
        if (this.nombre === "" || this.password === "" || this.usuario === "" || this.localidad === "" || this.email === "" || this.domicilio === "" || this.plazas === "") {
            return false;
        } else {
            return true
        }
    }

    enviarDatos(datos) {
        fetch(url, {
            method: 'POST',
            body: datos
        })
            .then(res => res.text())
            .then(data => {

                if (data === 'ERROR NO SE PUDO REGISTRAR') {
                    document.getElementById("error").innerHTML = "ERROR NO SE PUDO REGISTRAR";
                    setTimeout(() => {
                        document.getElementById("error").innerHTML = "";
                    }, 3000);
                } else {
                    window.location.href = "http://localhost/Easy-Park/FrontEnd/Provider/pages/Home.html";
                }
            })
    }
}

login.onsubmit = (e) => {
    e.preventDefault();
    const persona = new Person(
        nombre,
        password,
        telefono,
        email,
        localidad,
    );
    const verificacion = persona.verificacionCamposVacios();
    if (!verificacion) {
        document.getElementById("error").innerHTML = "Todos los campos son obligatorios";
        setTimeout(() => {
            document.getElementById("error").innerHTML = "";
        }, 2000);
    } else {
        let datos = new FormData(login)
        persona.enviarDatos(datos)
    }
}