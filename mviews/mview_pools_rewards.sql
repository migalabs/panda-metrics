 SELECT eth2_pubkeys.f_pool_name,
    t_validator_rewards_summary.f_epoch,
    avg(t_validator_rewards_summary.f_reward) AS f_avg_reward,
    avg(t_validator_rewards_summary.f_max_reward) AS f_avg_max_reward,
    count(
        CASE
            WHEN t_validator_rewards_summary.f_missing_source THEN 1
            ELSE NULL::integer
        END) AS f_count_missing_source,
    count(
        CASE
            WHEN t_validator_rewards_summary.f_missing_target THEN 1
            ELSE NULL::integer
        END) AS f_count_missing_target,
    count(
        CASE
            WHEN t_validator_rewards_summary.f_missing_head THEN 1
            ELSE NULL::integer
        END) AS f_count_missing_head,
    count(*) AS f_active_val_num
   FROM t_validator_rewards_summary
     JOIN eth2_pubkeys ON t_validator_rewards_summary.f_val_idx = eth2_pubkeys.f_val_idx
  WHERE t_validator_rewards_summary.f_proposer_slot = '-1'::integer AND t_validator_rewards_summary.f_status = 'active'::text
  GROUP BY t_validator_rewards_summary.f_epoch, eth2_pubkeys.f_pool_name;