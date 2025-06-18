MERGE (:Pelicula {titulo: "The Dark Knight", fechaEstreno: "18-07-2008", sinopsis: "Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.", clasificacion: "PG-13", duracion: 152, imbdLink: "https://www.imdb.com/es/title/tt0468569/?ref_=nm_knf_t_1"});
MERGE (:Director:Persona {nombre: "Christopher", apellido: "Nolan", nombreCompleto: "Christopher Nolan"});
MERGE (:Actor:Persona {nombre: "Christian", apellido: "Bale", nombreCompleto: "Christian Bale", imbdLink: "https://www.imdb.com/es/name/nm0000288/"});
MERGE (:Idioma {nombre: "Español", abreviacion: "ESP", tieneSubtitulos: "false"});
MERGE (:Idioma {nombre: "Ingles", abreviacion: "ING", tieneSubtitulos: "true"});
MERGE (:Sucursal {nombre: "Cinépolis Plaza Norte", direccion: "Av. Principal 123, Plaza Norte", telefono: "+54-261-123-4567", correo: "norte@cinepolis.com.ar", ciudad: "Mendoza", activa: "true"});
MERGE (:Horario {hora: "14:30", tipo: "tarde"});
MERGE (:Genero {nombre: "Acción", slug: "accion"});
MERGE (:Sala {nombre: "Sala 1", capacidad: 150, formato: "2D", precio: 8500});
------------------PONER SEPARADO-----------------
MATCH (p:Pelicula {titulo: "The Dark Knight"})
MATCH (d:Director {nombreCompleto: "Christopher Nolan"})
MATCH (a:Actor {nombreCompleto: "Christian Bale"})
MATCH (g:Genero {nombre: "Acción"})
MERGE (d)-[:DIRIGIO]->(p)
MERGE (a)-[:ACTUO_EN]->(p)
MERGE (p)-[:PERTENECE_A]->(g)
------------------PONER SEPARADO-----------------
MATCH (p:Pelicula {titulo: "The Dark Knight"})
MATCH (es:Idioma {nombre: "Español"})
MATCH (en:Idioma {nombre: "Ingles"})
MERGE (p)-[:SE_PROYECTA_EN]->(es)
MERGE (p)-[:SE_PROYECTA_EN]->(en)
------------------PONER SEPARADO-----------------
MATCH (p:Pelicula {titulo: "The Dark Knight"})
MATCH (s:Sala {nombre: "Sala 1"})
MATCH (h:Horario {hora: "14:30"})
MATCH (sc:Sucursal {nombre: "Cinépolis Plaza Norte"})
MERGE (p)-[:SE_EMITE_EN {desde: date("2025-06-09")}]->(s)
MERGE (s)-[:TIENE_HORARIO]->(h)
MERGE (s)-[:PERTENECE_A]->(sc)


