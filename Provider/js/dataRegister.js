// Hacemos referencia al formulario
const login = document.getElementById("login");
// Obtenemos los datos de la persona
const nombre = document.getElementById("nombre").value;
const password = document.getElementById("password").value;
const usuario = document.getElementById("usuario").value;
const localidad = document.getElementById("localidad").value;
const email = document.getElementById("email").value;
const domicilio = document.getElementById("domicilio").value;
const plazas = document.getElementById("plazas").value;

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
        if (this.password == "" || this.usuario == "") {
            return false;
        }
        return true;
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
    if (verificacion == false) {
        document.getElementById("error").innerHTML = "Todos los campos son obligatorios";
        setTimeout(() => {
            document.getElementById("error").innerHTML = "";
        }, 2000);
    }

    // Convertimos person a JSON
    const personJSON = JSON.stringify(persona);
    console.log(personJSON);


}




