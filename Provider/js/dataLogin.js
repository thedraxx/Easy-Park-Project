// Hacemos referencia al formulario
const login = document.getElementById("login");
// Obtenemos los datos de la persona
const password = document.getElementById("password").value;
const usuario = document.getElementById("usuario").value;

class Person {
    constructor(password, usuario) {
        this.password = password;
        this.usuario = usuario;
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
    const persona = new Person(password, usuario);

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




