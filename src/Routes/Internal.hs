module Routes.Internal (
pairLPath,
findDestination
) where

import Data.List

import Data.Graph.Inductive.Graph
import Data.Graph.Inductive.Tree

pairList :: [a] -> [(a,a)]
pairList [] = []
pairList [x] = []
pairList (x:xs) = (x,head xs) : pairList xs


pairLPath :: LPath a -> [(LNode a, LNode a)]
pairLPath = pairList . unLPath

connectors :: Gr String Int -> (LNode String, LNode String) -> [(Node, Int)]
connectors graph pair = lsuc graph ((fst . fst) pair)

findDestination :: Gr String Int -> (LNode String, LNode String) -> Maybe (Node,Node)
findDestination graph pair = find (\x -> fst x == (fst . snd) pair) (connectors graph pair)
