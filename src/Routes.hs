module Routes (
calculateDistance,
numberOfTrips,
shortestRoute,
numberOfRoutes,
) where

import Control.Monad

import Data.Graph.Inductive.Graph
import Data.Graph.Inductive.Tree

import Routes.Internal

calculateDistance :: Gr String Int -> LPath String -> Maybe Int
calculateDistance graph route = foldM (fmap . (+)) 0 allPaths
  where allPaths = map extractLength routePaired
        routePaired = pairLPath route
        extractLength pair = case (findDestination graph pair) of
                                Nothing -> Nothing
                                Just (x,y) -> Just y

numberOfTrips :: Gr String Int -> LPath String -> Int
numberOfTrips = undefined

shortestRoute :: Gr String Int -> LPath String -> Int
shortestRoute = undefined

numberOfRoutes :: Gr String Int -> LPath String -> Int
numberOfRoutes = undefined
