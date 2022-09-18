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
    constructor(password, usuario, codigo) {
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
            .then(res => res.json())
            .then(data => {
                if (data === false) {
                    document.getElementById("error").innerHTML = "Usuario no valido";
                    setTimeout(() => {
                        document.getElementById("error").innerHTML = "";
                    }, 3000);
                } else {
                    localStorage.setItem('codigo', data.cod_proveedor);
                    window.location.href = "http://localhost/Easy-Park/FrontEnd/Provider/pages/Home.html";
                }
            })
    }
}

login.onsubmit = (e) => {
    e.preventDefault();
    const loginPersona = new Person(password, usuario);
    const verificacion = loginPersona.verificacionCamposVacios();
    if (!verificacion) {
        document.getElementById("error").innerHTML = "Todos los campos son obligatorios";
        setTimeout(() => {
            document.getElementById("error").innerHTML = "";
        }, 1000);
    } else {
        let datos = new FormData(login)
        loginPersona.login(datos);
    }
}




