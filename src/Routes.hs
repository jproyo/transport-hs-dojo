module Routes (
calculateDistance,
numberOfTrips,
shortestRoute,
numberOfRoutes,
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
        extractLength pair = case (findDestination graph pair) of
                                Nothing -> Nothing
                                Just (x,y) -> Just y

numberOfTrips :: Gr String Int -> Node -> Node -> Maybe Int
numberOfTrips graph start finish = undefined

shortestRoute :: Gr String Int -> Node -> Node -> Maybe Int
shortestRoute graph start finish = spLength start finish graph

numberOfRoutes :: Gr String Int -> LPath String -> Int
numberOfRoutes = undefined
