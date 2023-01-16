create table cargo(
	id serial primary key, 
	nombre varchar(20) not null,
	descripcion varchar(230) null
	);

create table persona(
	identificacion varchar(15) primary key,
	nombreCompleto varchar(30) not null,
	idCargo int null references cargo(id) on delete restrict on update cascade,
	clave varchar(20) not null
	);

create table categoriapaciente(
	id serial primary key,
	nombre varchar(20) not null,
	descripcion varchar(500) null
	);

create table turno(
	id serial primary key,
	dia varchar(12) null,
	fecha date not null,
	horaInicio time not null,
	horaFinal time not null,
	idCategoriaPaciente int not null references categoriaPaciente(id) on delete restrict on update cascade,
	cantidadPacientes varchar(4) null,
	identificacionPersona varchar(15) not null references persona(identificacion) on delete restrict on update cascade
	);
	