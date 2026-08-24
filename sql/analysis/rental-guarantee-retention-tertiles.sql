SELECT 
    lim_ret_fian_loc,
    NTILE(3) OVER (ORDER BY lim_ret_fian_loc) AS Quartil
FROM 
    teste
WHERE 
    lim_ret_fian_loc IS NOT NULL;

WITH QuartilLimits AS (
    SELECT 
        lim_ret_fian_loc,
        NTILE(3) OVER (ORDER BY lim_ret_fian_loc) AS Quartil
    FROM 
        teste
    WHERE 
        lim_ret_fian_loc IS NOT NULL
)
SELECT 
    Quartil,
    MIN(lim_ret_fian_loc) AS MinimoQuartil,
    MAX(lim_ret_fian_loc) AS MaximoQuartil
FROM 
    QuartilLimits
GROUP BY 
    Quartil
ORDER BY 
    Quartil;
