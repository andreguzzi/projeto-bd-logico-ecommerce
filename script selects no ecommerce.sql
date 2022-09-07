SELECT * FROM productseller;
use ecommerce;
desc seller;
show tables;
insert into storagelocation (idPOproduct, idPOorder, poQuantity, poStatus) values (5,15,2,null);

select count(*) from clients;
select * from clients c, orders o where c.idClient = idOrderClient;

select Fname,Lname, IdOrder, orderStatus from clients c, orders o where c.idClient = idOrderClient;
select concat(Fname, ' ',Lname) as Client, IdOrder as Orders, orderStatus from clients c, orders o where c.idClient = idOrderClient;

select count(*) from clients c, orders o where c.idClient = idOrderclient;

select * from clients c, orders o where c.idClient = idOrderclient group by idOrder;
select * from clients join orders on idClient = idOrderClient;

select * from clients left outer join orders on idClient = idOrderClient;
select * from clients right outer join orders on idClient = idOrderClient;
select * from clients inner join orders on idClient = idOrderClient;

select * from productOrder;

select * from clients inner join orders on idClient = idOrderClient
inner join productOrder on idPOorder = idOrder;

-- recuperação de pedido com produto associado
select c.idClient, fname, count(*) as Numbers_of_orders from clients c 
	inner join orders o on c.idClient = o.idOrderClient
    inner join productOrder p on p.idPOorder = o.idOrder
group by idClient;

-- recuperar quantos pedidos foram realizados pelos clientes
select c.idClient, fname, count(*) as Numbers_of_orders from clients c 
	inner join orders o on c.idClient = o.idOrderClient
group by idClient;


