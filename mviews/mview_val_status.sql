 SELECT t_validator_rewards_summary.f_val_idx,
    t_validator_rewards_summary.f_status,
    count(DISTINCT t_validator_rewards_summary.f_status) AS f_count,
    'pre-merge'::text AS f_merge
   FROM t_validator_rewards_summary
  WHERE t_validator_rewards_summary.f_epoch <= 146875
  GROUP BY t_validator_rewards_summary.f_val_idx, t_validator_rewards_summary.f_status
UNION
 SELECT t_validator_rewards_summary.f_val_idx,
    t_validator_rewards_summary.f_status,
    count(DISTINCT t_validator_rewards_summary.f_status) AS f_count,
    'post-merge'::text AS f_merge
   FROM t_validator_rewards_summary
  WHERE t_validator_rewards_summary.f_epoch > 146875
  GROUP BY t_validator_rewards_summary.f_val_idx, t_validator_rewards_summary.f_status;