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
    telefono = e.target.value
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
        localidad,
        email,
        telefono) {
        this.nombre = nombre;
        this.password = password;
        this.localidad = localidad;
        this.email = email;
        this.telefono = telefono;
    }

    // Verifican que los campos sean validos si lo es retorna true sino false
    verificacionCamposVacios() {
        let mayus = new RegExp('^(?=.*[A-Z])');
        let special = new RegExp('^(?=.*[!@#$&*])');
        let number = new RegExp('^(?=.*[0-9])');
        let lower = new RegExp('^(?=.*[a-z])');
        let length = new RegExp('^(?=.{8,})');

        let mayusBool = mayus.test(this.password);
        let specialBool = special.test(this.password);
        let numberBool = number.test(this.password);
        let lowerBool = lower.test(this.password);
        let lengthBool = length.test(this.password);

        if (this.password.length < 8 || !mayusBool || !specialBool || !numberBool || !lowerBool || !lengthBool) {
            console.log("Contraseña no valida");
            return false;  
        }
        else if (this.nombre.length < 3) {
            console.log("Nombre no valido");
            return false;  
        }
        else {
            console.log('Todo bien');
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
                    document.getElementById("error").innerHTML = "Error de registro";
                    setTimeout(() => {
                        document.getElementById("error").innerHTML = "";
                    }, 3000);
                }
                // Si la respuesta es distinta a esos mensaje entonces se registro correctamente y lo envia al Home
                else {
                    Swal.fire({
                        title: 'Felicidades!',
                        text: `Proveedor Registrado Correctamente`,
                        imageWidth: 600,
                        imageHeight: 300,
                        imageAlt: 'Error!',
                    })
                    setTimeout(() => {
                        window.location.href = "http://localhost/Easy-Park/FrontEnd/Provider/index.html";
                    }, 1500);
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