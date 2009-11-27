-- test_http
--                         wookay.noh at gmail.com

module Main where
import Maybe

import Network.URI
import IO
import Network.HTTP
import Control.Monad.Reader
import Lambdabot.MiniHTTP
import Lambdabot.Url
import Lambdabot.Util

assert_equal expected got =
  case expected == got of
    True -> putStrLn $ "passed: " ++ show expected;
    _ -> putStrLn $ "Assertion failed\nExpected: " ++ show expected
           ++ "\nGot: " ++ show got

forURI :: String -> URI
forURI = fromJust . parseURI

forHtmlTitle :: String -> WebReq (Maybe String)
forHtmlTitle url = do
    contents <- getHtmlPage $ fromJust $ parseURI url
    return $ getHeader "title" contents

--forHtmlPage uri = 
--  let contents = getHtmlPage uri
--  in fromJust $ getHeader "title" contents

forTitle :: String -> Maybe [String]
forTitle url = do
    -- title <- liftIO $ runWebReq (getHtmlPage  $ fromJust $ parseURI url) (Nothing)
    --debugStrLn "a"
    return ["hi"]


type WebReq a = ReaderT Proxy IO a

main = do
  --assert_equal (Nothing) (Just $ forURI "http://google.com")
  assert_equal (Just ["hi"]) (forTitle "http://localhost:8080/")
