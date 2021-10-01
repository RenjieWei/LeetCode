# Write your MySQL query statement below
# DENSE_RANK
# Note: for words that are functions names, they should be quoted
SELECT
    Score,
    DENSE_RANK() OVER (ORDER BY Score DESC) AS "Rank"
FROM Scores
;
