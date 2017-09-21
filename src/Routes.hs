module Routes (
calculateDistance,
numberOfTrips,
shortestRoute,
numberOfRoutes,
fact
) where

import Control.Monad

import Data.Graph.Inductive.Graph
import Data.Graph.Inductive.Tree
import Data.Graph.Inductive.Query.SP

import Routes.Internal

calculateDistance :: Gr String Int -> LPath String -> Maybe Int
calculateDistance graph route = foldM (fmap . (+)) 0 allPaths
  where allPaths = map extractLength routePaired
        routePaired = pairLPath route
        extractLength pair = liftM snd (findDestination graph pair)

numberOfTrips :: Gr String Int -> Node -> Node -> Maybe Int
numberOfTrips graph start finish = undefined

shortestRoute :: Gr String Int -> Node -> Node -> Maybe Int
shortestRoute graph start finish = spLength start finish graph

numberOfRoutes :: Gr String Int -> LPath String -> Int
numberOfRoutes = undefined

fact :: Int -> Int
fact n = loop 1 n
  where loop acc x | x == 0 = acc
                   | otherwise = loop (acc * x) (x - 1)
