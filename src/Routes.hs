module Routes (
calculateDistance,
numberOfTrips,
shortestRoute,
numberOfRoutes
) where

import Data.Graph.Inductive.Graph
import Data.Graph.Inductive.Tree

type Route = LPath String

data RouteIntoGraph = RouteIntoGraph {
  graph :: Gr String Int,
  route :: Route
}

calculateDistance :: RouteIntoGraph -> Int
calculateDistance graphRoute = (fromIntegral 1)

numberOfTrips :: RouteIntoGraph -> Int
numberOfTrips = undefined

shortestRoute :: RouteIntoGraph -> Int
shortestRoute = undefined

numberOfRoutes :: RouteIntoGraph -> Int
numberOfRoutes = undefined
