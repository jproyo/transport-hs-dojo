module Routes (
calculateDistance,
numberOfTrips,
shortestRoute,
numberOfRoutes,
) where

import Data.Graph.Inductive.Graph
import Data.Graph.Inductive.Tree

import Routes.Internal

calculateDistance :: Gr String Int -> LPath String -> Int
calculateDistance graph route = (fromIntegral 1)

numberOfTrips :: Gr String Int -> LPath String -> Int
numberOfTrips = undefined

shortestRoute :: Gr String Int -> LPath String -> Int
shortestRoute = undefined

numberOfRoutes :: Gr String Int -> LPath String -> Int
numberOfRoutes = undefined
