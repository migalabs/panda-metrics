 SELECT t_validator_rewards_summary.f_val_idx,
    'pre-merge'::text AS f_merge,
    count(*) AS number_lines,
    sum(t_validator_rewards_summary.f_reward) AS total_reward,
    sum(t_validator_rewards_summary.f_max_reward) AS total_max_reward
   FROM t_validator_rewards_summary
  WHERE t_validator_rewards_summary.f_epoch <= 146875
  GROUP BY t_validator_rewards_summary.f_val_idx
UNION
 SELECT t_validator_rewards_summary.f_val_idx,
    'post-merge'::text AS f_merge,
    count(*) AS number_lines,
    sum(t_validator_rewards_summary.f_reward) AS total_reward,
    sum(t_validator_rewards_summary.f_max_reward) AS total_max_reward
   FROM t_validator_rewards_summary
  WHERE t_validator_rewards_summary.f_epoch > 146875
  GROUP BY t_validator_rewards_summary.f_val_idx;