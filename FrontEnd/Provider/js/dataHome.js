// Hacemos referencia al formulario
const login = document.getElementById("login");
// Obtenemos los datos de la persona
let token = document.getElementById("token");
let plaza = document.getElementById("plaza");
let estado = document.getElementById("estado");

token.addEventListener('input', updateValueToken)
plaza.addEventListener('input', updateValuePlaza)
estado.addEventListener('input', updateValueEstado)

function updateValueToken(e) {
    token = e.target.value
}
function updateValuePlaza(e) {
    plaza = e.target.value
}
function updateValueEstado(e) {
    estado = e.target.value
}


class Plaza {
    constructor(token, plaza, estado) {
        this.token = token;
        this.plaza = plaza;
        this.estado = estado;
    }

    verificacionCamposVacios() {
        if (this.token == "" || this.plaza == "" || this.estado == "") {
            return false;
        }
        return true;
    }

}

login.onsubmit = (e) => {
    e.preventDefault();

    // llamamos a la funcion que crea el objeto
    const nuevaplaza = new Plaza(token, plaza, estado);

    // Verificamos que los datos no esten vacios
    const verificacion = nuevaplaza.verificacionCamposVacios();

    // Si los datos estan vacios, mostramos un mensaje de error
    if (!verificacion) {
        document.getElementById("error").innerHTML = "Todos los campos son obligatorios";
        setTimeout(() => {
            document.getElementById("error").innerHTML = "";
        }, 2000);
    } else {
        // Convertimos person a JSON
        const personJSON = JSON.stringify(nuevaplaza);
        console.log(personJSON);
    }
}




