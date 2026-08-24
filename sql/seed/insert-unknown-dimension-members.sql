SET IDENTITY_INSERT [dbo].[dim_empresa] ON;

INSERT INTO [dbo].[dim_empresa]
           ([id_empresa]
		   ,[cod_empresa]
           ,[desc_empresa]
           ,[cod_grupo_econ]
           ,[desc_grupo_econ]
           ,[pl_empresa]
           ,[atr_porte]
           ,[lim_ret_seg_publico]
           ,[lim_ret_seg_privado]
           ,[lim_ret_fian_loc]
           ,[atr_risco_seg_garantia]
           ,[atr_risco_fian_loc])
     VALUES
           (0
		   ,'ND'
           ,'ND'
           ,'ND'
           ,'ND'
           ,0
           ,'ND'
           ,0
           ,0
           ,0
           ,'ND'
           ,'ND')

SET IDENTITY_INSERT [dbo].[dim_empresa] OFF;

SET IDENTITY_INSERT [dbo].[dim_ramo] ON;

INSERT INTO [dbo].[dim_ramo]
           ([id_ramo]
           ,[cod_ramo]
           ,[desc_ramo]
           ,[atr_seguro_garantia]
           ,[cod_grupo_ramo]
           ,[desc_grupo_ramo])
     VALUES
           (0
           ,'ND'
           ,'ND'
           ,0
           ,'ND'
           ,'ND')

SET IDENTITY_INSERT [dbo].[dim_ramo] OFF;

SET IDENTITY_INSERT [dbo].[dim_tempo] ON;

INSERT INTO [dbo].[dim_tempo]
           ([id_tempo]
           ,[cod_tempo]
           ,[data]
           ,[cod_mes]
           ,[desc_mes]
           ,[cod_trimestre]
           ,[desc_trimestre]
           ,[cod_semestre]
           ,[desc_semestre]
           ,[cod_ano])
     VALUES
           (0
           ,'ND'
           ,'1900-01-01 00:00:00'
           ,'ND'
           ,'ND'
           ,'ND'
           ,'ND'
           ,'ND'
           ,'ND'
           ,'ND')

SET IDENTITY_INSERT [dbo].[dim_tempo] OFF;