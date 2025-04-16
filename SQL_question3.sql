SELECT 
  Advertisers.advertiser_id,
  Campaigns.campaign_id,
  Campaigns.campaign_name,
  SUM(CASE WHEN AdMetrics.impressions IS NOT NULL THEN AdMetrics.impressions ELSE 0 END) AS total_impressions,
  SUM(CASE WHEN AdMetrics.clicks IS NOT NULL THEN AdMetrics.clicks ELSE 0 END) AS total_clicks,
  SUM(CASE WHEN AdMetrics.spend IS NOT NULL THEN AdMetrics.spend ELSE 0 END) AS total_spend
FROM Advertisers
LEFT JOIN Campaigns ON Advertisers.advertiser_id = Campaigns.advertiser_id
LEFT JOIN AdMetrics ON Campaigns.campaign_id = AdMetrics.campaign_id
WHERE Advertisers.advertiser_id IN ('ADV-111', 'ADV-222', 'ADV-333')
GROUP BY Advertisers.advertiser_id, Campaigns.campaign_id, Campaigns.campaign_name
ORDER BY total_impressions DESC, total_spend DESC;