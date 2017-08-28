import Routes
import Test.HUnit
import Data.Maybe
import Data.Tuple
import qualified Data.Graph.Inductive.Graph as G
import Data.Graph.Inductive.Tree

genLNodes :: [G.LNode String]
genLNodes = zip [1..5] ["A","B","C","D","E"]

swapedNodes :: [(String, Int)]
swapedNodes = map swap genLNodes

lookupNode :: [(String, G.Node)] -> String -> G.LNode String
lookupNode pairs ch = case lookup ch pairs of
  Just val -> (val,ch) :: G.LNode String
  Nothing -> (0,"Z") :: G.LNode String

genLEdges :: [G.LEdge Int]
genLEdges = [(1,2,5),(2,3,4),(3,4,8),(4,3,8),(4,5,6),(1,4,5),(3,5,2),(5,2,3),(1,5,7)]

graph :: Gr String Int
graph = G.mkGraph genLNodes genLEdges

splitString :: String -> [String]
splitString str = map (:[]) str

createRoute :: [String] -> G.LPath String
createRoute str = extractFrom swapedNodes str
    where extractFrom lnodes str = G.LP (map (lookupNode lnodes) str)

toRoute :: String -> G.LPath String
toRoute = createRoute . splitString

pointToIndex :: String -> G.Node
pointToIndex point = fst (lookupNode swapedNodes point)

testCalculateDistance :: String -> Maybe Int -> Test
testCalculateDistance route result = TestCase (assertEqual "testCalculateDistance failed, " (calculateDistance graph (toRoute route)) result)

testCalculateShortestPath :: String -> String -> Maybe Int -> Test
testCalculateShortestPath start finish result = TestCase (assertEqual "testCalculateShortestPath failed, " (shortestRoute graph (pointToIndex start) (pointToIndex finish)) result)

tests :: Test
tests = TestList [
  TestLabel "testCalculateDistance A-B-C" (testCalculateDistance "ABC" (Just 9)),
  TestLabel "testCalculateDistance A-D" (testCalculateDistance "AD" (Just 5)),
  TestLabel "testCalculateDistance A-D-C" (testCalculateDistance "ADC" (Just 13)),
  TestLabel "testCalculateDistance A-E-B-C-D" (testCalculateDistance "AEBCD" (Just 22)),
  TestLabel "testCalculateDistance A-E-D" (testCalculateDistance "AED" Nothing),
  TestLabel "testCalculateShortestPath A to C" (testCalculateShortestPath "A" "C" (Just 9)),
  TestLabel "testCalculateShortestPath B to D" (testCalculateShortestPath "B" "D" (Just 12)),
  TestLabel "testCalculateShortestPath B to Z" (testCalculateShortestPath "B" "Z" Nothing)
  ]

main :: IO Counts
main = runTestTT tests
