/*drop table if exists CLIENTE;

drop table if exists COMANDA;

drop table if exists DIRECCION;

drop table if exists DOMICILIO;

drop table if exists MESA;

drop table if exists MOTORISTA;

drop table if exists PEDIDO;

drop table if exists PLATO;

drop table if exists RESERVA;

drop table if exists SUCURSAL;

drop table if exists COMANDA;*/
CREATE DATABASE `empleado`;
USE `empleado`;

CREATE TABLE IF NOT EXISTS `empleado` (
  `emp_id` int(30) NOT NULL,
  `emp_name` varchar(50) DEFAULT NULL,
  `email_emp` varchar(50) DEFAULT NULL,
  `phone_emp` int(30) DEFAULT NULL,
  PRIMARY KEY (`emp_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
COMMIT;
/*==============================================================*/
/* Table: CLIENTE                                               */
/*==============================================================*/
create table CLIENTE
(
   ID_CLIENTE           int not null,
   ID_DIRECCION         int not null,
   NOMBRE               char(255) not null,
   APELLIDO             char(255) not null,
   /*CEDULA               int not null,
   FORMA_PAGO           char(255) not null, */
   primary key (ID_CLIENTE)
)ENGINE=MyISAM DEFAULT CHARSET=latin1;
COMMIT;
/*==============================================================*/
/* Table: COMANDA                                               */
/*==============================================================*/
create table COMANDA
(
   ID_COMANDA           int not null AUTO_INCREMENT,
   ID_CLIENTE           int not null,
   ID_SUCURSAL          int not null,
   FECHA                datetime not null,
   primary key (ID_COMANDA, ID_SUCURSAL)
)ENGINE=MyISAM DEFAULT CHARSET=latin1;
COMMIT;

/*==============================================================*/
/* Table: DIRECCION                                             */
/*==============================================================*/
create table DIRECCION
(
   ID_DIRECCION         int not null,
   CALLE                int not null,
   CARRERA              int not null,
   primary key (ID_DIRECCION)
)ENGINE=MyISAM DEFAULT CHARSET=latin1;
COMMIT;

/*==============================================================*/
/* Table: DOMICILIO                                             */
/*==============================================================*/
create table DOMICILIO
(
   ID_DOMICILIO         int not null,
   ID_CLIENTE           int not null,
   ID_COMANDA           int not null,
   ID_SUCURSAL          int not null,
   ID_MOTORISTA         int not null,
   DIRECCION            char(255) not null,
   primary key (ID_DOMICILIO)
)ENGINE=MyISAM DEFAULT CHARSET=latin1;
COMMIT;

/*==============================================================*/
/* Table: MESA                                                  */
/*==============================================================*/
create table MESA
(
   ID_MESA              int not null,
   __PUESTOS            int not null,
   ID_SUCURSAL          int not null,
   primary key (ID_MESA, ID_SUCURSAL)
)ENGINE=MyISAM DEFAULT CHARSET=latin1;
COMMIT;

/*==============================================================*/
/* Table: MOTORISTA                                             */
/*==============================================================*/
create table MOTORISTA
(
   ID_MOTORISTA         int not null,
   NOMBRE               char(255) not null,
   TARIFA               int not null,
   VEHICULO             char(255) not null,
   primary key (ID_MOTORISTA)
)ENGINE=MyISAM DEFAULT CHARSET=latin1;
COMMIT;

/*==============================================================*/
/* Table: PEDIDO                                                */
/*==============================================================*/
create table PEDIDO
(
   ID_PEDIDO            int not null,
   ID_PLATO             int not null,
   ID_COMANDA           int not null,
   ID_SUCURSAL          int not null,
   CANTIDAD             int not null,
   primary key (ID_PEDIDO, ID_PLATO, ID_COMANDA, ID_SUCURSAL)
)ENGINE=MyISAM DEFAULT CHARSET=latin1;
COMMIT;

/*==============================================================*/
/* Table: PLATO                                                 */
/*==============================================================*/
create table PLATO
(
   ID_PLATO             int not null,
   NOMBRE               char(255) not null,
   RECETA               char(255) not null,
   VALOR_UNIDA          int not null,
   primary key (ID_PLATO)
)ENGINE=MyISAM DEFAULT CHARSET=latin1;
COMMIT;

/*==============================================================*/
/* Table: RESERVA                                               */
/*==============================================================*/
create table RESERVA
(
   ID_RESERVA           int not null AUTO_INCREMENT,
   ID_CLIENTE           int not null,
   ID_SUCURSAL          int not null,
   /*ID_MESA              int not null,*/
   FECHA                DATE  not null,
   HORA                 char(255) not null,
   FORMA_PAGO           char(255) not null,
   primary key (ID_RESERVA, ID_CLIENTE, ID_SUCURSAL)
)ENGINE=MyISAM DEFAULT CHARSET=latin1;
COMMIT;

/*==============================================================*/
/* Table: SUCURSAL                                              */
/*==============================================================*/
create table SUCURSAL
(
   ID_SUCURSAL          int not null,
   ID_DIRECCION         int not null,
   NOMBRE               char(255) not null,
   primary key (ID_SUCURSAL)
)ENGINE=MyISAM DEFAULT CHARSET=latin1;
COMMIT;



/*==============================================================*/
/* Table: Mesa-registro                                              */
/*==============================================================*/
create table MESA_REGISTRO
(
   ID_MESA          int not null,
   ID_RESERVA   int not null,
   HORA              char(255) not null,
   primary key (ID_MESA, ID_RESERVA)
)ENGINE=MyISAM DEFAULT CHARSET=latin1;
COMMIT;

alter table CLIENTE add constraint FK_RELATIONSHIP_13 foreign key (ID_DIRECCION)
      references DIRECCION (ID_DIRECCION) on delete restrict on update restrict;

alter table COMANDA add constraint FK_RELATIONSHIP_5 foreign key (ID_CLIENTE)
      references CLIENTE (ID_CLIENTE) on delete restrict on update restrict;

alter table COMANDA add constraint FK_RELATIONSHIP_7 foreign key (ID_SUCURSAL)
      references SUCURSAL (ID_SUCURSAL) on delete restrict on update restrict;

alter table DOMICILIO add constraint FK_RELATIONSHIP_10 foreign key (ID_MOTORISTA)
      references MOTORISTA (ID_MOTORISTA) on delete restrict on update restrict;

alter table DOMICILIO add constraint FK_RELATIONSHIP_8 foreign key (ID_CLIENTE)
      references CLIENTE (ID_CLIENTE) on delete restrict on update restrict;

alter table DOMICILIO add constraint FK_RELATIONSHIP_9 foreign key (ID_COMANDA, ID_SUCURSAL)
      references COMANDA (ID_COMANDA, ID_SUCURSAL) on delete restrict on update restrict;

alter table PEDIDO add constraint FK_RELATIONSHIP_4 foreign key (ID_PLATO)
      references PLATO (ID_PLATO) on delete restrict on update restrict;

alter table PEDIDO add constraint FK_RELATIONSHIP_6 foreign key (ID_COMANDA, ID_SUCURSAL)
      references COMANDA (ID_COMANDA, ID_SUCURSAL) on delete restrict on update restrict;

alter table RESERVA add constraint FK_RELATIONSHIP_1 foreign key (ID_SUCURSAL)
      references SUCURSAL (ID_SUCURSAL) on delete restrict on update restrict;

alter table RESERVA add constraint FK_RELATIONSHIP_2 foreign key (ID_CLIENTE)
      references CLIENTE (ID_CLIENTE) on delete restrict on update restrict;

/*alter table RESERVA add constraint FK_RELATIONSHIP_3 foreign key (ID_MESA)
      references MESA (ID_MESA) on delete restrict on update restrict;*/

alter table SUCURSAL add constraint FK_RELATIONSHIP_12 foreign key (ID_DIRECCION)
      references DIRECCION (ID_DIRECCION) on delete restrict on update restrict;

COMMIT;
/*==============================================================*/
/* insertando datos Table: DIRECCION                                             */
/*==============================================================*/

INSERT INTO DIRECCION( ID_DIRECCION, CALLE, CARRERA) VALUES( 1, 23, 44);
INSERT INTO DIRECCION( ID_DIRECCION, CALLE, CARRERA) VALUES( 2, 40, 50);
INSERT INTO DIRECCION( ID_DIRECCION, CALLE, CARRERA) VALUES( 3, 25, 60);

INSERT INTO DIRECCION( ID_DIRECCION, CALLE, CARRERA) VALUES( 111, 25, 60);
INSERT INTO DIRECCION( ID_DIRECCION, CALLE, CARRERA) VALUES( 222, 30, 30);
INSERT INTO DIRECCION( ID_DIRECCION, CALLE, CARRERA) VALUES( 333, 40, 40);
INSERT INTO DIRECCION( ID_DIRECCION, CALLE, CARRERA) VALUES( 444, 50, 50);
/*==============================================================*/
/* insertando datos Table: CLIENTE
/*==============================================================*/
INSERT INTO CLIENTE( ID_CLIENTE, ID_DIRECCION, NOMBRE, APELLIDO) VALUES( 123, 111, "Ana", "Peres");
INSERT INTO CLIENTE( ID_CLIENTE, ID_DIRECCION, NOMBRE, APELLIDO) VALUES( 456, 222, "Cristian", 'Sanabria');
INSERT INTO CLIENTE( ID_CLIENTE, ID_DIRECCION, NOMBRE, APELLIDO) VALUES( 137, 333, "jorge", 'Peres');
INSERT INTO CLIENTE( ID_CLIENTE, ID_DIRECCION, NOMBRE, APELLIDO) VALUES( 974, 444, "Camilo", 'Castro');


/*==============================================================*/
/* insertando datos Table: MESA                                 */
/*==============================================================*/
INSERT INTO MESA(ID_MESA, __PUESTOS, ID_SUCURSAL) VALUES(10, 4, 10);
INSERT INTO MESA(ID_MESA, __PUESTOS, ID_SUCURSAL) VALUES(11, 4, 10);
INSERT INTO MESA(ID_MESA, __PUESTOS, ID_SUCURSAL) VALUES(12, 4, 10);
INSERT INTO MESA(ID_MESA, __PUESTOS, ID_SUCURSAL) VALUES(13, 4, 10);
INSERT INTO MESA(ID_MESA, __PUESTOS, ID_SUCURSAL) VALUES(14, 4, 10);
INSERT INTO MESA(ID_MESA, __PUESTOS, ID_SUCURSAL) VALUES(15, 4, 10);
INSERT INTO MESA(ID_MESA, __PUESTOS, ID_SUCURSAL) VALUES(16, 4, 10);
INSERT INTO MESA(ID_MESA, __PUESTOS, ID_SUCURSAL) VALUES(17, 4, 10);
INSERT INTO MESA(ID_MESA, __PUESTOS, ID_SUCURSAL) VALUES(18, 4, 10);
INSERT INTO MESA(ID_MESA, __PUESTOS, ID_SUCURSAL) VALUES(19, 4, 10);

INSERT INTO MESA(ID_MESA, __PUESTOS, ID_SUCURSAL) VALUES(21, 4, 20);
INSERT INTO MESA(ID_MESA, __PUESTOS, ID_SUCURSAL) VALUES(22, 4, 20);
INSERT INTO MESA(ID_MESA, __PUESTOS, ID_SUCURSAL) VALUES(23, 4, 20);
INSERT INTO MESA(ID_MESA, __PUESTOS, ID_SUCURSAL) VALUES(24, 4, 20);
INSERT INTO MESA(ID_MESA, __PUESTOS, ID_SUCURSAL) VALUES(25, 4, 20);

INSERT INTO MESA(ID_MESA, __PUESTOS, ID_SUCURSAL) VALUES(31, 4, 30);
INSERT INTO MESA(ID_MESA, __PUESTOS, ID_SUCURSAL) VALUES(32, 4, 30);
INSERT INTO MESA(ID_MESA, __PUESTOS, ID_SUCURSAL) VALUES(33, 4, 30);
INSERT INTO MESA(ID_MESA, __PUESTOS, ID_SUCURSAL) VALUES(34, 4, 30);
INSERT INTO MESA(ID_MESA, __PUESTOS, ID_SUCURSAL) VALUES(35, 4, 30);
INSERT INTO MESA(ID_MESA, __PUESTOS, ID_SUCURSAL) VALUES(36, 4, 30);
INSERT INTO MESA(ID_MESA, __PUESTOS, ID_SUCURSAL) VALUES(37, 4, 30);

/*==============================================================*/
/* insertando datos Table: SUCURSAL                             */
/*==============================================================*/
INSERT INTO SUCURSAL( ID_SUCURSAL, ID_DIRECCION, NOMBRE) VALUES(10, 1, "Bogotá");
INSERT INTO SUCURSAL( ID_SUCURSAL, ID_DIRECCION, NOMBRE) VALUES(20, 2, "Sogamoso");
INSERT INTO SUCURSAL( ID_SUCURSAL, ID_DIRECCION, NOMBRE) VALUES(30, 3, "Medellín");

/*==============================================================*/
/* insertando datos Table: PLATO                                */
/*==============================================================*/
INSERT INTO PLATO( ID_PLATO, NOMBRE, RECETA, VALOR_UNIDA) VALUES(111, "Arroz con pollo", "arroz, pollo", 10000);
INSERT INTO PLATO( ID_PLATO, NOMBRE, RECETA, VALOR_UNIDA) VALUES(112, "Arroz con Carne", "arroz, carne", 10200);
INSERT INTO PLATO( ID_PLATO, NOMBRE, RECETA, VALOR_UNIDA) VALUES(113, "Arroz con Pescado", "arroz, pescado", 25000);
INSERT INTO PLATO( ID_PLATO, NOMBRE, RECETA, VALOR_UNIDA) VALUES(114, "Higado", "Higado", 28000);
INSERT INTO PLATO( ID_PLATO, NOMBRE, RECETA, VALOR_UNIDA) VALUES(115, "Pescado", "pescado", 45000);
INSERT INTO PLATO( ID_PLATO, NOMBRE, RECETA, VALOR_UNIDA) VALUES(116, "Mariscos", "Mariscos", 60000);
INSERT INTO PLATO( ID_PLATO, NOMBRE, RECETA, VALOR_UNIDA) VALUES(117, "Sandwich", "Sandwich", 10000);
INSERT INTO PLATO( ID_PLATO, NOMBRE, RECETA, VALOR_UNIDA) VALUES(118, "Peras", "Peras", 8000);
INSERT INTO PLATO( ID_PLATO, NOMBRE, RECETA, VALOR_UNIDA) VALUES(119, "Tomates", "Tomates", 6000);
INSERT INTO PLATO( ID_PLATO, NOMBRE, RECETA, VALOR_UNIDA) VALUES(120, "Pasta", "Pasta", 30000);

