const express = require("express")
const bodyParser = require("body-parser")
const cors = require("cors")

const data = require("./test_data") // importamos data de test
const { usuario, producto , orden , orden_producto, pc_armado, pc_armado_producto, reporte, resena} = require("./dao")


const PUERTO = 4447

const app = express()
app.use(bodyParser.json())
app.use(bodyParser.urlencoded({
    extended : true
}))
app.use(cors()) // politica CORS (cualquier origen) <---- TODO: cuidado!!!
app.use(express.static("assets")) // <-- configuracion de contenido estatico


app.post("/usuarios", async (req,resp) => {
    const dataRequest = req.body
    const nombre = dataRequest.nombre
    const apellido = dataRequest.apellido
    const correo = dataRequest.correo
    const cod_post= dataRequest.cod_post
    const telefono = dataRequest.telefono
    const ciudad = dataRequest.ciudad
    const departamento = dataRequest.departamento
    const direccion = dataRequest.direccion
    const contrasena = dataRequest.contrasena

    await usuario.create({
        nombre : nombre,
        apellido : apellido,
        correo : correo,
        cod_post : cod_post,
        telefono : telefono,
        ciudad : ciudad,
        departamento : departamento,
        direccion : direccion,
        contrasena : contrasena,
    })

    resp.send({
        confirmar: "Registro exitoso"
    })
})
app.post("/reporte", async (req,resp) => {
    const dataRequest = req.body
    const correo = dataRequest.correo
    const nombre = dataRequest.nombre
    const telefono = dataRequest.telefono
    const asunto = dataRequest.asunto
    const descripcion = dataRequest.descripcion
    //se necesitaria esto? 
    const usuario_id = dataRequest.usuario_id

    
    await reporte.create({
        correo : correo,
        nombre : nombre,
        telefono : telefono,
        asunto : asunto,
        descripcion : descripcion,
        usuario_id : usuario_id,
    })  
    resp.send({
        confirmar: "Reporte enviado correctamente"
    })
})
app.post("/resena", async (req,resp) => {
    const dataRequest = req.body
    const puntaje = dataRequest.puntaje
    const comentario = dataRequest.comentario
    const video = dataRequest.video
    const link = dataRequest.link
    const tipo_resena = dataRequest.tipo_resena
    const usuario_id = dataRequest.usuario_id
    await resena.create({
        puntaje : puntaje,
        comentario : comentario,
        video : video,
        link : link,
        tipo_resena : tipo_resena,
        usuario_id : usuario_id,
    })
    resp.send({
        confirmar: "Reseña enviada correctamente"
    })
})


app.get("/productos", async (req, resp) => {
    const listaproductos = await producto.findAll()
    resp.send(listaproductos)
})
app.get("/pcarmadas", async (req, resp) => {
    const listapcarmado = await pc_armado.findAll()
    resp.send(listapcarmado)
})
app.get("/pcarm_produto", async (req, resp) => {
    const listapcarm_produto = await pc_armado_producto.findAll()
    resp.send(listapcarm_produto)

})
app.get("/historial_compras", async (req, resp) => {
    const listahistorial_compras = await orden_producto.findAll()
    resp.send(listahistorial_compras)
})
app.get("/orden", async (req, resp) => {
    const listaorden = await orden.findAll()
    resp.send(listaorden)
    })


app.listen(PUERTO, () => {
    console.log(`Servidor web iniciado en puerto ${PUERTO}`)
})
/*
//1. Servicio que nos devuelva una lista de carreras
// path: "/carreras" metodo: GET
app.get("/carreras", async (req, resp) => {
    const listaCarreras = await Carrera.findAll()

    resp.send(listaCarreras)
})


//2. Servicio (endpoint) que nos devuelva una lista de cursos
// path: "/cursos" metodo: GET
// query parameter "/cursos?carrera=1"
app.get("/cursos", async (req, resp) => {
    const carreraId = req.query.carrera

    if (carreraId == undefined || carreraId === "-1") {

        const listaCursos = await Curso.findAll()

        resp.send(listaCursos)
    }else {
        const cursosFiltrados = await Curso.findAll({
            where : {
                carrera_id : carreraId
            }
        })
        resp.send(cursosFiltrados)
    }

})

// 3. Endpoint para listar ciclos
app.get("/ciclos", async (req, resp) => {
    const listadoCiclos = await Ciclo.findAll()
    resp.send(listadoCiclos)
})

// 4. Endpoint para listar evaluaciones
// path: "/evaluaciones" metodo: GET
// query parameter "/evaluaciones?curso=12312&ciclo=23523532"
app.get("/evaluacion", async (req, resp) => {
    const cursoId = req.query.curso
    const cicloId = req.query.ciclo

    if (cicloId == undefined || cicloId === "-1"){
        // Caso que no se seleccione ciclo
        const listadoEvaluaciones = await Evaluacion.findAll({
            where : {
                curso_id : cursoId
            }
        })
        resp.send(listadoEvaluaciones)
    }else {
        // Caso que SI se seleccione ciclo
        const listadoEvaluaciones = await Evaluacion.findAll({
            where : {
                curso_id : cursoId,
                ciclo_id : cicloId
            }
        })
        resp.send(listadoEvaluaciones)
    }
})

// 5: Registro de resolucion de evaluacion
// Recibir la data en el Cuerpo peticion HTTP (POST)
// Request:
// {
//      estudiante_id : "22344523532",
//      evaluacion_id : "22344523532",
//      url : "http://blablac.com/archivo.zip",
// }
app.post("/resolucion", (req, resp) => {
    
})

app.listen(PUERTO, () => {
    console.log(`Servidor web iniciado en puerto ${PUERTO}`)
})
*/
