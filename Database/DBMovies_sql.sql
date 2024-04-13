if not exists
(select * from sys.databases where name = 'movies')
begin
use master
create database movies;
end
GO

use movies;
GO
if not exists(select * from sys.tables where name ='film')
begin
create table film
(
id				int primary key identity,
title			varchar(500),
releaseDate		date,
inCinema		bit,
genre			varchar(100),
director		varchar(500),
scriptLanguage	varchar(100),
);
end
GO

if exists (select * from sys.procedures where name='sp_GetFilms')
begin
drop procedure sp_GetFilms;
end
GO

create procedure sp_GetFilms 
as
    begin
	    select id, title, releaseDate, inCinema, genre, director, scriptLanguage
	    from film;		
	end	
GO


--exec sp_GetFilms;

--select * from film;

/*insert into film(title,releaseDate,inCinema,genre, director,scriptLanguage)
values ('Dark Knight','2010-01-01',0,'Action','Nolan','English');

insert into film(title,releaseDate,inCinema,genre, director,scriptLanguage)
values ('Ice Age','2008-04-24',0,'Animated','Pixar','English');

insert into film(title,releaseDate,inCinema,genre, director,scriptLanguage)
values ('Deep Blue Sea','2004-03-04',0,'Action','-','English');*/

--declare @t bit ;
--set @t = 1;

--declare @t date;
--set @t = '2024-03-28';

--select @t;