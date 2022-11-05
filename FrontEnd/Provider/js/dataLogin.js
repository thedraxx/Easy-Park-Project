let xhr = new XMLHttpRequest();
let url = 'http://localhost/Easy-Park/FrontEnd/Provider/php/servidor.php'
const login = document.getElementById("login");
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
        if (this.password == "" || this.usuario == "") {
            return false;
        } else {
            return true;
        }
    }


    login(datos) {
        fetch(url, {
            method: 'POST',
            body: datos
        })
        // Lo recibimos como JSON
            .then(res => res.json())
            .then(data => {
                // Si lo que recibimos es false, quiere decir que no existe el usuario o la contraseña es incorrecta
                if (data === false) {
                    document.getElementById("error").innerHTML = "Usuario no valido";
                    setTimeout(() => {
                        document.getElementById("error").innerHTML = "";
                    }, 3000);
                    // Si todo sale bien, guardamos en localstorage el codigo del proveedor y lo enviamos al homeScreen
                } else {
                    localStorage.setItem('codigo', data.cod_proveedor);
                    window.location.href = "http://localhost/Easy-Park/FrontEnd/Provider/pages/Home.html";
                }
            })
    }
}

// Cuando se hace click en submit, se activa esta funcion
login.onsubmit = (e) => {
    e.preventDefault();
    // Instanciamos la clase
    const loginPersona = new Person(password, usuario);
    // Verificamos que los campos no esten vacios
    const verificacion = loginPersona.verificacionCamposVacios();
    // Si los campos estan vacios, se muestra un mensaje de error
    if (!verificacion) {
        document.getElementById("error").innerHTML = "Todos los campos son obligatorios";
        setTimeout(() => {
            document.getElementById("error").innerHTML = "";
        }, 1000);
    // Si los campos no estan vacios, se envian los datos al servidor
    } else {
        // Creamos un objeto FormData
        let datos = new FormData(login)
        // Enviamos los datos al servidor
        loginPersona.login(datos);
    }
}




