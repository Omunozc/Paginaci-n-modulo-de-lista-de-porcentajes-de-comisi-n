USE [STOD_SAPBONE]
GO
/****** Object:  StoredProcedure [dbo].[CODY_ObtenerListaMaestro]    Script Date: 7/04/2026 14:58:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[CODY_ObtenerListaMaestro] 
AS
BEGIN
	SELECT T1.Lista,
		T1.ItemCode,
		T1.Precio,
		T1.Porcentaje,
		T0.ItemName
	FROM CODY_ListaDetalle T1
		INNER JOIN [128.1.200.167].[SBO_CANELLA].[dbo].OITM T0 ON T1.ItemCode = T0.ItemCode COLLATE Modern_Spanish_CI_AS	
	WHERE Lista = (SELECT Lista FROM CODY_ListaMaestro WHERE Estado = 'A')
END 






