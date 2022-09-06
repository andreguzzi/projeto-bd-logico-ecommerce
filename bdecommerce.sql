-- criação do banco de dados para o e-commerce
create database ecommerce;
-- drop database ecommerce;
-- show tables;
-- drop table clients;

-- criar as tabelas, cliente, produdo e pedido...

CREATE TABLE clients (
  idClient INT NOT NULL AUTO_INCREMENT  PRIMARY KEY,
  Fname VARCHAR(10),
  Minit VARCHAR(3),
  Lname VARCHAR(20),
  CPF CHAR(11) NOT NULL,
  Address VARCHAR(30),
  DataNascimento DATE NOT NULL,
  constraint unique_cpf_client unique(CPF)
  );
  
  alter table clients auto_increment=1;
  
  -- desc clients;
  -- produto 
  
  CREATE TABLE product (
  idProduct INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  Pname varchar(10) not null,
  category enum('Eletronico','Brinquedos','Vestimento','Alimentos') not null,
  avaliacao float default 0,
  size varchar(10)
 );
 
 -- pagamento
 
 create table payments (
	idclient int,
    idPayment int,
    typePayment enum('Boleto','Cartão', 'Dois Cartões'),
    limitAvailable float,
    primary key(idclient, idPayment)
 );
  
  -- pedido
  CREATE TABLE orders (
  idOrder INT NOT NULL AUTO_INCREMENT primary key,
  idOrderClient  int,
  orderStatus ENUM('Cancelado', 'Confirmado', 'Em processamento') default 'Em processamento',
  orderDescription VARCHAR(255),
  sendValue float default 10,
  paymentCash bool default false,
  constraint fk_orders_client foreign key (idOrderclient) references clients(idClient)
  on update cascade
  );

-- desc orders;
-- estoque

create table productStorage(
	idProdStorage int auto_increment primary key,
    storageLocation varchar(255),
    quantity int default 0
);

-- fornecedor

create table supplier (
idSupplier int auto_increment primary key,
SocialName varchar(255) not null,
CNPJ char(15) not null,
contact char(11) not null,
constraint unique_supplier unique (CNPJ)
);

-- desc supplier;
-- terceiro vendedor
-- drop table seller;

create table seller (
idSeller int auto_increment primary key,
SocialName varchar(255) not null,
AbstName varchar(255),
CNPJ char(15),
CPF char(9),
location varchar(255),
contact char(11) not null,
constraint unique_cnpj_seller unique (CNPJ),
constraint unique_cpf_seller unique (CPF)
);
    
 create table productSeller(
	idPSeller int,
    idPproduct int,
    prodQuantity int default 1,
    primary key (idPSeller, idPproduct),
    constraint fk_product_seller foreign key (idPSeller) references seller(idSeller),
    constraint fk_product_product foreign key (idPproduct) references product(idProduct)
 );
 
 -- desc productseller;
 
  create table productOrder(
	idPOroduct int,
    idPOrder int,
    poQuantity int default 1,
    poStatus enum('Disponivel','Sem estoque') default 'Disponivel',
    primary key (idPOroduct, idPOrder),
    constraint fk_productorder_seller foreign key (idPOroduct) references product(idProduct),
    constraint fk_productorder_product foreign key (idPOrder) references orders(idOrder)
 );
 
  create table storageLocation(
    idLproduct int,
    idLstorage int,
    location varchar(255) not null,
    primary key (idLproduct, idLstorage),
    constraint fk_storage_location_product foreign key (idLproduct) references product(idProduct),
    constraint fk_storage_location_storage foreign key (idLstorage) references productStorage(idProdStorage)
 );
 
  create table productSupplier(
	idPsSupplier int,
    idPsProduct int,
    quantity int not null,
    primary key (idPsSupplier, idPsProduct),
    constraint fk_product_supplier_supplier foreign key (idPsSupplier) references supplier(idSupplier),
    constraint fk_product_supplier_product foreign key (idPsProduct) references product(idProduct)
 );
 
 -- drop table productSupplier;
-- desc referential_constraints;
 select * from referential_constraints where constraint_schema = 'ecommerce';
 -- show tables;
 -- show databases;
 
 use information_schema;