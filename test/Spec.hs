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

testCalculateDistance :: String -> Maybe Int -> Test
testCalculateDistance route result = TestCase (calculateDistance graph (toRoute route) == result @? "Failing")

tests :: Test
tests = TestList [
  TestLabel "testCalculateDistance A-B-C" (testCalculateDistance "ABC" (Just 9)),
  TestLabel "testCalculateDistance A-D" (testCalculateDistance "AD" (Just 5)),
  TestLabel "testCalculateDistance A-D-C" (testCalculateDistance "ADC" (Just 13)),
  TestLabel "testCalculateDistance A-E-B-C-D" (testCalculateDistance "AEBCD" (Just 22)),
  TestLabel "testCalculateDistance A-E-D" (testCalculateDistance "AED" Nothing)
  ]

main :: IO Counts
main = runTestTT tests
