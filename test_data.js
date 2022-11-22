const carreras = [
    {
        id : "1",
        nombre : "Ingeniería de Sistemas"
    },
    {
        id : "2",
        nombre : "Ingeniería Industrial"
    },
    {
        id : "3",
        nombre : "Ingeniería Civil"
    }
]

const cursos = [
    {
        id : "1",
        nombre : "Programacion Web",
        carreraId : "1"
    },
    {
        id : "2",
        nombre : "Lenguajes de Programación",
        carreraId : "1"
    },
    {
        id : "3",
        nombre : "Dibujo de Ingeniería",
        carreraId : "2"
    },
    {
        id : "4",
        nombre : "Ingeniería de Operaciones 2",
        carreraId : "2"
    }
]

module.exports = {
    carreras : carreras,
    cursos : cursos
}