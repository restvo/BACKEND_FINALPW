const { Sequelize, DataTypes } = require("sequelize");

// postgres://<USUARIO>:<PASSWORD>@<URL_HOST_BD>:<PUERTO_BD>/<NOMBRE_BD>


const CADENA_CONEXION = 
    "postgres://evaluaciones:postgres@localhost:5432/pwfinal"

    const sequelize = new Sequelize(CADENA_CONEXION)

    const usuario = sequelize.define("usuario", {
        id : {
            primaryKey : true,
            type : DataTypes.UUID,
            defaultValue : Sequelize.UUIDV4
        },
        nombre : {
            type : DataTypes.STRING(200),
            allowNull : false
        },
        apellido: {
            type : DataTypes.STRING(200),
            allowNull : true
        },  
        correo:{
            type : DataTypes.STRING(200),
            allowNull : false
        },
        contrasena:{
            type: DataTypes.STRING(200),
            allowNull : false
        },
        direccion: {
            type : DataTypes.STRING(200),
            allowNull : true
        },
        departamento: {
            type : DataTypes.STRING(200),
            allowNull : true
        },
        ciudad: {
            type :  DataTypes.STRING(200),
            allowNull : true
        },
        cod_post: {
            type : DataTypes.STRING(200),
            allowNull : true
        },
        telefono: {
            type : DataTypes.INTEGER,
            allowNull : false
        }

    }, {
        timestamps : false,
        freezeTableName : true
    })
    const producto = sequelize.define("producto",{
        id : {
            primaryKey: true,
            type: DataTypes.UUID,
            defaultValue : Sequelize.UUIDV4
        },
        nombre:{
            type : DataTypes.STRING(200),
            allowNull : false
        },
        precio: {
            type : DataTypes.INTEGER,
            allowNull : false
        },  
        descripcion: {
            type : DataTypes.STRING(200),
            allowNull : false
        },
        categoria:{
            type : DataTypes.STRING(200),
            allowNull : false
        }
    },
    {
        timestamps : false,
        freezeTableName : true
    })

    const orden = sequelize.define("orden",{
        id : {
            primaryKey: true,
            type: DataTypes.UUID,
            defaultValue : Sequelize.UUIDV4
        },
        monto:{
            type : DataTypes.INTEGER,
            allowNull : false
        },
        direccion: {
            type : DataTypes.STRING(200),
            allowNull : false
        },
        fecha: {
            type : DataTypes.DATE,
            allowNull : false
        },
        usuario_id:{
            type: DataTypes.UUID,
            defaultValue : Sequelize.UUIDV4,
            allowNull : false
        }
    },
    {
        timestamps : false,
        freezeTableName : true
    })
    const orden_producto = sequelize.define("orden_producto",{
        id : {
            primaryKey: true,
            type: DataTypes.UUID,
            defaultValue : Sequelize.UUIDV4
        },
        orden_id : {
            type: DataTypes.UUID,
            defaultValue : Sequelize.UUIDV4
        },
        producto_id : {
            type: DataTypes.UUID,
            defaultValue : Sequelize.UUIDV4
        }
    },
    {
        timestamps : false,
        freezeTableName : true
    })
    const pc_armado = sequelize.define("pc_armado",{
        id : {
            primaryKey: true,
            type: DataTypes.UUID,
            defaultValue : Sequelize.UUIDV4
        },
        nombre: {
            type : DataTypes.STRING(200),
            allowNull : false
        },
        descripcion: {
            type : DataTypes.STRING(200),
            allowNull : false
        }
    },
    {
        timestamps : false,
        freezeTableName : true
    })
    const pc_armado_producto = sequelize.define("pc_armado_producto",{
        id: {
            primaryKey: true,
            type: DataTypes.UUID,
            defaultValue : Sequelize.UUIDV4
        },
        pc_armado_id: {
            
            type: DataTypes.UUID,
            defaultValue : Sequelize.UUIDV4
        },
        producto_id: {
            
            type: DataTypes.UUID,
            defaultValue : Sequelize.UUIDV4
        }
    },
    {
        timestamps : false,
        freezeTableName : true
    })
    const reporte =  sequelize.define("reporte",{
        id: {
            primaryKey: true,
            type: DataTypes.UUID,
            defaultValue : Sequelize.UUIDV4
        },
        correo:{
            type : DataTypes.STRING(200),
            allowNull : false
        },
        nombre:{
            type : DataTypes.STRING(200),
            allowNull : false
        },
        telefono:{
            type : DataTypes.STRING(200),
            allowNull : false
        },
        asunto:{
            type : DataTypes.STRING(200),
            allowNull : false
        },
        descripcion:{
            type : DataTypes.STRING(200),
            allowNull : false
        },
        usuario_id: {
            
            type: DataTypes.UUID,
            defaultValue : Sequelize.UUIDV4
        }
    },
    {
        timestamps : false,
        freezeTableName : true
    })

    const resena =  sequelize.define("resena",{
        id: {
            primaryKey: true,
            type: DataTypes.UUID,
            defaultValue : Sequelize.UUIDV4
        },
        puntaje:{
            type : DataTypes.STRING(200),
            allowNull : false
        },
        comentario:{
            type : DataTypes.STRING(200),
            allowNull : false
        },
        video:{
            type : DataTypes.STRING(200),
            allowNull : false
        },
        link:{
            type : DataTypes.STRING(200),
            allowNull : false
        },
        tipo_resena:{
            type : DataTypes.STRING(200),
            allowNull : false
        },
        usuario_id: {
            
            type: DataTypes.UUID,
            defaultValue : Sequelize.UUIDV4
        }
    },
    {
        timestamps : false,
        freezeTableName : true
    })

    //Relaciones
    //reporte *-------->1 usuario
     reporte.belongsTo(usuario,{
        foreignKey : "usuario_id"
    })
    usuario.hasMany(reporte,{
        foreignKey : "id"
    })
    //resena *-------->1 usuario
    resena.belongsTo(usuario,{
        foreignKey : "usuario_id"
        })
    usuario.hasMany(resena,{
        foreignKey : "id"
    })
    //orden *-------->1 usuario
    orden.belongsTo(usuario,{
        foreignKey : "usuario_id"
    })
    usuario.hasMany(orden,{
        foreignKey : "id"
    })
    //orden_producto *-------->1 orden
    orden_producto.belongsTo(orden,{
        foreignKey : "orden_id"
    })
    orden.hasMany(orden_producto,{
        foreignKey : "id"
    })
    //orden_producto *-------->1 producto
    orden_producto.belongsTo(producto,{
        foreignKey : "producto_id"
    })
    producto.hasMany(orden_producto,{
        foreignKey : "id"
    })
    //pc_armado_producto *-------->1 producto
    pc_armado_producto.belongsTo(producto,{
        foreignKey : "producto_id"
    })
    producto.hasMany(pc_armado_producto,{
        foreignKey : "id"
    })
    //pc_armado_producto *-------->1 pc_armado
    pc_armado_producto.belongsTo(pc_armado,{
        foreignKey : "pc_armado_id"
    })
    pc_armado.hasMany(pc_armado_producto,{
        foreignKey : "id"
    })

    module.exports = { usuario, producto, orden, orden_producto, pc_armado, pc_armado_producto, reporte, resena }
