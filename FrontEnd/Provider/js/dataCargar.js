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

    // Verificamos que los campos no esten vacios
    verificacionCamposVacios() {
        if (this.nombre.value == "" || this.plazas.value == "" || this.horario.value == "" || this.precio.value == "" || this.ciudad.value == "" || this.provincia.value == "" || this.calle.value == "" || this.numero.value == "") {
            return false;
        } else {
            return true;
        }
    }

    // el metodo que se encarga de enviar los datos al servidor
    cargar() {
        // Recibimos el codigo del proveedor del local storage
        let codigo = localStorage.getItem('codigo');
        // Creamos un objeto FormData para enviar los datos al servidor
        let datos = new FormData();
        datos.append('nombre', this.nombre);
        datos.append('plazas', this.plazas);
        datos.append('horario', this.horario);
        datos.append('precio', this.precio);
        datos.append('ciudad', this.ciudad);
        datos.append('provincia', this.provincia);
        datos.append('calle', this.calle);
        datos.append('numero', this.numero);
        datos.append('codigo', codigo);

        // Enviamos los datos al servidor
        fetch(url, {
            method: 'POST',
            body: datos
        })
            // Recibimos la respuesta del servidor en formato json
            .then(res => res.json())
            .then(data => {
                // Si la respuesta es correcta mostramos un mensaje de exito
                if (data == true) {
                    Swal.fire({
                        title: 'Felicidades!',
                        text: `Estacionamiento cargado correctamente`,
                        imageWidth: 600,
                        imageHeight: 300,
                        imageAlt: 'Felicidades!',
                    })
                    // Si la respuesta es incorrecta mostramos un mensaje de error
                } else {
                    Swal.fire({
                        title: 'Error!',
                        text: `No se pudo cargar el estacionamiento`,
                        imageWidth: 600,
                        imageHeight: 300,
                        imageAlt: 'Error!',
                    })
                }
            })
    }
}


// al hacer click en el boton de cargar
login.onsubmit = (e) => {
    e.preventDefault();

    // instancio la clase 
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

    // verifico que los campos no esten vacios con el metodo verificacionCamposVacios()
    const verificacion = cargarestacionamiento.verificacionCamposVacios();

    // si verificacion es false quiere decir que hay campos vacios, por lo que mandamos un mensaje de alerta
    if (!verificacion) {
        document.getElementById("error").innerHTML = "Todos los campos son obligatorios";
        setTimeout(() => {
            document.getElementById("error").innerHTML = "";
        }, 1000);
        // Si es true, entonces se ejecuta el metodo de cargar
    } else {
        cargarestacionamiento.cargar();
    }
}




