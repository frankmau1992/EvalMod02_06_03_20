# EvalMod02_06_03_20
Gestionar el diseño de la solución de la base de datos de acuerdo   a  estándares   definidos   por   la   industria  y/o empresa.

Dadas las siguientes tablas:

empleado (idEmpleado, nombreEmpleado,  fechaIngreso)
servicio (idServicio, nombreServicio, valorServicio
vehiculo (idVehiculo, marcaVehiculo, modeloVehiculo)
prestación_servicio (idPrestacionServicio, IdServicio, idEmpleado, idVehiculo, fecha)

a.-Mostrar la cantidad de prestaciones de servicios ejecutados entre el 01 de octubrey el 26 de noviembre del 2018.
b.-Mostrar la cantidad total de prestaciones realizadas agrupadas por idVehiculo.
c.-Mostrar los vehículos con la menor cantidad de prestaciones de servicios realizados.

2.-Crear con DDL unatabla empleado que contenga losiguiente:

IdEmpleado.
nombre.
apellido.
dirección.
teléfono.
idDepartamento.

3.-Se desea crear un sitio web con información referente a las películas en cartel en las salas de un dudoso cine cercano a la plaza de armas. De cada película, se almacena una ficha con su título de distribución, su título original, su género, el idioma original, si tiene subtítulos en español o no, los paísesde origen, el año de la producción, la URLdel  sitio  web  de  la  película,  la  duración  (en  horas  y  minutos),  la  calificación  (Apta  todo público,+9 años, +15 años,+18 años), fecha de estreno en Santiago, un resumen y un identificador de la película. 

De cada película interesa conocer la lista de directores y el reparto, es decir para cada actorque trabaja, el nombre de todos los personajes que interpreta. Además,interesa  disponer  de  información  sobre  los directores  y  actores  que  trabajan  en  cada película. De ambos, se conoce su nombre (que lo identifica) y su nacionalidad. Además,se desea conocer  la  cantidad  de  películas  en  las  que  dirigieron  o  actuaron.  Tenga  en  cuenta  que  hay personas que cumplen los dos roles. 

Los cines pueden tener más de una sala y cada semana cada uno de los cines envía la cartelera para dicha semana, indicando de detalle de las funciones. Para cada función se conoce el día de la semana y la hora de comienzo, y obviamente la sala y la película que exhibe. De cada sala se sabe el nombre, un número que la identifica dentro del cine y la cantidad de butacas que posee. 

De cada cine se conoce el nombre que lo identifica, su dirección y teléfono para consultas. Algunos  cines  cuentan  con  promociones.,  estas  promociones  dependen  de  la  función.  (Ej.  De lunes a jueves antes de las 18:00 horas,50% de descuento en la sala Xdel cinepara Xpelícula.La función  del  lunes  a  las  14:00para  la  película Xen  la  sala X,  no  se  cobra  a  los  escolares  con uniforme.

De cada promoción se conoce una descripción y el descuento que aplica. Además del resumen de la película que se incluye en la ficha interesa mostrar la opinión de las personas que vieron la película. De cada opinión se conoce el nombre de la persona que la realiza, su edad, le fecha en que registró su opinión, la calificación que le dio a la película (Obra Maestra, Muy Buena, Buena, Regular, Mala) y el comentario propiamente dicho. A cada opinión se le asigna un número que la identifica respecto de la película sobre la cual opina.
