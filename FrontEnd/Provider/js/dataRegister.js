// Hacemos referencia al formulario
const login = document.getElementById("login");
// Obtenemos los datos de la persona
let nombre = document.getElementById("nombre");
let password = document.getElementById("password");
let usuario = document.getElementById("usuario");
let localidad = document.getElementById("localidad");
let email = document.getElementById("email");
let domicilio = document.getElementById("domicilio");
let plazas = document.getElementById("plazas");

nombre.addEventListener('input', updateValueNombre)
password.addEventListener('input', updateValuePassword)
usuario.addEventListener('input', updateValueUsuario)
localidad.addEventListener('input', updateValueLocalidad)
email.addEventListener('input', updateValueEmail)
domicilio.addEventListener('input', updateValueDomicilio)
plazas.addEventListener('input', updateValuePlazas)

function updateValueNombre(e) {
    nombre = e.target.value
}

function updateValuePassword(e) {
    password = e.target.value
}
function updateValueUsuario(e) {
    usuario = e.target.value
}
function updateValueLocalidad(e) {
    localidad = e.target.value
}

function updateValueEmail(e) {
    email = e.target.value
}
function updateValueDomicilio(e) {
    domicilio = e.target.value
}
function updateValuePlazas(e) {
    plazas = e.target.value
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
        if (this.nombre == "") {
            console.log(this.nombre)
            return false;
        } else {
            return true
        }
    }
}

login.onsubmit = (e) => {
    e.preventDefault();

    // llamamos a la funcion que crea el objeto
    const persona = new Person(
        nombre,
        password,
        usuario,
        localidad,
        email,
        domicilio,
        plazas
    );

    // Verificamos que los datos no esten vacios
    const verificacion = persona.verificacionCamposVacios();
    // Si los datos estan vacios, mostramos un mensaje de error
    if (!verificacion) {
        document.getElementById("error").innerHTML = "Todos los campos son obligatorios";
        setTimeout(() => {
            document.getElementById("error").innerHTML = "";
        }, 2000);
    } else {
        // Convertimos person a JSON
        const personJSON = JSON.stringify(persona);
        console.log(personJSON);
    }
}




