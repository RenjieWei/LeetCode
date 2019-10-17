-- Write a query to find the node type of Binary Tree ordered by the value of the node. Output one of the following for each node:

-- Root: If node is root node.
-- Leaf: If node is leaf node.
-- Inner: If node is neither root nor leaf node.

select N,
if(P is NULL,'Root',if(N in (select P from BST), 'Inner','Leaf'))
from BST order by N;
