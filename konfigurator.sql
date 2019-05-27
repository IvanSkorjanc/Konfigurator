# sipanje na server
/*
c:\xampp\mysql\bin\mysql -uedunova -pedunova --default_character_set=utf8 < "C:\konfigurator.sql"
*/

drop database if exists konfigurator;
create database konfigurator default character set utf8;
use konfigurator;

create table konfiguracija (
sifra int not null primary key auto_increment,
naziv varchar(50) not null,
opis varchar(50) not null,
cijena decimal(18,2) not null
);

create table komponenta (
sifra int not null primary key auto_increment,
naziv varchar(50) not null,
opis varchar(50) not null,
proizvodac int
);

create table proizvodac (
sifra int not null primary key auto_increment,
naziv varchar(50) not null,
zemlja varchar(50) not null
);

create table dio (
konfiguracija int,
komponenta int
);


alter table dio add foreign key (konfiguracija) references konfiguracija(sifra);
alter table dio add foreign key (komponenta) references komponenta(sifra);

alter table komponenta add foreign key (proizvodac) references proizvodac(sifra);


insert into konfiguracija 
(naziv,opis,cijena)
values
# šifra 1
('gamerska','za sve na max',20000.00),
# šifra 2
('srednja','za igre na medium',6000.00),
# šifra 3
('uredska','za administrativne poslove',3000.00);

insert into proizvodac
(naziv,zemlja)
values
# šifra 1
('Intel','Amerika'),
# šifra 2
('Amd','Amerika'),
# šifra 3
('Nvidia','Amerika');

insert into komponenta
(naziv,opis,proizvodac)
values
# šifra 1
('Rtx 2080','nova generacija nvidie',3),
# šifra 2
('Gtx 1060','solidna grafička',3),
# šifra 3
('I7-8700','intel procesor',1),
# šifra 4
('Ryzen 5 2400G','amd-ov procesor',2),
# šifra 5
('I3-8100','intelov procesor',1),
# šifra 6
('Intel G5400','intelov procesor',1),
# šifra 7
('Gt 1030','nvidijina grafička',3);


insert into dio
(konfiguracija,komponenta)
values
# šifra 1
(1,1),
# šifra 2
(1,3),
# šifra 3
(2,2),
# šifra 4
(2,4),
# šifra 5
(3,5),
# šifra 6
(3,7);

insert into konfiguracija
(naziv,opis,cijena)
values
# šifra 4
('MagazinRS','gaming računalo',13799.00);

insert into proizvodac
(naziv,zemlja)
values
# šifra 4
('Asus','Tajvan'),
# šifra 5
('ADATA','Tajvan');

insert into komponenta
(naziv,opis,proizvodac)
values
# šifra 8
('I7-9700K','intelov procesor',1),
# šifra 9
('Z370','matična ploča',4),
# šifra 10
('SSD Adata Pro 256GB','ssd',5);

insert into dio
(konfiguracija,komponenta)
values
# šifra 7
(4,8),
# šifra 8
(4,9),
# šifra 9
(4,10);



#testno brisanje
insert into konfiguracija (naziv,opis,cijena)
values
# šifra 5
('MagazinRS Ryzen','ryzenov pc',11349.00),
# šifra 6
('MagazinRS gaming stanica','gaming računalo',6799.00),
# šifra 7
('Mining rig RX470','mining rig',22999.00);

#select * from konfiguracija;
delete from konfiguracija where sifra in (5,6,7);
#gotovo testno brisanje

#dodavanje proizvodaca
insert into proizvodac 
(naziv,zemlja)
values
# šifra 6
('Seagate','Amerika'),
# šifra 7
('Maxtor','Amerika'),
# šifra 8
('Hitachi','Japan'),
# šifra 9
('Western Digital','Amerika'),
# šifra 10
('IBM','Amerika'),
# šifra 11
('Samsung','Južna Koreja'),
# šifra 12
('Fujitsu','Japan'),
# šifra 13
('ASRock','Tajvan'),
# šifra 14
('Gigabyte','Tajvan'),
# šifra 15
('MSI','Tajvan'),
# šifra 16
('Akyga','Poljska'),
# šifra 17
('Corsair','Amerika'),
# šifra 18
('FSP Group','Tajvan');
