SELECT
    Avg_Limit,
    NTILE(3) OVER (ORDER BY Avg_Limit) AS Quartil
FROM (
    SELECT
        CASE
            WHEN lim_ret_seg_publico IS NULL AND lim_ret_seg_privado IS NULL THEN NULL
            WHEN lim_ret_seg_publico IS NULL THEN lim_ret_seg_privado
            WHEN lim_ret_seg_privado IS NULL THEN lim_ret_seg_publico
            ELSE (lim_ret_seg_publico + lim_ret_seg_privado) / 2
        END AS Avg_Limit
    FROM
        teste
    WHERE 
        lim_ret_seg_publico IS NOT NULL
        OR lim_ret_seg_privado IS NOT NULL
) AS SubQuery
WHERE 
    Avg_Limit IS NOT NULL;



WITH QuartilLimits AS (
    SELECT
        lim_ret_fian_loc,
        CASE
            WHEN lim_ret_seg_publico IS NULL AND lim_ret_seg_privado IS NULL THEN NULL
            WHEN lim_ret_seg_publico IS NULL THEN lim_ret_seg_privado
            WHEN lim_ret_seg_privado IS NULL THEN lim_ret_seg_publico
            ELSE (lim_ret_seg_publico + lim_ret_seg_privado) / 2
        END AS Avg_Limit,
        NTILE(3) OVER (ORDER BY CASE
                                    WHEN lim_ret_seg_publico IS NULL AND lim_ret_seg_privado IS NULL THEN NULL
                                    WHEN lim_ret_seg_publico IS NULL THEN lim_ret_seg_privado
                                    WHEN lim_ret_seg_privado IS NULL THEN lim_ret_seg_publico
                                    ELSE (lim_ret_seg_publico + lim_ret_seg_privado) / 2
                                END) AS Quartil
    FROM
        teste
    WHERE 
        lim_ret_seg_publico IS NOT NULL
        OR lim_ret_seg_privado IS NOT NULL
)
SELECT 
    Quartil,
    MIN(Avg_Limit) AS MinimoQuartil,
    MAX(Avg_Limit) AS MaximoQuartil
FROM 
    QuartilLimits
WHERE 
    Avg_Limit IS NOT NULL
GROUP BY 
    Quartil
ORDER BY 
    Quartil;