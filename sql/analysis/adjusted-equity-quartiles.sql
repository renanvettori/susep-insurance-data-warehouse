SELECT 
    plajustado,
    NTILE(4) OVER (ORDER BY plajustado) AS Quartil
FROM 
    teste
WHERE 
    plajustado IS NOT NULL;

WITH QuartilLimits AS (
    SELECT 
        plajustado,
        NTILE(4) OVER (ORDER BY plajustado) AS Quartil
    FROM 
        teste
    WHERE 
        plajustado IS NOT NULL
)
SELECT 
    Quartil,
    MIN(plajustado) AS MinimoQuartil,
    MAX(plajustado) AS MaximoQuartil
FROM 
    QuartilLimits
GROUP BY 
    Quartil
ORDER BY 
    Quartil;
