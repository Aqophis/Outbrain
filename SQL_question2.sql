SELECT 
  campaign_id,
  device_type,
  ROUND(
    CASE 
      WHEN SUM(clicks) = 0 THEN NULL 
      ELSE SUM(spend) / SUM(clicks) 
    END, 2) AS cpc
FROM AdMetrics
WHERE campaign_id IN ('CID-ABC111', 'CID-ABC222', 'CID-ABC333')
  AND report_date BETWEEN '2025-04-01' AND '2025-04-30'
GROUP BY campaign_id, device_type;