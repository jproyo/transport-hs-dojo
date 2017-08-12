import Routes
import Test.HUnit

testCalculateDistance :: Test
testCalculateDistance = TestCase (True @? "Failing")

tests :: Test
tests = TestList [TestLabel "testCalculateDistance" testCalculateDistance]

main :: IO Counts
main = runTestTT tests
