const express = require("express")
const bodyParser = require("body-parser")
const cors = require("cors")
const { Client } = require('pg');

const data = require("./test_data") // importamos data de test
const { usuario, producto , orden , orden_producto, pc_armado, pc_armado_producto, reporte, resena, categoria_prod, epic, steam} = require("./dao")


const PUERTO = 4447


const client = new Client({
    host: 'localhost',
    user: 'postgres',
    database: 'postgres',
    password: 'postgres',
    port: 5432,
});


const app = express()
app.use(bodyParser.json())
app.use(bodyParser.urlencoded({
    extended : true
}))
app.use(cors()) // politica CORS (cualquier origen) <---- TODO: cuidado!!!
app.use(express.static("assets")) // <-- configuracion de contenido estatico

const TOKEN = "Hernan Quintana"

app.post("/login", async (req, resp) => {
    const correo = req.body.correo
    const contrasena = req.body.contrasena
    const Usuario = await usuario.findOne({
        where: {
            correo: correo,
            contrasena: contrasena
        }
    }) 

    if(Usuario == null) {
        //login incorrecto
        resp.send(
            {
                error : "Error en el login"
            }
        )
    }else {
        //login correcto
        resp.send(
            {
                error : "",
                token: TOKEN
            }
        )
    }
})
app.get("/usuariosform", async (req, resp) => {   
    const listausuarios = await usuario.findAll({
        where: { id: "97fc8611-b8da-4540-ae75-7d542de20a87"} },
    )
    resp.send(listausuarios )})

app.post("/usuariosact", async (req,resp) => {
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

    await usuario.update({
        nombre : nombre,
        apellido : apellido,
        correo : correo,
        cod_post : cod_post,
        telefono : telefono,
        ciudad : ciudad,
        departamento : departamento,
        direccion : direccion,
        contrasena : contrasena,
    },
    {
    where: { id: "97fc8611-b8da-4540-ae75-7d542de20a87" }},)

    resp.send({
        confirmar: "Registro exitoso"
    })
})

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

    try {await usuario.create({
        nombre : nombre,
        apellido : apellido,
        correo : correo,
        cod_post : cod_post,
        telefono : 0,
        ciudad : "",
        departamento : "",
        direccion : "",
        contrasena : contrasena
        })
    } catch (error) {
        resp.send({
            error : "ERROR"
        })
        return
    }

    resp.send({
        confirmar: "Registro exitoso"
    })
})



/*
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
*/
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

app.get("/productos_ranking", async (req, resp) => {
    await client.connect()
    //const listaproductos = await producto.findAll()
    const listaproductos = await client.query(
      'SELECT * FROM producto ORDER BY uvendidas DESC'
    )
  
    resp.send(listaproductos)
  })
  

app.get("/productos", async (req, resp) => {
    const categoria_prod_id = req.query.categoria_prod
    if (categoria_prod_id == undefined || categoria_prod_id == "-1"){

        const listaproductos = await producto.findAll()

        resp.send(listaproductos)
    }else{
        const productosFiltrados = await producto.findAll({
            where: {
                categoria_prod_id: categoria_prod_id
            }
        })
        resp.send(productosFiltrados)
    }
})
app.get("/pcxcomponentes", async (req, resp) => {
    const pc_armado_id = req.query.pc_armado_producto
    if (pc_armado_id == undefined || pc_armado_id == "-1"){

        const listaproductoxarmada = await producto.findAll()
        resp.send(listaproductoxarmada)
    }else{
        const productosxarmadaFiltrados = await producto.findAll({
            where: {
                pc_armado_id: pc_armado_id
            }
        })
        resp.send(productosxarmadaFiltrados)
    }

})
app.get("/pcarmadas", async (req, resp) => {
    const listapcarmado = await pc_armado.findAll()
    resp.send(listapcarmado)
})
app.get("/pcarm_producto", async (req, resp) => {
    const listapcarm_producto = await pc_armado_producto.findAll()
    resp.send(listapcarm_producto)

})
app.get("/historial_compras", async (req, resp) => {
    const listahistorial_compras = await orden_producto.findAll()
    resp.send(listahistorial_compras)
})
app.get("/orden", async (req, resp) => {
    const listaorden = await orden.findAll()
    resp.send(listaorden)
    })
app.get("/categoria_producto", async (req, resp) => {
    const listacategoria_prod = await categoria_prod.findAll()
    resp.send(listacategoria_prod)
})

app.get("/steam", async (req, resp) => {
    const listasteamjuegos = await steam.findAll()
    resp.send(listasteamjuegos)
})

app.get("/epic", async (req, resp) => {
    const listaepicjuegos = await epic.findAll()
    resp.send(listaepicjuegos) 
})


app.listen(PUERTO, () => {
    console.log(`Servidor web iniciado en puerto ${PUERTO}`)
})
