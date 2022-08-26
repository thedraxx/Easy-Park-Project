// Hacemos referencia al formulario
const login = document.getElementById("login");
// Obtenemos los datos de la persona
let password = document.getElementById("password");
let usuario = document.getElementById("usuario");

password.addEventListener('input', updateValuePassword)
usuario.addEventListener('input', updateValueUsuario)

function updateValuePassword(e) {
    password = e.target.value
}
function updateValueUsuario(e) {
    usuario = e.target.value
}


class Person {
    constructor(password, usuario) {
        this.password = password;
        this.usuario = usuario;
    }

    verificacionCamposVacios() {
        if (this.password === "" || this.usuario === "") {
            return false;
        } else {
            return true;
        }

    }
}

login.onsubmit = (e) => {
    e.preventDefault();

    // llamamos a la funcion que crea el objeto
    const loginPersona = new Person(password, usuario);

    // Verificamos que los datos no esten vacios
    const verificacion = loginPersona.verificacionCamposVacios();

    // Si los datos estan vacios, mostramos un mensaje de error
    if (!verificacion) {
        document.getElementById("error").innerHTML = "Todos los campos son obligatorios";
        setTimeout(() => {
            document.getElementById("error").innerHTML = "";
        }, 1000);
    } else {
        // Convertimos person a JSON
        const personJSON = JSON.stringify(loginPersona);
        console.log(personJSON);
        window.location.href = "../pages/Home.html";
    }




}




