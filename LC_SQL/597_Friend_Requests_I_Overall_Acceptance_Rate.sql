# Write your MySQL query statement below
# IFNULL has more flexibility
# for empty table, it can output 0 instead of NULL

SELECT
    ROUND(IFNULL(
        (SELECT COUNT(DISTINCT requester_id, accepter_id) FROM RequestAccepted)/
    (SELECT COUNT(DISTINCT sender_id, send_to_id) FROM FriendRequest),0
    ),2)  AS accept_rate
;