/*
const CADENA_CONEXION = 
    "postgresql://evaluaciones:evaluaciones@localhost:5432/evaluacionesdb"

const sequelize = new Sequelize(CADENA_CONEXION)

const Carrera = sequelize.define("carrera", {
    id : {
        primaryKey : true,
        type : DataTypes.UUID,
        defaultValue : Sequelize.UUIDV4
    },
    nombre : {
        type : DataTypes.STRING(200),
        allowNull : false
    } 
}, {
    timestamps : false,
    freezeTableName : true
})

const Curso = sequelize.define("curso", {
    id : {
        primaryKey : true,
        type : DataTypes.UUID,
        defaultValue : Sequelize.UUIDV4
    },
    nombre : {
        type : DataTypes.STRING(150),
        allowNull : false
    },
    carrera_id : {
        type : DataTypes.UUID,
        allowNull : true
    }
}, {
    timestamps : false,
    freezeTableName : true
})

const Evaluacion = sequelize.define("evaluacion", {
    id : {
        primaryKey : true,
        type : DataTypes.UUID,
        defaultValue : Sequelize.UUIDV4
    },
    nombre : {
        type : DataTypes.STRING(200),
        allowNull : false
    },
    fecha_registro : {
        type : DataTypes.DATE,
        allowNull : true
    },
    curso_id : {
        type : DataTypes.UUID,
        allowNull : false
    },
    ciclo_id : {
        type : DataTypes.UUID,
        allowNull : false
    }
}, {
    timestamps : false,
    freezeTableName : true
})

const Ciclo = sequelize.define("ciclo", {
    id : {
        primaryKey : true,
        type : DataTypes.UUID,
        defaultValue : Sequelize.UUIDV4
    },
    nombre : {
        type : DataTypes.STRING(200),
        allowNull : false
    }
}, {
    timestamps : false,
    freezeTableName : true
})

const Estudiante = sequelize.define("estudiante", {
    id : {
        primaryKey : true,
        type : DataTypes.UUID,
        defaultValue : Sequelize.UUIDV4
    },
    username : {
        type : DataTypes.STRING(20),
        allowNull : false
    },
    password : {
        type : DataTypes.STRING(100),
        allowNull : false
    }
}, {
    timestamps : false,
    freezeTableName : true
})

const Resolucion = sequelize.define("resolucion", {
    id : {
        primaryKey : true,
        type : DataTypes.UUID,
        defaultValue : Sequelize.UUIDV4
    },
    estudiante_id : {
        type : DataTypes.UUID,
        allowNull : false        
    },
    evaluacion_id : {
        type : DataTypes.UUID,
        allowNull : false
    },
    fecha_envio : {
        type : DataTypes.DATE,
        allowNull : false
    },
    upvote : {
        type : DataTypes.INTEGER
    },
    url : {
        type : DataTypes.STRING(2048)
    }
}, {
    timestamps : false,
    freezeTableName : true
})


// Relaciones
// Curso * <----> 1 Carrera
Curso.belongsTo(Carrera, {
    foreignKey : "carrera_id"
})
Carrera.hasMany(Curso, {
    foreignKey : "id"
})

// Evaluacion * <----> 1 Curso
Evaluacion.belongsTo(Curso, {
    foreignKey : "curso_id"
})
Curso.hasMany(Evaluacion, {
    foreignKey : "id"
})

// Evaluacion * <----> 1 Ciclo
Evaluacion.belongsTo(Ciclo, {
    foreignKey : "ciclo_id"
})
Ciclo.hasMany(Evaluacion, {
    foreignKey : "id"
})

// Resolucion * <----> 1 Estudiante
Resolucion.belongsTo(Estudiante, {
    foreignKey : "estudiante_id"
})
Estudiante.hasMany(Resolucion, {
    foreignKey : "id"
})

// Resolucion * <----> 1 Evaluacion
Resolucion.belongsTo(Evaluacion, {
    foreignKey : "evaluacion_id"
})
Evaluacion.hasMany(Resolucion, {
    foreignKey : "id"
})


module.exports = {
    Carrera, Curso, Ciclo, Evaluacion, Estudiante, Resolucion
}
*/

