module Routes (
calculateDistance,
numberOfTrips,
shortestRoute,
numberOfRoutes,
mkRouteIntoGraph,
RouteIntoGraph()
) where

import Data.Graph.Inductive.Graph
import Data.Graph.Inductive.Tree

type Route = LPath String

data RouteIntoGraph = RouteIntoGraph {
  graph :: Gr String Int,
  route :: Route
}

mkRouteIntoGraph :: Gr String Int -> LPath String -> RouteIntoGraph
mkRouteIntoGraph graph route = RouteIntoGraph graph route

calculateDistance :: RouteIntoGraph -> Int
calculateDistance graphRoute = (fromIntegral 1)

numberOfTrips :: RouteIntoGraph -> Int
numberOfTrips = undefined

shortestRoute :: RouteIntoGraph -> Int
shortestRoute = undefined

numberOfRoutes :: RouteIntoGraph -> Int
numberOfRoutes = undefined
