import Routes
import Test.HUnit
import Data.Tuple
import qualified Data.Graph.Inductive.Graph as G
import Data.Graph.Inductive.Tree

genLNodes :: [G.LNode String]
genLNodes = zip [1..5] ["A","B","C","D","E"]

swapedNodes :: [(String, Int)]
swapedNodes = map swap genLNodes

lookupNode :: [(String, G.Node)] -> Char -> G.LNode String
lookupNode pairs ch = case lookup ch pairs of
  Just val -> (val,ch) :: G.LNode String
  Nothing -> (0,"Z") :: G.LNode String

genLEdges :: [G.LEdge Int]
genLEdges = [(1,2,5),(2,3,4),(3,4,8),(4,3,8),(4,5,6),(1,4,5),(3,5,2),(5,2,3),(1,5,7)]

graph :: Gr String Int
graph = G.mkGraph genLNodes genLEdges

createRouteGraph :: [Char] -> RouteIntoGraph
createRouteGraph str = mkRouteIntoGraph graph (extractFrom swapedNodes str)
    where extractFrom lnodes str = LP (map (lookupNode lnodes) str)

testCalculateDistance :: String -> Test
testCalculateDistance route = TestCase (createRouteGraph route @? "Failing")

tests :: Test
tests = TestList [TestLabel "testCalculateDistance A-B-C" (testCalculateDistance "ABC")]

main :: IO Counts
main = runTestTT tests
