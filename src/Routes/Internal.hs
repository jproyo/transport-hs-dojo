module Routes.Internal (
pairLPath,
) where

import Data.Graph.Inductive.Graph

pairList :: [a] -> [(a,a)]
pairList [] = []
pairList [x] = []
pairList (x:xs) = [(x,head xs)] ++ pairList xs


pairLPath :: LPath a -> [(LNode a, LNode a)]
pairLPath = pairList . unLPath
