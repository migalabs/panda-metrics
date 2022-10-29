 SELECT t_validator_rewards_summary.f_val_idx,
    'pre-merge'::text AS f_merge,
    avg(t_validator_rewards_summary.f_reward) AS f_avg_reward,
    avg(t_validator_rewards_summary.f_max_reward) AS f_avg_max_reward
   FROM t_validator_rewards_summary
  WHERE t_validator_rewards_summary.f_epoch <= 146875 AND t_validator_rewards_summary.f_proposer_slot = '-1'::integer AND t_validator_rewards_summary.f_status = 'active'::text AND t_validator_rewards_summary.f_max_reward <> 0 AND t_validator_rewards_summary.f_reward < 1000000000
  GROUP BY t_validator_rewards_summary.f_val_idx
UNION
 SELECT t_validator_rewards_summary.f_val_idx,
    'post-merge'::text AS f_merge,
    avg(t_validator_rewards_summary.f_reward) AS f_avg_reward,
    avg(t_validator_rewards_summary.f_max_reward) AS f_avg_max_reward
   FROM t_validator_rewards_summary
  WHERE t_validator_rewards_summary.f_epoch > 146875 AND t_validator_rewards_summary.f_proposer_slot = '-1'::integer AND t_validator_rewards_summary.f_status = 'active'::text AND t_validator_rewards_summary.f_max_reward <> 0 AND t_validator_rewards_summary.f_reward < 1000000000
  GROUP BY t_validator_rewards_summary.f_val_idx;