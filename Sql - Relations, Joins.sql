
Create table Countries (
    [Id] int primary key identity (1,1),
    [Name] nvarchar(50) not null
)

select *from Countries

Create table Cities (
    [Id] int primary key identity (1,1),
    [Name] nvarchar (50) not null,
    [CountryId] int foreign key references Countries(Id)
	)

	select *from Cities

	Create table Employees (
    [Id] int primary key identity (1,1),
    [Name] nvarchar (50) not null,
    [Surname] nvarchar (50) not null,
    [Age] int not null,
    [Salary] decimal,
    [Position] nvarchar(50),
    [IsDeleted] bit,
    [CityId] int foreign key references Cities(Id)
)

select *from Employees

Insert into Countries values
('Azerbaijan'),
('German'),
('Japan'),
('England')


Insert into Cities values
('Baku', 1),
('Bingen', 2),
('Osaka', 3),
('Ely', 4)


Insert into Employees values
('Mirze','Beshirzade',27,2500,'FullStack-Developer',0,1),
('Hemze','Elizade',26,2000,'FullStack-Developer',0,1),
('Hemid','Heyderzade',29,3000,'FullStack-Developer',0,2),
('Heyder','Eliyev',30,2800,'BackEnd-Developer',0,2),
('Mehrab','Emirov',30,1800,'FrontEnd-Developer',0,3),
 ('Elvin','Suleymanov',26,1600,'FrontEnd-Developer',0,3),
 ('Leyla','Ceferli',29,1000,'Reseption',0,4),
 ('Cicek','Mirzeyeva',27,800,'Reseption',1,4)



 -- Ishcilerin ozlerini, yashadiqi sheherlerini ve olkelerini gosterin.

SELECT e.Id AS EmployeeId, e.Name AS EmployeeName, e.Surname, e.Age, e.Salary, e.Position, e.IsDeleted, ct.Id AS CityId, ct.Name AS CityName, cr.Id AS CountryId, cr.Name AS CountryName FROM Employees e
JOIN Cities ct
ON ct.Id = e.CityId
JOIN Countries cr
ON cr.Id = ct.CountryId




-- Maashi 2000-den yuxari olan ishcilerin adlari ve yashadiqi olkeleri gosterin.

SELECT e.Name AS EmployeeName, cr.Name AS CountryName FROM Employees e
JOIN Cities ct
ON ct.Id = e.CityId
JOIN Countries cr
ON cr.Id = ct.CountryId
WHERE e.Salary > 2000



-- Hansi sheherin hansi olkeye aid olduqunu gosterin.

SELECT ct.Name AS CityName, cr.Name AS CountryName FROM Cities ct
JOIN Countries cr
ON cr.Id = ct.CountryId





-- Ishden cixan ishcilerin yashadiqi sheher ve olkeleri, hemcinin ishcilerin oz ad ve soyadlarini gosteren query yazin.

SELECT e.Name AS EmployeeName, e.Surname, ct.Name AS CityName, cr.Name AS CountryName FROM Employees e
JOIN Cities ct
ON ct.Id = e.CityId
JOIN Countries cr
ON cr.Id = ct.CountryId
WHERE e.IsDeleted = 1