SELECT campaign_id, campaign_name
FROM Campaigns
WHERE start_date BETWEEN '2025-02-01' AND '2025-02-28'
  AND budget > 5000.00
ORDER BY budget DESC;