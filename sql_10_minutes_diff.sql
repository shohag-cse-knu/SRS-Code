SELECT *,NOW(),(TO_SECONDS(NOW()) - TO_SECONDS(action_time)) sss FROM `message_history`
WHERE
(TO_SECONDS(NOW()) - TO_SECONDS(action_time)) > 600