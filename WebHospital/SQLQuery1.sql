USE [master]
GO
/****** Object:  Database [dbHospital]    Script Date: 23/07/2020 21:42:25 ******/
CREATE DATABASE [dbHospital]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dbHospital', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\dbHospital.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'dbHospital_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\dbHospital_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [dbHospital] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dbHospital].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dbHospital] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dbHospital] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dbHospital] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dbHospital] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dbHospital] SET ARITHABORT OFF 
GO
ALTER DATABASE [dbHospital] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [dbHospital] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dbHospital] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dbHospital] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dbHospital] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dbHospital] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dbHospital] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dbHospital] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dbHospital] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dbHospital] SET  DISABLE_BROKER 
GO
ALTER DATABASE [dbHospital] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dbHospital] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dbHospital] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dbHospital] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dbHospital] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dbHospital] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dbHospital] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dbHospital] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [dbHospital] SET  MULTI_USER 
GO
ALTER DATABASE [dbHospital] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dbHospital] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dbHospital] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dbHospital] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [dbHospital] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [dbHospital] SET QUERY_STORE = OFF
GO
USE [dbHospital]
GO
/****** Object:  Table [dbo].[Ambulancia]    Script Date: 23/07/2020 21:42:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ambulancia](
	[IdAmbulancia] [int] IDENTITY(1,1) NOT NULL,
	[Codigo] [varchar](50) NULL,
	[Placa] [varchar](50) NULL,
	[Coductor] [varchar](50) NULL,
 CONSTRAINT [PK_Ambulancia] PRIMARY KEY CLUSTERED 
(
	[IdAmbulancia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CitaMedica]    Script Date: 23/07/2020 21:42:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CitaMedica](
	[IdCita] [int] IDENTITY(1,1) NOT NULL,
	[FechaHIngreso] [datetime] NULL,
	[Estado] [varchar](50) NULL,
	[Consultorio] [varchar](50) NULL,
	[IdMedico] [int] NULL,
	[IdPaciente] [int] NULL,
	[IdPersonalAdmin] [int] NULL,
	[IdEspecialidad] [int] NULL,
 CONSTRAINT [PK_CitaMedica] PRIMARY KEY CLUSTERED 
(
	[IdCita] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Eps]    Script Date: 23/07/2020 21:42:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Eps](
	[IdEps] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Ciudad] [varchar](50) NULL,
 CONSTRAINT [PK_Eps] PRIMARY KEY CLUSTERED 
(
	[IdEps] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Especialidad]    Script Date: 23/07/2020 21:42:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Especialidad](
	[IdEspecialidad] [int] IDENTITY(1,1) NOT NULL,
	[Especialidad] [varchar](50) NULL,
	[Descripcion] [varchar](50) NULL,
 CONSTRAINT [PK_Especialidad] PRIMARY KEY CLUSTERED 
(
	[IdEspecialidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hospitalizacion]    Script Date: 23/07/2020 21:42:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hospitalizacion](
	[IdHospitalizacion] [int] IDENTITY(1,1) NOT NULL,
	[FechaHIngreso] [datetime] NULL,
	[FechaHSalida] [datetime] NULL,
	[Motivo] [varchar](50) NULL,
	[Descripcion] [varchar](50) NULL,
	[Observaciones] [varchar](50) NULL,
	[IdPaciente] [int] NULL,
	[IdUrgencia] [int] NULL,
 CONSTRAINT [PK_Hospitalizacion] PRIMARY KEY CLUSTERED 
(
	[IdHospitalizacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medicacion]    Script Date: 23/07/2020 21:42:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medicacion](
	[IdMedicacion] [int] IDENTITY(1,1) NOT NULL,
	[HoraMedicacion] [varchar](50) NULL,
	[Cantidad] [varchar](50) NULL,
	[MetodoAplicacion] [varchar](50) NULL,
	[IdProcesoGeneral] [int] NULL,
	[IdMedicamento] [int] NULL,
	[IdProcedimiento] [int] NULL,
 CONSTRAINT [PK_Medicacion] PRIMARY KEY CLUSTERED 
(
	[IdMedicacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medicamento]    Script Date: 23/07/2020 21:42:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medicamento](
	[IdMedicamento] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Descripcion] [varchar](50) NULL,
	[Stock] [int] NULL,
 CONSTRAINT [PK_Medicamento] PRIMARY KEY CLUSTERED 
(
	[IdMedicamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medico]    Script Date: 23/07/2020 21:42:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medico](
	[IdMedico] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Apellido] [varchar](50) NULL,
	[Documento] [varchar](50) NULL,
	[Telefono] [bigint] NULL,
	[email] [varchar](50) NULL,
	[Direccion] [varchar](50) NULL,
	[FechaNacimiento] [date] NULL,
	[IdEspecialidad] [int] NULL,
 CONSTRAINT [PK_Medico] PRIMARY KEY CLUSTERED 
(
	[IdMedico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Paciente]    Script Date: 23/07/2020 21:42:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Paciente](
	[IdPaciente] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Apellido] [varchar](50) NULL,
	[Documento] [varchar](50) NULL,
	[email] [varchar](50) NULL,
	[Direccion] [varchar](50) NULL,
	[Telefono] [bigint] NULL,
	[FechaNacimiento] [date] NULL,
	[IdEps] [int] NULL,
 CONSTRAINT [PK_Paciente] PRIMARY KEY CLUSTERED 
(
	[IdPaciente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PersonalAdministrativo]    Script Date: 23/07/2020 21:42:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PersonalAdministrativo](
	[IdPersonalAdministrativo] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Apellido] [varchar](50) NULL,
	[Documento] [varchar](50) NULL,
	[Telefono] [bigint] NULL,
	[email] [varchar](50) NULL,
	[Direccion] [varchar](50) NULL,
	[IdRol] [int] NULL,
 CONSTRAINT [PK_PersonalAdministrativo] PRIMARY KEY CLUSTERED 
(
	[IdPersonalAdministrativo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Procedimiento]    Script Date: 23/07/2020 21:42:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Procedimiento](
	[IdProcedimiento] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](50) NULL,
	[Observaciones] [varchar](50) NULL,
	[FechaHProcedimiento] [datetime] NULL,
	[IdHospitalizacion] [int] NULL,
 CONSTRAINT [PK_Procedimiento] PRIMARY KEY CLUSTERED 
(
	[IdProcedimiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProcesoGeneral]    Script Date: 23/07/2020 21:42:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProcesoGeneral](
	[IdProcesoGeneral] [int] IDENTITY(1,1) NOT NULL,
	[Diagnostico] [varchar](50) NULL,
	[Valoracion] [varchar](50) NULL,
	[IdCita] [int] NULL,
	[IdUrgencia] [int] NULL,
 CONSTRAINT [PK_ProcesoGeneral] PRIMARY KEY CLUSTERED 
(
	[IdProcesoGeneral] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rol]    Script Date: 23/07/2020 21:42:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rol](
	[IdRol] [int] IDENTITY(1,1) NOT NULL,
	[Rol] [varchar](50) NULL,
 CONSTRAINT [PK_Rol] PRIMARY KEY CLUSTERED 
(
	[IdRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Traslado]    Script Date: 23/07/2020 21:42:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Traslado](
	[IdTraslado] [int] IDENTITY(1,1) NOT NULL,
	[FechaHTraslado] [datetime] NULL,
	[Descripcion] [varchar](50) NULL,
	[Destino] [varchar](50) NULL,
	[IdAmbulancia] [int] NULL,
	[IdHospitalizacion] [int] NULL,
 CONSTRAINT [PK_Traslado] PRIMARY KEY CLUSTERED 
(
	[IdTraslado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Triage]    Script Date: 23/07/2020 21:42:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Triage](
	[IdTriage] [int] IDENTITY(1,1) NOT NULL,
	[Nivel] [varchar](50) NULL,
	[Descripcion] [varchar](50) NULL,
 CONSTRAINT [PK_Triage] PRIMARY KEY CLUSTERED 
(
	[IdTriage] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Urgencia]    Script Date: 23/07/2020 21:42:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Urgencia](
	[IdUrgencia] [int] IDENTITY(1,1) NOT NULL,
	[FechaHIngreso] [datetime] NULL,
	[FechaHSalida] [datetime] NULL,
	[Motivo] [varchar](50) NULL,
	[Descripcion] [varchar](50) NULL,
	[IdTriage] [int] NULL,
	[IdPaciente] [int] NULL,
	[IdMedico] [int] NULL,
 CONSTRAINT [PK_Urgencia] PRIMARY KEY CLUSTERED 
(
	[IdUrgencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CitaMedica]  WITH CHECK ADD  CONSTRAINT [FK_CitaMedica_Especialidad] FOREIGN KEY([IdEspecialidad])
REFERENCES [dbo].[Especialidad] ([IdEspecialidad])
GO
ALTER TABLE [dbo].[CitaMedica] CHECK CONSTRAINT [FK_CitaMedica_Especialidad]
GO
ALTER TABLE [dbo].[CitaMedica]  WITH CHECK ADD  CONSTRAINT [FK_CitaMedica_Medico] FOREIGN KEY([IdMedico])
REFERENCES [dbo].[Medico] ([IdMedico])
GO
ALTER TABLE [dbo].[CitaMedica] CHECK CONSTRAINT [FK_CitaMedica_Medico]
GO
ALTER TABLE [dbo].[CitaMedica]  WITH CHECK ADD  CONSTRAINT [FK_CitaMedica_Paciente] FOREIGN KEY([IdPaciente])
REFERENCES [dbo].[Paciente] ([IdPaciente])
GO
ALTER TABLE [dbo].[CitaMedica] CHECK CONSTRAINT [FK_CitaMedica_Paciente]
GO
ALTER TABLE [dbo].[CitaMedica]  WITH CHECK ADD  CONSTRAINT [FK_CitaMedica_PersonalAdministrativo] FOREIGN KEY([IdPersonalAdmin])
REFERENCES [dbo].[PersonalAdministrativo] ([IdPersonalAdministrativo])
GO
ALTER TABLE [dbo].[CitaMedica] CHECK CONSTRAINT [FK_CitaMedica_PersonalAdministrativo]
GO
ALTER TABLE [dbo].[Hospitalizacion]  WITH CHECK ADD  CONSTRAINT [FK_Hospitalizacion_Paciente] FOREIGN KEY([IdPaciente])
REFERENCES [dbo].[Paciente] ([IdPaciente])
GO
ALTER TABLE [dbo].[Hospitalizacion] CHECK CONSTRAINT [FK_Hospitalizacion_Paciente]
GO
ALTER TABLE [dbo].[Hospitalizacion]  WITH CHECK ADD  CONSTRAINT [FK_Hospitalizacion_Urgencia] FOREIGN KEY([IdUrgencia])
REFERENCES [dbo].[Urgencia] ([IdUrgencia])
GO
ALTER TABLE [dbo].[Hospitalizacion] CHECK CONSTRAINT [FK_Hospitalizacion_Urgencia]
GO
ALTER TABLE [dbo].[Medicacion]  WITH CHECK ADD  CONSTRAINT [FK_Medicacion_Medicamento] FOREIGN KEY([IdMedicamento])
REFERENCES [dbo].[Medicamento] ([IdMedicamento])
GO
ALTER TABLE [dbo].[Medicacion] CHECK CONSTRAINT [FK_Medicacion_Medicamento]
GO
ALTER TABLE [dbo].[Medicacion]  WITH CHECK ADD  CONSTRAINT [FK_Medicacion_Procedimiento] FOREIGN KEY([IdProcedimiento])
REFERENCES [dbo].[Procedimiento] ([IdProcedimiento])
GO
ALTER TABLE [dbo].[Medicacion] CHECK CONSTRAINT [FK_Medicacion_Procedimiento]
GO
ALTER TABLE [dbo].[Medicacion]  WITH CHECK ADD  CONSTRAINT [FK_Medicacion_Procedimiento1] FOREIGN KEY([IdProcedimiento])
REFERENCES [dbo].[Procedimiento] ([IdProcedimiento])
GO
ALTER TABLE [dbo].[Medicacion] CHECK CONSTRAINT [FK_Medicacion_Procedimiento1]
GO
ALTER TABLE [dbo].[Medicacion]  WITH CHECK ADD  CONSTRAINT [FK_Medicacion_ProcesoGeneral] FOREIGN KEY([IdProcesoGeneral])
REFERENCES [dbo].[ProcesoGeneral] ([IdProcesoGeneral])
GO
ALTER TABLE [dbo].[Medicacion] CHECK CONSTRAINT [FK_Medicacion_ProcesoGeneral]
GO
ALTER TABLE [dbo].[Medico]  WITH CHECK ADD  CONSTRAINT [FK_Medico_Especialidad] FOREIGN KEY([IdEspecialidad])
REFERENCES [dbo].[Especialidad] ([IdEspecialidad])
GO
ALTER TABLE [dbo].[Medico] CHECK CONSTRAINT [FK_Medico_Especialidad]
GO
ALTER TABLE [dbo].[Paciente]  WITH CHECK ADD  CONSTRAINT [FK_Paciente_Eps] FOREIGN KEY([IdEps])
REFERENCES [dbo].[Eps] ([IdEps])
GO
ALTER TABLE [dbo].[Paciente] CHECK CONSTRAINT [FK_Paciente_Eps]
GO
ALTER TABLE [dbo].[PersonalAdministrativo]  WITH CHECK ADD  CONSTRAINT [FK_PersonalAdministrativo_Rol] FOREIGN KEY([IdRol])
REFERENCES [dbo].[Rol] ([IdRol])
GO
ALTER TABLE [dbo].[PersonalAdministrativo] CHECK CONSTRAINT [FK_PersonalAdministrativo_Rol]
GO
ALTER TABLE [dbo].[ProcesoGeneral]  WITH CHECK ADD  CONSTRAINT [FK_ProcesoGeneral_Urgencia] FOREIGN KEY([IdUrgencia])
REFERENCES [dbo].[Urgencia] ([IdUrgencia])
GO
ALTER TABLE [dbo].[ProcesoGeneral] CHECK CONSTRAINT [FK_ProcesoGeneral_Urgencia]
GO
ALTER TABLE [dbo].[Traslado]  WITH CHECK ADD  CONSTRAINT [FK_Traslado_Ambulancia] FOREIGN KEY([IdAmbulancia])
REFERENCES [dbo].[Ambulancia] ([IdAmbulancia])
GO
ALTER TABLE [dbo].[Traslado] CHECK CONSTRAINT [FK_Traslado_Ambulancia]
GO
ALTER TABLE [dbo].[Traslado]  WITH CHECK ADD  CONSTRAINT [FK_Traslado_Hospitalizacion] FOREIGN KEY([IdHospitalizacion])
REFERENCES [dbo].[Hospitalizacion] ([IdHospitalizacion])
GO
ALTER TABLE [dbo].[Traslado] CHECK CONSTRAINT [FK_Traslado_Hospitalizacion]
GO
ALTER TABLE [dbo].[Urgencia]  WITH CHECK ADD  CONSTRAINT [FK_Urgencia_Medico] FOREIGN KEY([IdMedico])
REFERENCES [dbo].[Medico] ([IdMedico])
GO
ALTER TABLE [dbo].[Urgencia] CHECK CONSTRAINT [FK_Urgencia_Medico]
GO
ALTER TABLE [dbo].[Urgencia]  WITH CHECK ADD  CONSTRAINT [FK_Urgencia_Paciente] FOREIGN KEY([IdPaciente])
REFERENCES [dbo].[Paciente] ([IdPaciente])
GO
ALTER TABLE [dbo].[Urgencia] CHECK CONSTRAINT [FK_Urgencia_Paciente]
GO
ALTER TABLE [dbo].[Urgencia]  WITH CHECK ADD  CONSTRAINT [FK_Urgencia_Triage] FOREIGN KEY([IdTriage])
REFERENCES [dbo].[Triage] ([IdTriage])
GO
ALTER TABLE [dbo].[Urgencia] CHECK CONSTRAINT [FK_Urgencia_Triage]
GO
USE [master]
GO
ALTER DATABASE [dbHospital] SET  READ_WRITE 
GO
