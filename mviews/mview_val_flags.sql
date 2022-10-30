 SELECT t_validator_rewards_summary.f_val_idx,
    'pre-merge'::text AS f_merge,
    count(*) AS number_lines,
    count(
        CASE
            WHEN t_validator_rewards_summary.f_missing_source THEN 1
            ELSE NULL::integer
        END) AS total_missed_source,
    count(
        CASE
            WHEN t_validator_rewards_summary.f_missing_target THEN 1
            ELSE NULL::integer
        END) AS total_missed_target,
    count(
        CASE
            WHEN t_validator_rewards_summary.f_missing_head THEN 1
            ELSE NULL::integer
        END) AS total_missed_head
   FROM t_validator_rewards_summary
  WHERE t_validator_rewards_summary.f_status = 'active'::text AND t_validator_rewards_summary.f_max_att_reward <> 0 AND t_validator_rewards_summary.f_epoch <= 146875
  GROUP BY t_validator_rewards_summary.f_val_idx
UNION
 SELECT t_validator_rewards_summary.f_val_idx,
    'post-merge'::text AS f_merge,
    count(*) AS number_lines,
    count(
        CASE
            WHEN t_validator_rewards_summary.f_missing_source THEN 1
            ELSE NULL::integer
        END) AS total_missed_source,
    count(
        CASE
            WHEN t_validator_rewards_summary.f_missing_target THEN 1
            ELSE NULL::integer
        END) AS total_missed_target,
    count(
        CASE
            WHEN t_validator_rewards_summary.f_missing_head THEN 1
            ELSE NULL::integer
        END) AS total_missed_head
   FROM t_validator_rewards_summary
  WHERE t_validator_rewards_summary.f_status = 'active'::text AND t_validator_rewards_summary.f_max_att_reward <> 0 AND t_validator_rewards_summary.f_epoch > 146875
  GROUP BY t_validator_rewards_summary.f_val_idx;