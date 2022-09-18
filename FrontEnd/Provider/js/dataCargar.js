let xhr = new XMLHttpRequest();
let url = 'http://localhost/Easy-Park/FrontEnd/Provider/php/dataCargar.php';
const login = document.getElementById("login");
let nombre = document.getElementById("nombre");
let plazas = document.getElementById("plazas");
let horario = document.getElementById("horario");
let precio = document.getElementById("precio");
let ciudad = document.getElementById("ciudad");
let provincia = document.getElementById("provincia");
let calle = document.getElementById("calle");
let numero = document.getElementById("numero");

nombre.addEventListener('input', updateValueNombre)
plazas.addEventListener('input', updateValuePlazas)
horario.addEventListener('input', updateValueHorario)
precio.addEventListener('input', updateValuePrecio)
ciudad.addEventListener('input', updateValueCiudad)
provincia.addEventListener('input', updateValueProvincia)
calle.addEventListener('input', updateValueCalle)
numero.addEventListener('input', updateValueNumero)

function updateValueNombre(e) {
    nombre = e.target.value
}
function updateValuePlazas(e) {
    plazas = e.target.value
}
function updateValueHorario(e) {
    horario = e.target.value
}
function updateValuePrecio(e) {
    precio = e.target.value
}

function updateValueCiudad(e) {
    ciudad = e.target.value
}

function updateValueProvincia(e) {
    provincia = e.target.value
}

function updateValueCalle(e) {
    calle = e.target.value
}

function updateValueNumero(e) {
    numero = e.target.value
}

class CargarEstacionamiento {
    constructor(
        nombre,
        plazas,
        horario,
        precio,
        ciudad,
        provincia,
        calle,
        numero
    ) {
        this.nombre = nombre;
        this.plazas = plazas;
        this.horario = horario;
        this.precio = precio;
        this.ciudad = ciudad;
        this.provincia = provincia;
        this.calle = calle;
        this.numero = numero;
    }

    verificacionCamposVacios() {
        if (this.nombre.value == "" || this.plazas.value == "" || this.horario.value == "" || this.precio.value == "" || this.ciudad.value == "" || this.provincia.value == "" || this.calle.value == "" || this.numero.value == "") {
            return false;
        } else {
            return true;
        }
    }

    cargar() {
        let codigo = localStorage.getItem('codigo');

        let datos = new FormData();
        datos.append('nombre', this.nombre.value);
        datos.append('plazas', this.plazas.value);
        datos.append('horario', this.horario.value);
        datos.append('precio', this.precio.value);
        datos.append('ciudad', this.ciudad.value);
        datos.append('provincia', this.provincia.value);  
        datos.append('calle', this.calle.value);
        datos.append('numero', this.numero.value);
        datos.append('codigo', codigo);

        fetch(url, {
            method: 'POST',
            body: datos
        })
            .then(res => res.json())
            .then(data => {
                if (data == true) {
                    Swal.fire({
                        title: 'Felicidades!',
                        text: `Estacionamiento cargado correctamente`,
                        imageWidth: 600,
                        imageHeight: 300,
                        imageAlt: 'Felicidades!',
                      })  
                }
            })
    }
}

login.onsubmit = (e) => {
    e.preventDefault();

    const cargarestacionamiento = new CargarEstacionamiento(
        nombre,
        plazas,
        horario,
        precio,
        ciudad,
        provincia,
        calle,
        numero
    );

    const verificacion = cargarestacionamiento.verificacionCamposVacios();

    if (!verificacion) {
        document.getElementById("error").innerHTML = "Todos los campos son obligatorios";
        setTimeout(() => {
            document.getElementById("error").innerHTML = "";
        }, 1000);
    } else {
        cargarestacionamiento.cargar();
    }
}




